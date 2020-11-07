using Collection.Application.Interfaces.Queries;
using Collection.Domain.Users;
using Collection.Infraestructure.Database;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Infraestructure.Queries
{
    public class UserQuery: IUserQuery
    {
        public List<Users> GetAllUsers()
        {
            List<Users> lista = null;

            using (var db = DatabaseUtil.CreateDbConnection())
            {
                //lista = db.GetList<Users>().ToList();
                var parameters = new DynamicParameters();
                lista = db.Query<Users>("dbo.USP_ListUser", parameters, commandType: System.Data.CommandType.StoredProcedure).ToList();
            }

            return lista;
        }
    }
}
