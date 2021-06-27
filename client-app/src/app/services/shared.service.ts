import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class SharedService {
  readonly APIUrl = 'https://localhost:44327/api';
  constructor(private http: HttpClient) {}
 postId:any = {}
  GetAutoCompeleteData(): Observable<any[]> {
    return this.http.get<any>(this.APIUrl + '/JournalEntry/GetAccountCharts');
  }

  SubmitJournalData(journalData:Array<any[]>): Observable<any[]> {
    
     
    return this.http.post<any>(this.APIUrl + '/JournalEntry/SubmitJournalData',journalData)
  }
}
