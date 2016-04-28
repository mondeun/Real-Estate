using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using Real_Estate.Models;

namespace Real_Estate.Migrations
{
    internal sealed class Configuration : DbMigrationsConfiguration<Real_Estate.DAL.RealEstateContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(Real_Estate.DAL.RealEstateContext context)
        {
            context.Cities.AddOrUpdate(x => x.CityID,
                new City {CityID = 1, CityName = "Helsingborg"},
                new City {CityID = 2, CityName = "Lund"},
                new City {CityID = 3, CityName = "Malmö"},
                new City {CityID = 4, CityName = "Stockholm"},
                new City {CityID = 5, CityName = "Göteborg"},
                new City {CityID = 6, CityName = "Landskrona"},
                new City {CityID = 7, CityName = "Ystad"}
                );

            context.ZipCodes.AddOrUpdate(x => x.ZipCodeID,
                new ZipCode {ZipCodeID = 1, ZipCodes = "621 41", PricePerSqm = 4500},
                new ZipCode {ZipCodeID = 2, ZipCodes = "614 53", PricePerSqm = 8400},
                new ZipCode {ZipCodeID = 3, ZipCodes = "342 15", PricePerSqm = 6700},
                new ZipCode {ZipCodeID = 4, ZipCodes = "152 42", PricePerSqm = 3900},
                new ZipCode {ZipCodeID = 5, ZipCodes = "423 21", PricePerSqm = 5500}
                );

            context.Offices.AddOrUpdate(x => x.OfficeID,
                new Office {OfficeID = 1, OfficeName = "Goda Hem", Address = "Storgatan 4", ZipCodeID = 1, CityID = 6},
                new Office {OfficeID = 2, OfficeName = "Sylen", Address = "Eriksväg 23", ZipCodeID = 2, CityID = 7},
                new Office {OfficeID = 3, OfficeName = "Bosses Hörna", Address = "Leifgatan 31", ZipCodeID = 4, CityID = 2}
                );
        }
    }
}
