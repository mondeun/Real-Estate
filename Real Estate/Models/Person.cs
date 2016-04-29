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
        public int ZipCodeID { get; set; }

        public virtual ZipCode ZipCode { get; set; }

        public int CityID { get; set; }
        //Foreign key One to many 
        public virtual City City { get; set; }  //TODO City is empty - Andres does

        // Other attributes
        [Required(ErrorMessage = "First name is required")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last name is required")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Personal number is required")]
        public string Pnr { get; set; }

        [Required(ErrorMessage = "Address is required")]
        public string Address { get; set; }

        [Required(ErrorMessage = "Email address is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }

        public string FullName
        {

            get { return FirstName + " " + LastName; }

        }

        

    }
}