import { Module } from '@nestjs/common';
import { AuthsService } from './auths.service';
import { AuthsController } from './auths.controller';
import { UsersModule } from 'src/users/users.module';
import { JwtModule } from '@nestjs/jwt';
import { AccessTokenStrategy } from './strategies/accessToken.strategy';
import { RefreshTokenStrategy } from './strategies/refreshToken.strategy';
import { ConfigService } from '@nestjs/config';

@Module({
  providers: [AuthsService, AccessTokenStrategy, RefreshTokenStrategy, ConfigService],
  controllers: [AuthsController],
  imports:[UsersModule,
  JwtModule.register({
    secret: process.env.ACCESS_SECRET|| 'SECRET',
    signOptions: {expiresIn: '12h'}
  })]
})
export class AuthsModule {}
