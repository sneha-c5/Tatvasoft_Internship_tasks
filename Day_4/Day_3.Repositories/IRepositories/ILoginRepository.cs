using Day_3.Entities.context;
using Day_3.Entities.Entities;
using Day_3.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_3.Repositories.IRepositories
{
   public interface ILoginRepository
    {
       LoginUserResponseModel login(LoginUserRequestModel model);
        
    }
}
