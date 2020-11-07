using Collection.Application.Interfaces.Repositories;
using Collection.Domain.CollectionManagement;
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
    public class CollectionManagementRepository : GenericRepository<CollectionManagement>, ICollectionManagementRepository
    {
        public int GenerateCollectionAction()
        {
            using (var db = DatabaseUtil.CreateDbConnection())
            {
                db.QuerySingleOrDefault<CollectionManagement>("USP_GenerateCollectionAction", null, commandType: CommandType.StoredProcedure);
            }
            return 1;
        }

        public CollectionManagement GetByObject(CollectionManagement collectionManagement)
        {
            throw new NotImplementedException();
        }
    }
}
