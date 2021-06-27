using NitcotekAssignmentEntity.Models;
using System.Collections.Generic;

namespace NitcotekAssignmentBLL.Services.JournalEntryService
{
    public interface IJournalEntryService
    {
        List<AccountsChart> GetAccountCharts();
        bool InsertJournalEntryData(List<JournalDetail> journalDetails);
    }
}
