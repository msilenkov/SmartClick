import { BadRequestException, ForbiddenException, HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt/dist';
import { CreateUserDto} from 'src/users/dto/create-user.dto';
import { UsersService } from 'src/users/users.service';
import * as argon2 from 'argon2';
import { ConfigService } from '@nestjs/config';
import { AuthDto } from './auths/auth.dto';
import { HttpService } from '@nestjs/axios';
import { firstValueFrom } from 'rxjs';

@Injectable()
export class AuthsService {

    constructor(private userService: UsersService,
        private jwtService: JwtService, private configService: ConfigService, private http: HttpService){}

   async singUp(userDto: CreateUserDto){
    //проверка существует ли пользователь
    // const hashPhone = await this.hashData(userDto.phone)
    
    // const userExist = await argon2.verify(userDto.phone, hashPhone)
    const userExist = await this.userService.getUserbyPhone(userDto.phone)
    if(userExist){
        throw new BadRequestException('Пользователь уже существует');
    }
    const code = this.smsGenerate(1111,9999).toString()
    console.log(userDto.phone, code)

    const pass = await this.smsSend(userDto.phone, code)
    console.log(pass)

    const newUser = await this.userService.createUser({
        ...userDto, phone: userDto.phone, pass: code
    })
    const tokens = await this.getTokens(newUser.id.toString(), newUser.phone);
    await this.updateRefreshToken(newUser.id, tokens.refreshToken);
    return tokens;
   }

   async singIn(data: AuthDto){
    // проверяем есть ли такой пользователь и верен ли код
    const user = await this.userService.getUserbyPhone(data.phone)
    //кидаем ошибку если такого нет
    if(!user)throw new BadRequestException('Пользователь не существует');
    // кидаем ошибку если пароль не верный
    const userPswd = await this.userService.getUserbyPhone(data.phone)
    if(userPswd.pass != data.pass)throw new BadRequestException('Код не верный');

    const tokens = await this.getTokens(user.id.toString(),user.phone);
    await this.updateRefreshToken(user.id, tokens.refreshToken)
    await this.userService.remPass(user.id, {pass: null})
    return tokens;
   }

   async logout(userId: number) {
    return this.userService.update(userId, {refreshToken: null});
  }

  async smsSend(phone: string, code: string){
    const login = process.env.SMS_LOGIN
    const pswd = process.env.SMS_PSWD

    const url = 'https://smsc.ru/sys/send.php?login='+login+'&psw='+pswd+'&phones='+phone+'&mes=Тестовый код '+code;

    console.log(url)
    const response =await firstValueFrom(this.http.get(url)) ;
    return response.data
}

  smsGenerate(min: number, max: number){
    return Math.floor(Math.random() * (max - min) + min)
  }
  async updateRefreshToken(userId: number, refreshToken: string){
    const hasedRefreshToken = await this.hashData(refreshToken);
    await this.userService.update(userId,{refreshToken: hasedRefreshToken})
  }

  hashData(data: string) {
    return argon2.hash(data);
  }
  async getTokens(userId: string, userPhone: string){
    const [accessToken, refreshToken] = await Promise.all([
        this.jwtService.signAsync({
            sub: userId, 
            userPhone
        }, 
        {
            secret: this.configService.get<string>("ACCESS_SECRET"),
            expiresIn: '15m'
         }
            ), 
        this.jwtService.signAsync({
            sub: userId,
            userPhone
        },
        {
            secret:this.configService.get<string>("REFRESH_SECRET"),
            expiresIn: '60d'
        })
    ]);
    return {accessToken, refreshToken}
  }

  async refreshTokens(userId: string, refreshToken: string){
    const user = await this.userService.getUserbyId(userId);
    if(!user || !user.refreshtoken0)
        throw new ForbiddenException('Отказано в доступе');
    const refreshTokenMatches = await argon2.verify(
        user.refreshtoken0,
        refreshToken,
    );
    if (!refreshTokenMatches) throw new ForbiddenException('Отказано в доступе');
  const tokens = await this.getTokens(user.id.toString(), user.phone);
  await this.updateRefreshToken(user.id, tokens.refreshToken);
  return tokens;

  }

}
