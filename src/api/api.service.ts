import { Injectable } from '@nestjs/common';
import { HttpService } from "@nestjs/axios";
import { map, Observable } from 'rxjs';
import { SmsDto } from './smsdto/sms.dto';

@Injectable()
export class ApiService {    
    constructor(private http: HttpService) {}

    smsGenerate(min: number, max: number){
        return Math.floor(Math.random() * (max - min) + min)
    }

    async smsSend(phone: SmsDto){
        const code = this.smsGenerate(1111,9999)
        return this.http
        .get(`https://smsc.ru/sys/send.php?login=???=.???@m&phones=${phone}&mes=Тестовый код ${code}`)
        .pipe(
            map((response) => {return response.data})
        )
    }

}
