using Collection.Domain.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.Interfaces.UseCases
{
    public interface IClientUseCase
    {
        int Register(Client client);
        bool Update(Client client);
        bool Remove(Client client);
    }
}
