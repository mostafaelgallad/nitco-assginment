//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NitcotekAssignmentEntity.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class JournalDetail
    {
        public int JournalDetailsID { get; set; }
        public Nullable<int> FK_JournalHeadrer_ID { get; set; }
        public Nullable<int> Creditor { get; set; }
        public Nullable<int> Debit { get; set; }
        public string AccountNumber { get; set; }
        public string AccountName { get; set; }
        public string Description { get; set; }
        public string Seller { get; set; }
    
        public virtual JournalHeader JournalHeader { get; set; }
    }
}