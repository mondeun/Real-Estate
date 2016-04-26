using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Real_Estate.Models
{
    public class Person
    {
        // Primary key
        public int PersonID { get; set; }

        //Foreign key One to many 
        public virtual ZipCode ZipCode { get; set; }

        //Foreign key One to many 
        public virtual City City { get; set; }  //TODO City is empty - Andres does

        // Other attributes
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Pnr { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }

        

    }
}