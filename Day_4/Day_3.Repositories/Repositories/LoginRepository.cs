using Day_3.Entities.context;
using Day_3.Entities.Entities;
using Day_3.Entities.Models;
using Day_3.Repositories.IRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_3.Repositories.Repositories
{
  public class LoginRepository(Day_3DbContext day_3DbContext) : ILoginRepository
    {
        private readonly Day_3DbContext _day_3DbContext = day_3DbContext;
        public LoginUserResponseModel login(LoginUserRequestModel model)
        {
            var existingUser = _day_3DbContext.Users.Where(x => x.Email.ToLower() == model.Email.ToLower() && !x.IsDeleted).FirstOrDefault();
            if (existingUser == null)
            {
                return new LoginUserResponseModel() { Message = "Email address Not found" };
            }
            if (existingUser.Password != model.Password)
            {
                return new LoginUserResponseModel() { Message = "Incorrect Password" };
            }
            return new LoginUserResponseModel()
            {
                Id = existingUser.Id,
                Email = existingUser.Email,
                Role = existingUser.Role,   
                Message = "Login Successfully"
            };
        }

    }
}
