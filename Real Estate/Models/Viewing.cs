using System;
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
        public int ViewingID { get; set; }

        public int? RealEstateObjectID { get; set; }

        //Foreign key - One to many 
        [ForeignKey("RealEstateObjectID")]
        public virtual RealEstateObject RealEstateObject { get; set; }  //RealEstateObject is empty - Andres does

        //Foreign key - Many to many
        public int? AgentID { get; set; }

        [ForeignKey("AgentID")]

        public virtual Agent Agent { get; set; }
        // Other attributes 
        public DateTime ViewingStart { get; set; }  
        public DateTime ViewingStop { get; set; }   
        public int MaximumNoCustomerPerViewing { get; set; }
        public virtual ICollection<Customer> Customers { get; set; }
    }
}