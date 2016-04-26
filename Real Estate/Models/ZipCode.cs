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
        public string zipCode { get; set; }

        //TODO: Is it OK?
        public ZipCode()
        {
            People = new HashSet<Person>();
            Offices = new HashSet<Office>();
        }
    }
}