using Collection.Application.DTO.Clients;
using Collection.Domain.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.Interfaces.Queries
{
    public interface IClientQuery
    {
        List<Client> GetAllClients();
    }
}
