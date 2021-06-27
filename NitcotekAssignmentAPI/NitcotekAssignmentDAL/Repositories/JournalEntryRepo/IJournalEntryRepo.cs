using NitcotekAssignmentEntity.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NitcotekAssignmentDAL.Repositories.JournalEntryRepo
{
  public interface IJournalEntryRepo
    {
        List<AccountsChart> GetAccountCharts();
        bool InsertJournalDetailsData(List<JournalDetail> journalDetails, JournalHeader journalHeader);
        JournalHeader InsertJournalHeaderData(JournalHeader journalHeader);
    }
}
