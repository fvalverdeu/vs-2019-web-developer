using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Collection.Domain;
using Collection.Domain.Users;

namespace Collection.Application.Interfaces.Repositories
{
    public interface IUserRepository : IGenericRepository<Users>
    {
        Users ValidateUser(string email, string password);
        List<Users> GetUsers();

        Users RegisterUser(Users user);
    }
}
