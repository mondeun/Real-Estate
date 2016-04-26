using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Real_Estate.Models
{
    public class Agent : Person
    {
        // Foreign key - One to Many 
        public int OfficeID { get; set; }
        [ForeignKey("OfficeID")]
        public virtual Office Office { get; set; }  //TODO Office is empty - Andres does
    }
}