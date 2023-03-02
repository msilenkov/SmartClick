import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { createUserDto } from './dto/create-user.dto';
import { User } from './users.model';

@Injectable()
export class UsersService {

    constructor(@InjectModel(User) private userRepository: typeof User){}

    async createUser(dto: createUserDto){
        const user = await this.userRepository.create(dto);
        return user;
    }

    async getUserbyPhone(phone: string){
        const user = await this.userRepository.findOne({
            where: {phone: phone}
        })
        return user;        
    }

    // async updateUser(dto: createUserDto){
    //     const user = await this.userRepository.update({pass: dto.pass}, {where: {phone: dto.phone}})
    //     return user;
    // }

    // async findOrCreateUser(dto: createUserDto){
    //     const user = await this.userRepository.findOrCreate({
    //         where:{phone: dto.phone, pass: dto.pass},
    //     })
    //     return user;
    // }


    // async getAllUsers(){
    //     const users = await this.userRepository.findAll();
    //     return users;
    // }



}
