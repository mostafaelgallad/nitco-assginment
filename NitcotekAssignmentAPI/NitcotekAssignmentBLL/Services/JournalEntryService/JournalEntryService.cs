using NitcotekAssignmentDAL.Repositories.JournalEntryRepo;
using NitcotekAssignmentEntity.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NitcotekAssignmentBLL.Services.JournalEntryService
{
   public class JournalEntryService : IJournalEntryService
    {
        private readonly IJournalEntryRepo _journalEntryRepo;

        public JournalEntryService(IJournalEntryRepo journalEntryRepo)
        {
            _journalEntryRepo = journalEntryRepo;
        }

        public List<AccountsChart> GetAccountCharts()
        {
            return _journalEntryRepo.GetAccountCharts();
        }

        public bool InsertJournalEntryData(List<JournalDetail> journalDetails)
        {
            Random rnd = new Random();
            int number = rnd.Next(1, 99999);
            JournalHeader header = new JournalHeader()
            {
                ReferenceNumber = "RF-" + number,
                DateOfEntry =  DateTime.Now
            };
            var insertedJournalHeader = _journalEntryRepo.InsertJournalHeaderData(header);
            
            var result = _journalEntryRepo.InsertJournalDetailsData(journalDetails, insertedJournalHeader);
            return result;
        }
    }
}
