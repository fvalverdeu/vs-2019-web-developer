using Collection.Domain.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.Interfaces.Queries
{
    public interface IUserQuery
    {
        List<Users> GetAllUsers();
    }
}
