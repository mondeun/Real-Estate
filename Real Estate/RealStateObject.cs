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
     public  class RealStateObject
    {
        public int RealStateObjectID { get; set; }

        public int? TypeOfContractRefID { get; set; }
        [ForeignKey("TypeOfContractRefID")]

        public int? EstateTypeRefID { get; set; }
        [ForeignKey("EstateTypeRefID")]

        public int? AgentRefID { get; set; }
        [ForeignKey("AgentRefID")]

        public int sqm { get; set; }

        public string Address { get; set; }

        public int? CityRefID { get; set; }
        [ForeignKey("CityRefID")]

        public int? ZipCodeRefID { get; set; }
        [ForeignKey("ZipCodeRefID")]

        public DateTime DateOnMarket { get; set; }

        public DateTime SaleDate { get; set; }

        public bool Sold { get; set; }


    }
}
