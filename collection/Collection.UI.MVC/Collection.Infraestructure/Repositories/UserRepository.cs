using Collection.Application.Interfaces.Repositories;
using Collection.Domain.Users;
using Collection.Infraestructure.Database;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Infraestructure.Repositories
{
    public class UserRepository : GenericRepository<Users>, IUserRepository
    {
        public List<Users> GetUsers()
        {
            throw new NotImplementedException();
        }

        public Users RegisterUser(Users user)
        {
            using (var db = DatabaseUtil.CreateDbConnection())
            {
                string message = "";
                var parameters = new DynamicParameters();
                parameters.Add("@Email", user.Email);
                parameters.Add("@Password", user.Password);
                parameters.Add("@FirstName", user.FirstName);
                parameters.Add("@LastName", user.LastName);
                parameters.Add("@RoleId", user.RoleId);
                parameters.Add("@Ov_Message_Error", message);

                return db.QueryFirstOrDefault<Users>("dbo.USP_CreateUser", parameters,
                    commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public Users ValidateUser(string email, string password)
        {
            Users user = null;
            using (var db = DatabaseUtil.CreateDbConnection())
            {
                user = db.QuerySingleOrDefault<Users>("USP_ValidateUser",
                                new { Email = email, Password = password },
                                commandType: CommandType.StoredProcedure);

            }
            return user;
        }
        public Users Get(object id)
        {
            Users user = null;

            using (var db = DatabaseUtil.CreateDbConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Id", id);
                List<Users> users = db.Query<Users>("dbo.USP_GetUser", parameters, commandType: System.Data.CommandType.StoredProcedure).ToList();
                user = users[0];
            }

            return user;

        }

        public void Remove(Users user)
        {
            using (var db = DatabaseUtil.CreateDbConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Id", user.UserId);
                db.Query<Users>("dbo.USP_DeleteUser", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public void Update(Users user)
        {
            using (var db = DatabaseUtil.CreateDbConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Id", user.UserId);
                parameters.Add("@RoleId", user.RoleId);
                db.Query<Users>("dbo.USP_UpdateUser", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
