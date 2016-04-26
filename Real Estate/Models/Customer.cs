using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Real_Estate.Models
{
    public class Customer : Person
    {
        // Foreign key - Many to many
        public int ViewingId { get; set; }
        [ForeignKey("ViewingId")]
        public ICollection<Viewing> Viewings { get; set; }

        public Customer()
        {
            Viewings = new HashSet<Viewing>();
        }
    }
}