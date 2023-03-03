import { Injectable } from '@nestjs/common';
import { HttpService } from "@nestjs/axios";
import { map } from 'rxjs';

@Injectable()
export class ApiService {
    
    url = 'https://smsc.ru/sys/send.php?login=???&psw=.sP2L.kMhXX!C@m&phones=???&mes=Тестовый номер 1234';
    
    constructor(private http: HttpService) {}

    async sendGet(){
        return this.http
        .get(this.url)
        .pipe(
            map((response) => {return response.data})
        )
    }

}
