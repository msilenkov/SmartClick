import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt/dist';
import { createUserDto } from 'src/users/dto/create-user.dto';
import { UsersService } from 'src/users/users.service';
import * as bcrypt from 'bcryptjs'
import { User } from 'src/users/users.model';

@Injectable()
export class AuthsService {

    constructor(private userService: UsersService,
        private jwtService: JwtService){}

    async login(userDto: createUserDto){
        const user = await this.validateUser(userDto)
        return this.generateToken(user)
    }

    private async validateUser(userDto: createUserDto) {
        const user = await this.userService.getUserbyPhone(userDto.pass)
    }

    async registration(userDto: createUserDto){
        const candidate = await this.userService.getUserbyPhone(userDto.phone)
        if(candidate){
             throw new HttpException("Пользователь уже зарегистрирован", HttpStatus.BAD_REQUEST )
        }
        const hashPhone = await bcrypt.hash(userDto.phone, 1)
        const user = await this.userService.createUser({...userDto, phone: hashPhone})
        return this.generateToken(user)
    }

    private async generateToken(user: User){
        const payload = {pass: user.pass, id: user.id}
        return {
            token: this.jwtService.sign(payload)
        }
    }
}
