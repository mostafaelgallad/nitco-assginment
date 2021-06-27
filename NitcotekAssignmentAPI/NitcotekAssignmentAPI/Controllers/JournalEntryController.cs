using NitcotekAssignmentAPI.Models;
using NitcotekAssignmentBLL.Services.JournalEntryService;
using NitcotekAssignmentEntity.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace NitcotekAssignmentAPI.Controllers
{
    [Route("api/JournalEntry")]
    public class JournalEntryController : ApiController
    {
        private readonly IJournalEntryService _journalEntryService;

        public JournalEntryController(IJournalEntryService journalEntryService)
        {
            _journalEntryService = journalEntryService;
        }


        [Route("api/JournalEntry/GetAccountCharts")]
        [HttpGet]
        public List<AccountsChart> GetAccountCharts()
        {
            return _journalEntryService.GetAccountCharts();
        }

        [Route("api/JournalEntry/SubmitJournalData")]
        [HttpPost]
        public string SubmitJournalData(List<JournalDetail> journalDetails)
        {
            var res = _journalEntryService.InsertJournalEntryData(journalDetails);
            return res == true ? "The data inserted successfully" : "Fail to save the data";
        }
    }
}
