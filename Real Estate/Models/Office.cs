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
        public Office()
        {
            this.Cities = new HashSet<City>();
        }
        public int OfficeID { get; set; }

        public string  OfficeName { get; set; }

        public int CityRefID { get; set; }

        [ForeignKey("CityRefID")]
        public virtual City City { get; set; }

        public int ZipCodeRefID { get; set; }

        [ForeignKey("ZipCodeRefID")]
        public virtual ZipCode ZipCode { get; set; }

        public string Address { get; set; }

        public ICollection<City> Cities { get; set; }
    }
}
