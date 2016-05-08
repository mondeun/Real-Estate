using System;
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
        public int OfficeID { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Office name is required")]
        public string  OfficeName { get; set; }

        public int? CityID { get; set; }
        [Column("CityID")]
        public virtual City City { get; set; }

        public int? ZipCodeID { get; set; }
        public virtual ZipCode ZipCode { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Address is required")]
        public string Address { get; set; }
    }
}
