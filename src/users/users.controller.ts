import { Body, Controller, Get, Param, Patch, Post } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
    constructor(private userService: UsersService){}

    @Post()
    find(@Body() userDto: CreateUserDto){
        return this.userService.createUser(userDto)
    }
    
    @Patch()
    update(@Param('id') id:string, @Body() userDto: CreateUserDto){
        return this.userService.update(id, userDto)
    }

    @Get()
    findById(@Param('id') id: string){
        return this.userService.getUserbyId(id)
    }

    
    // @Post()
    // create(@Body() userDto: createUserDto){
    //     return this.userService.createUser(userDto)
    // }

    // @Get()
    // getAll(){
    //     return this.userService.getAllUsers()
    // }

}
