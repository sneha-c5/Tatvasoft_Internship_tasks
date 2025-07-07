using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_3.Entities.Models
{
    public class LoginUserResponseModel
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }  
        public string Message { get; set; }
    }
}
