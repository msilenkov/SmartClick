import { Module } from '@nestjs/common';
import { AuthsService } from './auths.service';
import { AuthsController } from './auths.controller';
import { UsersModule } from 'src/users/users.module';
import { JwtModule } from '@nestjs/jwt';

@Module({
  providers: [AuthsService],
  controllers: [AuthsController],
  imports:[UsersModule,
  JwtModule.register({
    secret: process.env.PRIVATE_KEY || 'SECRET',
    signOptions: {expiresIn: '48h'}
  })]
})
export class AuthsModule {}
