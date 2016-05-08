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

            context.Agents.AddOrUpdate(x => x.PersonID,
                new Agent
                {
                    PersonID = 1,
                    FirstName = "Leif",
                    LastName = "Nilsson",
                    Pnr = "1234567896",
                    Address = "Gnidstigen 84",
                    ZipCodeID = 2,
                    CityID = 3,
                    Email = "kaptenskutan@hotmail.se",
                    OfficeID = 2
                },
                new Agent
                {
                    PersonID = 2,
                    FirstName = "Runar",
                    LastName = "Gunnarsson",
                    Pnr = "5634214635",
                    Address = "Asgatan 69",
                    ZipCodeID = 4,
                    CityID = 4,
                    Email = "bayern_1337@gmail.com",
                    OfficeID = 2
                },
                new Agent
                {
                    PersonID = 3,
                    FirstName = "Michael",
                    LastName = "Glaustratte",
                    Pnr = "8604042413",
                    Address = "Kolonigatan 29",
                    ZipCodeID =  1,
                    CityID = 6,
                    Email = "bois_sm_gold@hotmail.com",
                    OfficeID = 1
                });

            context.Customers.AddOrUpdate(x => x.PersonID,
                new Customer
                {
                    PersonID = 4,
                    FirstName = "Glenn",
                    LastName = "Killing",
                    Pnr = "7407135646",
                    Address = "Flygargatan 7B",
                    ZipCodeID = 2,
                    CityID = 3,
                    Email = "torskjagare@yahoo.com"
                },
                new Customer
                {
                    PersonID = 5,
                    FirstName = "Stefan",
                    LastName = "Karlsson",
                    Pnr = "8311256479",
                    Address = "Fiskargränden 9",
                    ZipCodeID = 4,
                    CityID = 5,
                    Email = "steffe.karlsson@hotmail.com"
                },

                new Customer
                {
                    PersonID = 6,
                    FirstName = "Gunilla",
                    LastName = "Larsson",
                    Pnr = "7712063542",
                    Address = "Lingonstigen 12",
                    ZipCodeID = 3,
                    CityID = 4,
                    Email = "larsson1977@gmail.com"
                },
                new Customer
                {
                    PersonID = 7,
                    FirstName = "Sven",
                    LastName = "Karlsson",
                    Pnr = "8203159642",
                    Address = "Pickolagränd 3",
                    ZipCodeID = 1,
                    CityID = 1,
                    Email = "larsson1977@gmail.com"
                },
                new Customer
                {
                    PersonID = 8,
                    FirstName = "Erik",
                    LastName = "Nordfeldt",
                    Pnr = "8910159222",
                    Address = "Storgatan 33B",
                    ZipCodeID = 4,
                    CityID = 4,
                    Email = "larsson1977@gmail.com"
                }
                );

            context.RealEstateObjects.AddOrUpdate(x => x.RealEstateObjectID,
                new RealEstateObject
                {
                    RealEstateObjectID = 1,
                    Contract = ContractType.Condo,
                    EstateType = EstateType.Apartment,
                    AgentID = 1,
                    CustomerID = 5,
                    Sqm = 88,
                    Address = "Rökerigatan 27",
                    ZipCodeID = 2,
                    CityID = 2,
                    DateOnMarket = new DateTime(2016, 4, 15),
                    SaleDate = null
                },
                new RealEstateObject
                {
                    RealEstateObjectID = 2,
                    Contract = ContractType.Rental,
                    EstateType = EstateType.Apartment,
                    AgentID = 2,
                    CustomerID = 6,
                    Sqm = 120,
                    Address = "Sturegatan 16",
                    ZipCodeID = 2,
                    CityID = 4,
                    DateOnMarket = new DateTime(2016, 3, 9),
                    SaleDate = new DateTime(2016, 3, 21)
                },
                new RealEstateObject
                {
                    RealEstateObjectID = 3,
                    Contract = ContractType.Residential,
                    EstateType = EstateType.House,
                    AgentID = 1,
                    CustomerID = 5,
                    Sqm = 180,
                    Address = "Strandvägen 57",
                    ZipCodeID = 1,
                    CityID = 6,
                    DateOnMarket = new DateTime(2015, 11, 27),
                    SaleDate = null
                },
                new RealEstateObject
                {
                    RealEstateObjectID = 4,
                    Contract = ContractType.Residential,
                    EstateType = EstateType.House,
                    AgentID = 2,
                    CustomerID = 8,
                    Sqm = 22,
                    Address = "Södergatan 81",
                    ZipCodeID = 5,
                    CityID = 4,
                    DateOnMarket = new DateTime(2015, 05, 12),
                    SaleDate = new DateTime(2016, 02, 25)
                }
                );

            context.Viewings.AddOrUpdate(x => x.ViewingID,
                new Viewing
                {
                    ViewingID = 1,
                    RealEstateObjectID = 1,
                    AgentID = 1,
                    ViewingStart = new DateTime(2016, 4, 22, 13, 0, 0),
                    ViewingStop = new DateTime(2016, 4, 22, 16, 0, 0),
                    MaximumNoCustomerPerViewing = 5
                },
                new Viewing
                {
                    ViewingID = 2,
                    RealEstateObjectID = 1,
                    AgentID = 1,
                    ViewingStart = new DateTime(2016, 4, 22, 16, 0, 0),
                    ViewingStop = new DateTime(2016, 4, 22, 18, 0, 0),
                    MaximumNoCustomerPerViewing = 5
                },
                new Viewing
                {
                    ViewingID = 3,
                    RealEstateObjectID = 1,
                    AgentID = 1,
                    ViewingStart = new DateTime(2016, 5, 22, 13, 0, 0),
                    ViewingStop = new DateTime(2016, 5, 22, 16, 0, 0),
                    MaximumNoCustomerPerViewing = 5
                },
                new Viewing
                {
                    ViewingID = 4,
                    RealEstateObjectID = 1,
                    AgentID = 1,
                    ViewingStart = new DateTime(2016, 5, 22, 16, 0, 0),
                    ViewingStop = new DateTime(2016, 5, 22, 18, 0, 0),
                    MaximumNoCustomerPerViewing = 5
                },
                new Viewing
                {
                    ViewingID = 5,
                    RealEstateObjectID = 3,
                    AgentID = 2,
                    ViewingStart = new DateTime(2016, 01, 05, 15, 30, 0),
                    ViewingStop = new DateTime(2016, 01, 05, 18, 0, 0),
                    MaximumNoCustomerPerViewing = 10
                },
                new Viewing
                {
                    ViewingID = 6,
                    RealEstateObjectID = 3,
                    AgentID = 2,
                    ViewingStart = new DateTime(2016, 01, 05, 13, 0, 0),
                    ViewingStop = new DateTime(2016, 01, 05, 15, 0, 0),
                    MaximumNoCustomerPerViewing = 10
                }
                );
        }
    }
}
