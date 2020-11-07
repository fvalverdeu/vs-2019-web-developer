using Collection.Application.Interfaces.Repositories;
using Collection.Domain.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Infraestructure.Repositories
{
    public class ClientRepository : GenericRepository<Client>, IClientRepository
    {
        public List<Client> GetClients()
        {
            throw new NotImplementedException();
        }
    }
}
