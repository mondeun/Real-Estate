using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Real_Estate.Models
{
    public class City
    {

        public int CityID { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "City is required")]
        public string CityName { get; set; }

        public virtual ICollection<Office> Offices { get; set; }
        public virtual ICollection<Person> Persons { get; set; }
    }
}
