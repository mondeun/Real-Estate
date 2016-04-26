﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Real_Estate.Models
{
    public class Office
    {
        public Office()
        {
            
        }
        public int OfficeID { get; set; }

        public string  OfficeName { get; set; }

        public virtual City City { get; set; }

        public virtual ZipCode ZipCode { get; set; }

        public string Address { get; set; }

       
    }
}
