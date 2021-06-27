using NitcotekAssignmentEntity.Models;
using System.Collections.Generic;
using System.Linq;

namespace NitcotekAssignmentDAL.Repositories.JournalEntryRepo
{
    public class JournalEntryRepo : IJournalEntryRepo
    {
        fCarePlusEntities db = new fCarePlusEntities();
        public List<AccountsChart> GetAccountCharts()
        {
            return db.AccountsCharts.ToList();
        }

        public JournalHeader InsertJournalHeaderData(JournalHeader journalHeader)
        {
            try
            {
               var insertedJournalHeader =  db.JournalHeaders.Add(journalHeader);
                db.SaveChanges();
                return insertedJournalHeader;
            }
            catch (System.Exception)
            {
                return null;
            }
        }

        public bool InsertJournalDetailsData(List<JournalDetail> journalDetails, JournalHeader journalHeader)
        {
            try
            {
                foreach (var item in journalDetails)
                {
                    item.FK_JournalHeadrer_ID = journalHeader.JournalHeadrerID;
                    db.JournalDetails.Add(item);
                }
                db.SaveChanges();
                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }
    }
}
