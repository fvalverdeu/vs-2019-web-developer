using Collection.Application.DTO.Users;
using Collection.Domain.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.Interfaces.UseCases
{
    public interface IUserUseCase
    {
        LoginResponseDTO ValidateUser(LoginRequestDTO login);
        Users Register(Users user);
        bool Update(Users user);
        bool Remove(Users user);
    }
}
