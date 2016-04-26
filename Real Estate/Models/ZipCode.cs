using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealEstateManagmentSystem
{
    public class ZipCode
    {   
        // Primary key
        public int ZipCodeId { get; set; }

        public ICollection<Person> People { get; set; } //TODO: Is it OK?

        //Other attributes
        public string ZipCodes { get; set; }

        //TODO: Is it OK?
        public ZipCode()
        {
            People = new HashSet<Person>();
        }
    }
}