using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;
using Real_Estate.Models;

namespace Real_Estate.DAL
{
    public class RealEstateContext : DbContext
    {
        public RealEstateContext() : base("RealEstateContext")
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<RealEstateContext, 
                Real_Estate.Migrations.Configuration>("RealEstateContext"));
        }

        public DbSet<Agent> Agents { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Office> Offices { get; set; }
        public DbSet<Person> Persons { get; set; }
        public DbSet<RealEstateObject> RealEstateObjects { get; set; }
        public DbSet<Viewing> Viewings { get; set; }
        public DbSet<ZipCode> ZipCodes { get; set; }
        public DbSet<City> Cities { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {

            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            modelBuilder.Entity<Viewing>()
                .HasMany<Customer>(s => s.Customers)
                .WithMany(c => c.Viewings)
                .Map(cs =>
                {
                    cs.MapLeftKey("ViewingID");
                    cs.MapRightKey("CustomerID");
                    cs.ToTable("ViewingCustomer");
                });
        }
    }
}