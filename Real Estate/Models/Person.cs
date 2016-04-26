﻿using System;
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
        public int ZipCodeID { get; set; }  
         
        [ForeignKey("ZipCodeId")]
        public ZipCode ZipCode { get; set; }

        //Foreign key One to many 
        public int CityID { get; set; } 
            
        [ForeignKey("CityID")]
        public City City { get; set; }  //TODO City is empty - Andres does

        // Other attributes
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Pnr { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }

        

    }
}