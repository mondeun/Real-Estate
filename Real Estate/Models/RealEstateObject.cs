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
        public int RealEstateObjectID { get; set; }

        public ContractType Contract {get; set;}

        public EstateType EstateType { get; set; }

        public virtual Agent Agent { get; set; }

        public virtual Customer Customer { get; set; }

        public int Sqm { get; set; }

        public string Address { get; set; }

        public virtual City City { get; set; }

        public virtual ZipCode ZipCode { get; set; }

        public DateTime DateOnMarket { get; set; }

        public DateTime? SaleDate { get; set; } //Allow nullable? Check this one



    }
}
