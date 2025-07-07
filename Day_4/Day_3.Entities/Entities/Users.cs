using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Day_3.Entities.Entities
{
    [Table("Users")]
    public class Users : Base
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }
        [Column("email")]
        public string Email { get; set; }
        [Column("password")]
        public string Password { get; set; }
        public string Message { get; set; }
        public string Role { get; set; }
    }
}
