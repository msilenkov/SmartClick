import { Body, Controller, Post } from '@nestjs/common';
import { createUserDto } from 'src/users/dto/create-user.dto';
import { AuthsService } from './auths.service';

@Controller('auths')
export class AuthsController {

    constructor(private authsService: AuthsService){}

    @Post('/login')
    login(@Body() userDto: createUserDto){
        return this.authsService.login(userDto)
    }

    @Post('/registration')
    registration(@Body() userDto: createUserDto){
        return this.authsService.registration(userDto)

    }

}
