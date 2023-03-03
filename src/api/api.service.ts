import { Injectable } from '@nestjs/common';
import { HttpService } from "@nestjs/axios";
import { map } from 'rxjs';

@Injectable()
export class ApiService {
    
    url = 'https://smsc.ru/sys/send.php?login=msilenkov&psw=.sP2L.kMhXX!C@m&phones=79877910110&mes=Тестовый номер 1234';
    
    constructor(private http: HttpService) {}

    async sendGet(){
        return this.http
        .get(this.url)
        .pipe(
            map((response) => {return response.data})
        )
    }

}
