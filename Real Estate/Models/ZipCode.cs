﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Real_Estate.Models
{
    public class ZipCode
    {   
        // Primary key
        public int ZipCodeID { get; set; }

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