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
    public enum ContractType
    {
        Condo,
        Rental,
        Residential

    }
    public enum EstateType
    {
        House,
        Apartment,
        Garage
    }
    public class RealEstateObject
    {
        public int RealStateObjectID { get; set; }

        public ContractType Contract {get; set;}

        public EstateType EstateType { get; set; }

        public int? AgentRefID { get; set; }
        [ForeignKey("AgentRefID")]

        public int sqm { get; set; }

        public string Address { get; set; }

        public int? CityRefID { get; set; }
        [ForeignKey("CityRefID")]

        public int? ZipCodeRefID { get; set; }
        [ForeignKey("ZipCodeRefID")]

        public DateTime DateOnMarket { get; set; }

        public DateTime? SaleDate { get; set; } //Allow nullable? Check this one

        public bool Sold { get; set; }


    }
}
