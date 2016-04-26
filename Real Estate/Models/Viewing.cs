﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Real_Estate.Models
{ 
    public class Viewing
    {
        //Primary key
        public int ViewingId { get; set; }

        //Foreign key - One to many 
        public int RealEstateObjectId { get; set; }     
        [ForeignKey("RealEstateObjectId")]
        public RealEstateObject RealEstateObject { get; set; }  //RealEstateObject is empty - Andres does

        //Foreign key - Many to many
        public int PersonId { get; set; }    
        [ForeignKey("PersonId")]
        public ICollection<Customer> Customers { get; set; }

        // Other attributes 
        public DateTime ViewingStart { get; set; }  
        public DateTime ViewingStop { get; set; }   
        public int NbrOfCustomerPerViewing { get; set; }    

        public Viewing()
        {
            Customers = new HashSet<Customer>();
        }
    }
}