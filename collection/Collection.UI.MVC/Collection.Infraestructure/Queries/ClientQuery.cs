using Collection.Application.DTO.Clients;
using Collection.Application.Interfaces.Queries;
using Collection.Domain.Client;
using Collection.Infraestructure.Database;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Infraestructure.Queries
{
    public class ClientQuery : IClientQuery
    {
        public List<Client> GetAllClients()
        {
            List<Client> lista = null;

            using (var db = DatabaseUtil.CreateDbConnection())
            {
                //lista = db.Query<GetAllClientsDTO>("usp_getBusquedaProductos",
                //                new { nombre = paramNombre },
                //                commandType: CommandType.StoredProcedure
                //        ).ToList();
                lista = db.GetList<Client>().ToList();
            }

            return lista;
        }
    }
}
