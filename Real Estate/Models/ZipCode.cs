using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Real_Estate.Models
{
    public class ZipCode
    {   
        public int ZipCodeID { get; set; }

        public virtual ICollection<Person> People { get; set; } 
        public virtual ICollection<Office> Offices { get; set; }

        [Required(ErrorMessage = "Zip code is required")]
        public string ZipCodes { get; set; }

        [Required(ErrorMessage = "Set price per square meter")]
        public decimal PricePerSqm { get; set; }
    }
}