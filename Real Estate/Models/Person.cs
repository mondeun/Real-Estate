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

        // Foreign key One to many 
        public int ZipCodeID { get; set; }
        public virtual ZipCode ZipCode { get; set; }

        // Foreign key One to many 
        public int CityID { get; set; }
        public virtual City City { get; set; }

        // Other attributes
        [StringLength(50)]
        [Required(ErrorMessage = "First name is required")]
        public string FirstName { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Last name is required")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Personal number is required")]
        [StringLength(10, ErrorMessage = "Enter personal number as YYMMDDXXXX", MinimumLength = 10)]
        public string Pnr { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Address is required")]
        public string Address { get; set; }

        [Required(ErrorMessage = "Email address is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }

        public string FullName => FirstName + " " + LastName;
    }
}