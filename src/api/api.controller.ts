import { Body, Controller, Get } from '@nestjs/common';
import { ApiService } from './api.service';
import { SmsDto } from './smsdto/sms.dto';

@Controller('api')
export class ApiController {
    constructor(private apiService: ApiService){}

    @Get('phone')
    sendSms(@Body() phone: SmsDto){
        return this.apiService.smsSend(phone)
    }
}
