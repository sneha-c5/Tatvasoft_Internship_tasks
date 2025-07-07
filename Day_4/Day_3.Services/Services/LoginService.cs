using Day_3.Entities.Entities;
using Day_3.Entities.Models;
using Day_3.Repositories.IRepositories;
using Day_3.Services.Helpers;
using Day_3.Services.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day_3.Services.Services
{
    public class LoginService : ILoginService
    {
        private readonly ILoginRepository _loginRepository;
        private readonly JwtServices _jwtService;
        public LoginService(ILoginRepository loginRepository, JwtServices jwtServices)
        {
            _loginRepository = loginRepository;
            _jwtService = jwtServices;
        }
        public ResponseResult login(LoginUserRequestModel model)
        {
           var usrObj =  this._loginRepository.login(model);
            ResponseResult result = new ResponseResult();
            if(usrObj.Message == "Login Successfully")
            {
                result.Message = usrObj.Message;
                result.Result = ResponseStatus.Success;
                result.Data = _jwtService.GetToken( usrObj.Email, usrObj.Role);
            }
            else
            {
                result.Message = usrObj.Message;
                result.Result = ResponseStatus.Error;
            }
            return result;
        }
    }
}
