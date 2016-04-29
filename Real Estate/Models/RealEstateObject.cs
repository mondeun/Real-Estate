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

        public int? AgentID { get; set; }
        [ForeignKey("AgentID")]
        public virtual Agent Agent { get; set; }

        public int? CustomerID { get; set; }
        [ForeignKey("CustomerID")]
        public virtual Customer Customer { get; set; }

        [Required(ErrorMessage = "Square meters are required")]
        public int Sqm { get; set; }

        [Required(ErrorMessage = "Address is required")]
        public string Address { get; set; }

        public int CityID { get; set; }
        public virtual City City { get; set; }

        public int ZipCodeID { get; set; }
        public virtual ZipCode ZipCode { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateOnMarket { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? SaleDate { get; set; } //Allow nullable? Check this one

        public virtual ICollection<Viewing> Viewings { get; set; }
    }
}
