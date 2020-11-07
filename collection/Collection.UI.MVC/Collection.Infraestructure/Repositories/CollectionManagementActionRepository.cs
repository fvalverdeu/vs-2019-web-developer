using Collection.Application.Interfaces.Repositories;
using Collection.Domain.CollectionManagementAction;
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
    public class CollectionManagementActionRepository : GenericRepository<CollectionManagementAction>, ICollectionManagementActionRepository
    {
        public List<CollectionManagementAction> GetCollectionManagementAction(int UserId)
        {
            List<CollectionManagementAction> lista = null;

            using (var db = DatabaseUtil.CreateDbConnection())
            {
                lista = db.Query<CollectionManagementAction>("USP_GetCollectionManagementAction",
                                new { UserId = UserId },
                                commandType: CommandType.StoredProcedure
                        ).ToList();
            }

            return lista;
        }
    }
}
