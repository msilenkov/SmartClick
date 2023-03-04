import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { User } from './users.model';

@Injectable()
export class UsersService {

    constructor(@InjectModel(User) private userRepository: typeof User){}

    async findAll(){
        const users = await this.userRepository.findAll()
        return users
    }


    async createUser(dto: CreateUserDto){
        const user = await this.userRepository.create(dto);
        return user;
    }

    async getUserbyId(id: string){
        const user = await this.userRepository.findOne({
            where: {id: id}
        })
        return user; 
    }

    async getUserbyPhone(phone: string){
        const user = await this.userRepository.findOne({
            where: {phone: phone}
        })
        return user;        
    }

    async update(id: number, dto: UpdateUserDto){
        const user = await this.userRepository.findOne({where: {id: id}})
        if(user){
            await this.userRepository.update({refreshtoken0: dto.refreshToken}, {where:{id:id}})
        }

        // const user = await this.userRepository.upsert({id: id, refreshtoken0: dto.refreshToken})
        return user;
    }
}
