using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Real_Estate
{
    public class Office
    {
        public int OfficeID { get; set; }

        public string  OfficeName { get; set; }

        public int? CityRefID { get; set; }
        [ForeignKey("CityRefID")]

        public int? ZipCodeRefID { get; set; }
        [ForeignKey("ZipCodeRefID")]

        public string Address { get; set; }
    }
}
