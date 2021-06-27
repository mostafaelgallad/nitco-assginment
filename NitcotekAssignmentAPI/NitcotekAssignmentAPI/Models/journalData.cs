using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NitcotekAssignmentAPI.Models
{
    public class journalData
    {
        public string Creditor { get; set; }
        public int Debit { get; set; }
        public string AccountNumber { get; set; }
        public string AccountName { get; set; }
        public string Description { get; set; }
        public string Seller { get; set; }
    }
}