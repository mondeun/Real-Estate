using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Real_Estate.Models;

namespace Real_Estate.DAL
{
    public class RealEstateInitializer : DropCreateDatabaseIfModelChanges<RealEstateContext>
    {
        protected override void Seed(RealEstateContext context)
        {
            base.Seed(context);

            var cities = new List<City>
            {
                new City {CityName = "Helsingborg"},
                new City {CityName = "Lund"},
                new City {CityName = "Malmö"},
                new City {CityName = "Stockholm"},
                new City {CityName = "Göteborg"},
                new City {CityName = "Landskrona"},
                new City {CityName = "Ystad"}
            };
            cities.ForEach(c => context.Cities.Add(c));
            context.SaveChanges();

            var zipCodes = new List<ZipCode>
            {
                new ZipCode {ZipCodes = "621 41", PricePerSqm = 4500},
                new ZipCode {ZipCodes = "614 53", PricePerSqm = 8400},
                new ZipCode {ZipCodes = "342 15", PricePerSqm = 6700},
                new ZipCode {ZipCodes = "152 42", PricePerSqm = 3900},
                new ZipCode {ZipCodes = "423 21", PricePerSqm = 5500}
            };
            zipCodes.ForEach(z => context.ZipCodes.Add(z));
            context.SaveChanges();
        }
    }
}