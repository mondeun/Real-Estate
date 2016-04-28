using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Real_Estate.Models
{
    public class ZipCode
    {   
        // Primary key
        public int ZipCodeID { get; set; }

        public virtual ICollection<Person> People { get; set; } 
        public virtual ICollection<Office> Offices { get; set; }

        //Other attributes
        public string ZipCodes { get; set; }

        public decimal PricePerSqm { get; set; }
    }
}