import { Body, Controller, Get, Post, Req } from '@nestjs/common';
import { CreateUserDto } from 'src/users/dto/create-user.dto';
import { AuthsService } from './auths.service';
import { AuthDto } from './auths/auth.dto';

@Controller('auths')
export class AuthsController {

    constructor(private authsService: AuthsService){}

    @Post('singup')
    singUp(@Body() createUserDto: CreateUserDto){
        return this.authsService.singUp(createUserDto)
    }

    @Post('signIn')
    singIn(@Body() data: AuthDto){
        return this.authsService.singIn(data)
    }

    // @Get('logout')
    // logout(@Req() req: Request){
    //     this.authsService.logout(req.user['sub'])
    // }




    // @Post('/login')
    // login(@Body() userDto: CreateUserDto){
    //     return this.authsService.login(userDto)
    // }

    // @Post('/registration')
    // registration(@Body() userDto: CreateUserDto){
    //     return this.authsService.registration(userDto)

    // }

}
