using Day_3.Entities.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace Day_3.Entities.context
{
    public class Day_3DbContext : DbContext
    {
        public Day_3DbContext(DbContextOptions<Day_3DbContext> options) : base(options) { }
        public DbSet<Users> Users { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            AppContext.SetSwitch("Npgsql.EnableLegancyTimestampBehavior", true);
            modelBuilder.Entity<Users>().HasData(new Users()
            {
                Id = 1,
                Email = "test@123.gmail.com",
                Password = "password123",
                CreatedDate = new DateTime(2019, 1, 1, 0, 0, 0, DateTimeKind.Utc)
            });
            base.OnModelCreating(modelBuilder);
        }
    }
}
