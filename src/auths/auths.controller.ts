import { Body, Controller, Get, Post, Req, UseGuards } from '@nestjs/common';
import { AccessTokenGuard } from 'src/common/guards/accessToken.guards';
import { CreateUserDto } from 'src/users/dto/create-user.dto';
import { AuthsService } from './auths.service';
import { AuthDto } from './auths/auth.dto';
import { Request } from 'express';
import { RefreshTokenGuard } from 'src/common/guards/refreshToken.guard';

@Controller('auths')
export class AuthsController {

    constructor(private authsService: AuthsService){}

    @Post('singup')
    singUp(@Body() createUserDto: CreateUserDto){
        return this.authsService.singUp(createUserDto)
    }

    @Post('singin')
    singIn(@Body() data: AuthDto){
        return this.authsService.singIn(data)
    }

    @UseGuards(AccessTokenGuard)
    @Get('logout')
    logout(@Req() req: Request) {
      this.authsService.logout(req.user['sub']);
    }

    @UseGuards(RefreshTokenGuard)
    @Get('refresh')
    refreshTokens(@Req() req: Request) {
    const userId = req.user['sub'];
    const refreshToken = req.user['refreshToken'];
    return this.authsService.refreshTokens(userId, refreshToken);
    }

}
