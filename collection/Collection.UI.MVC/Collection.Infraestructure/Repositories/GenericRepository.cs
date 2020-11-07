using Dapper;
using Collection.Application.Interfaces.Repositories;
using Collection.Infraestructure.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Infraestructure.Repositories
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity>
             where TEntity : class
    {
        public TKey Add<TKey>(TEntity entity)
        {
            TKey retorno;
            using (var db = DatabaseUtil.CreateDbConnection())
            {
                retorno = db.Insert<TKey, TEntity>(entity);
            }

            return retorno;
        }

        public TEntity Get(object id)
        {
            TEntity retorno = null;
            using (var db = DatabaseUtil.CreateDbConnection())
            {
                retorno = db.Get<TEntity>(id);
            }

            return retorno;

        }

        public void Remove(TEntity entity)
        {
            using (var db = DatabaseUtil.CreateDbConnection())
            {
                db.Delete<TEntity>(entity);
            }
        }

        public void Update(TEntity entity)
        {
            using (var db = DatabaseUtil.CreateDbConnection())
            {
                db.Update<TEntity>(entity);
            }
        }
    }
}
