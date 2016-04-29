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

        //Foreign key - One to many 
        public int? RealEstateObjectID { get; set; }
        [ForeignKey("RealEstateObjectID")]
        public virtual RealEstateObject RealEstateObject { get; set; }

        //Foreign key - Many to many
        public int? AgentID { get; set; }
        [ForeignKey("AgentID")]
        public virtual Agent Agent { get; set; }
        
        [Required(ErrorMessage = "Set when the viewing begin")]
        [DataType(DataType.DateTime)]
        public DateTime ViewingStart { get; set; }

        [Required(ErrorMessage = "Set when the viewing end")]
        [DataType(DataType.DateTime)]
        public DateTime ViewingStop { get; set; }   

        [Required(ErrorMessage = "Max number of customer viewings are required")]
        public int MaximumNoCustomerPerViewing { get; set; }

        public virtual ICollection<Customer> Customers { get; set; }
    }
}