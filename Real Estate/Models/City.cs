using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Real_Estate.Models
{
    public class City
    {
        public City()
        {
            this.Offices = new HashSet<Office>();
            this.Persons = new HashSet<Person>();
        }

        public int CityID { get; set; }
        public string CityName { get; set; }

        public virtual ICollection<Office> Offices { get; set; }
        public virtual ICollection<Person> Persons { get; set; }
    }
}
