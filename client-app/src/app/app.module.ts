import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { JournalEntryComponent } from './components/journal-entry/journal-entry.component';
import { SharedService } from './services/shared.service';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [AppComponent, JournalEntryComponent],
  imports: [BrowserModule, AppRoutingModule, HttpClientModule],
  providers: [SharedService],
  bootstrap: [AppComponent],
})
export class AppModule {}
