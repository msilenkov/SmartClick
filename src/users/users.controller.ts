import { Body, Controller, Get, Param, Patch, Post, UseGuards } from '@nestjs/common';
import { AccessTokenGuard } from 'src/common/guards/accessToken.guards';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
    constructor(private userService: UsersService){}

    @Get()
    findAll(){
        return this.userService.findAll()
    }

    @Post()
    find(@Body() userDto: CreateUserDto){
        return this.userService.createUser(userDto)
    }
    
    @UseGuards(AccessTokenGuard)
    @Patch(':id')
    update(@Param(':id') id:number, @Body() userDto: UpdateUserDto){
        return this.userService.update(id, userDto)
    }

    @Get(':id')
    findById(@Param(':id') id: string){
        return this.userService.getUserbyId(id)
    }

}
