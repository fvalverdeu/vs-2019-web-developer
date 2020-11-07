using Collection.Domain.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.Interfaces.Repositories
{
    public interface IClientRepository : IGenericRepository<Client>
    {
        List<Client> GetClients();
    }
}
