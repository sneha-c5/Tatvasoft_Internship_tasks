using Day_3.Entities.Entities;
using Day_3.Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_3.Services.IServices
{
    public interface ILoginService
    {
        ResponseResult login(LoginUserRequestModel model);
    }
}
