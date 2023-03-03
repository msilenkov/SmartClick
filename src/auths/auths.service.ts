import { BadRequestException, HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt/dist';
import { CreateUserDto} from 'src/users/dto/create-user.dto';
import { UsersService } from 'src/users/users.service';
import * as bcrypt from 'bcryptjs'
import { ConfigService } from '@nestjs/config';
import { AuthDto } from './auths/auth.dto';

@Injectable()
export class AuthsService {

    constructor(private userService: UsersService,
        private jwtService: JwtService, private configService: ConfigService){}

   async singUp(userDto: CreateUserDto){
    //проверка существует ли пользователь
    const hashPhone = await bcrypt.hash(userDto.phone, 1)
    const userExist = await this.userService.getUserbyPhone(hashPhone)
    if(userExist){
        throw new BadRequestException('Пользователь уже существует');
    }


    const newUser = await this.userService.createUser({
        ...userDto, phone: hashPhone,
    })
    const tokens = await this.getTokens(newUser.phone.toString());
    await this.updateRefreshToken(newUser.phone.toString(), tokens.refreshToken);
    return tokens;
   }

   async singIn(data: AuthDto){
    //хешируем номер и проверяем есть ли такой хеш(пользователь)
    const hashPhone = await bcrypt.hash(data.phone, 1)
    const user = await this.userService.getUserbyPhone(hashPhone)
    //кидаем ошибку если такого нет
    if(!user)throw new BadRequestException('User does not exist');
    const tokens = await this.getTokens(user.id.toString());
    await this.updateRefreshToken(user.id.toString(), tokens.refreshToken)
    return tokens;
   }
   async logout(userId: string) {
    return this.userService.update(userId, {refreshToken: null});
  }

  async updateRefreshToken(userId: string, refreshToken: string){
    const hasedRefreshToken = await bcrypt.hash(refreshToken);
    await this.userService.update(userId,{refreshToken: hasedRefreshToken})
  }

 
  async getTokens(userId: string){
    const [accessToken, refreshToken] = await Promise.all([
        this.jwtService.signAsync(
            {sub: userId}, {secret: this.configService.get<string>("ACCESS_SECRET"),
        expiresIn: '15m'}
        ), 
        this.jwtService.signAsync({
            sub: userId
        },
        {
            secret:this.configService.get<string>("REFRESH_SECRET"),
            expiresIn: '60d'
        })
    ]);
    return {accessToken, refreshToken}
  }



    // async registration(userDto: createUserDto){
    //     const candidate = await this.userService.getUserbyPhone(userDto.phone)
    //     if(candidate){
    //          throw new HttpException("Пользователь уже зарегистрирован", HttpStatus.BAD_REQUEST )
    //     }
    //     const hashPhone = await bcrypt.hash(userDto.phone, 1)
    //     const user = await this.userService.createUser({...userDto, phone: hashPhone})
    //     return this.generateToken(user)
    // }

    // private async generateToken(user: User){
    //     const payload = {pass: user.pass, id: user.id}
    //     return {
    //         token: this.jwtService.sign(payload)
    //     }
    // }
}
