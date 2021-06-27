import {
  Component,
  OnInit,
  AfterContentChecked,
  AfterViewInit,
  OnChanges,
  SimpleChanges,
  Input,
  DoCheck,
} from '@angular/core';

import { SharedService } from 'src/app/services/shared.service';

import * as $ from 'jquery';

@Component({
  selector: 'app-journal-entry',
  templateUrl: './journal-entry.component.html',
  styleUrls: ['./journal-entry.component.css'],
})
export class JournalEntryComponent
  implements OnInit, AfterContentChecked, AfterViewInit, DoCheck
{
  constructor(private service: SharedService) {}

  //#region  variables
  autoCompeleteData!: any[];
  //coulumNumber: number = 5;
  Debit: number = 0;
  Creditor: number = 0;
  public rowCount: Array<any> = [];
  public newAttribute: any = {};
  //#endregion

  //#region lifeCycle hooks
  //on init
  ngOnInit(): void {
    this.GetAutoCompeleteData();
    let rowCountFromLocalStorage = localStorage.getItem('rowCount');
    this.rowCount =
      new Array(JSON.parse(rowCountFromLocalStorage!)) || new Array(5);
  }
  ngDoCheck(): void {
    this.saveDataLocalStorage();
  }
  //after content checked
  ngAfterContentChecked(): void {
    this.updateValues();
  }
  //after view init
  ngAfterViewInit(): void {}
  //after view checked
  ngAfterViewChecked() {
    this.addTableEvents();
  }
  //#endregion

  addTableEvents() {
    const table: any = document.querySelector('#tableID');
    var rows = table.tBodies[0].children;
    Array.from(rows).forEach((row: any, idx: any) => {
      $('#Debit_' + idx).on('change', () => {
        $('#Creditor_' + idx).val(0);
        $('.Debit_span_' + idx).hide();
      });
      $('#Creditor_' + idx).on('change', () => {
        $('#Debit_' + idx).val(0);
        $('.Debit_span_' + idx).hide();
      });
      $('#accountName_' + idx).on('change', () => {
        $('.accountName_span_' + idx).hide();
      });
      $('#accountNumber_' + idx).on('change', () => {
        $('.accountNumber_span_' + idx).hide();
      });
    });
  }
  addFieldValue() {
    for (var i = 0; i < 5; i++) {
      this.rowCount.push(this.newAttribute);
      this.newAttribute = {};
    }
  }
  deleteFieldValue(index: any) {
    if (confirm('Are you sure to delete ')) {
      $('#Creditor_' + index).val(0);
      $('#Debit_' + index).val(0);
      this.updateValues();
      $('#rowID_' + index).remove();
      this.rowCount.splice(index, 1);
    }
  }
  setLocalStorageData() {
    let Localdata = localStorage.getItem('rowValues');
    if (Localdata) {
      let parsedData = JSON.parse(Localdata);
      const table: any = document.querySelector('#tableID');
      var rows = table.tBodies[0].rows;
      Array.from(rows).forEach((row: any, idx: any) => {
        $('#Creditor_' + idx).val(parsedData[idx].Creditor);
        $('#Debit_' + idx).val(parsedData[idx].Debit);
        $('#accountNumber_' + idx).val(parsedData[idx].AccountNumber);
        $('#accountName_' + idx).val(parsedData[idx].AccountName);
        $('#description_' + idx).val(parsedData[idx].Description);
        $('#seller_' + idx).val(parsedData[idx].Seller);
      });
    }
  }
  saveDataLocalStorage() {
    const table: any = document.querySelector('#tableID');
    var rows = table.tBodies[0].rows;
    let rowdata: any[] = [];
    Array.from(rows).forEach((row: any, idx: any) => {
      var rowvalue: any = {};
      rowvalue.Creditor = $('#Creditor_' + idx).val();
      rowvalue.Debit = $('#Debit_' + idx).val();
      rowvalue.AccountNumber = $('#accountNumber_' + idx).val();
      rowvalue.AccountName = $('#accountName_' + idx).val();
      rowvalue.Description = $('#description_' + idx).val();
      rowvalue.Seller = $('#seller_' + idx).val();
      rowdata.push(rowvalue);
    });
    localStorage.setItem('rowCount', JSON.stringify(this.rowCount.length));
    localStorage.setItem('rowValues', JSON.stringify(rowdata));
    console.log('local data', localStorage.getItem('rowValues'));
  }
  saveJournalEntryData() {
    if (this.Debit - this.Creditor === 0) {
      const table: any = document.querySelector('#tableID');
      var rows = table.tBodies[0].rows;
      let rowdata: any[] = [];
      var valid = false;
      Array.from(rows).forEach((row: any, idx: any) => {
        var rowvalue: any = {};
        if (
          $('#Creditor_' + idx).val() === '' ||
          $('#Debit_' + idx).val() === ''
        ) {
          $('.Debit_span_' + idx).show();
        }
        if ($('#accountName_' + idx).val() === '') {
          $('.accountName_span_' + idx).show();
        }
        if ($('#accountNumber_' + idx).val() === '') {
          $('.accountNumber_span_' + idx).show();
        } else {
          valid = true;
          rowvalue.Creditor = $('#Creditor_' + idx).val();
          rowvalue.Debit = $('#Debit_' + idx).val();
          rowvalue.AccountNumber = $('#accountNumber_' + idx).val();
          rowvalue.AccountName = $('#accountName_' + idx).val();
          rowvalue.Description = $('#description_' + idx).val();
          rowvalue.Seller = $('#seller_' + idx).val();
          rowdata.push(rowvalue);
        }
      });
      if (!valid) {
        alert('some feilds is required');
      } else {
        this.service.SubmitJournalData(rowdata).subscribe((res: any) => {
          if ((res as string) === 'The data inserted successfully') {
            localStorage.removeItem('rowCount');
            localStorage.removeItem('rowValues');
            alert(res);
            window.location.reload();
          } else {
          }
        });
      }
    }
  }
  updateValues() {
    this.Debit = 0;
    this.Creditor = 0;
    $('[id^="Creditor_"]').each((index: any) => {
      let creditorvalue = $('#Creditor_' + index).val();
      if (creditorvalue) {
        try {
          this.Creditor += parseInt(creditorvalue as string);
        } catch {}
      }
    });
    $('[id^="Debit_"]').each((index: any) => {
      let debitvalue = $('#Debit_' + index).val();
      if (debitvalue) {
        try {
          this.Debit += parseInt(debitvalue as string);
        } catch {}
      }
    });
  }
  GetAutoCompeleteData() {
    this.service.GetAutoCompeleteData().subscribe((res) => {
      this.autoCompeleteData = res;
    });
  }
}
