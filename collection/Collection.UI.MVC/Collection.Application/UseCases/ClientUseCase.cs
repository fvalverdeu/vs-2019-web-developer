using Collection.Application.Interfaces.Repositories;
using Collection.Application.Interfaces.UseCases;
using Collection.Domain.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.UseCases
{
    public class ClientUseCase: IClientUseCase
    {
        private readonly IClientRepository clientRepository;

        public ClientUseCase(IClientRepository clientRepository)
        {
            this.clientRepository = clientRepository;
        }

        public int Register(Client client)
        {
            client.State = true;
            return this.clientRepository.Add<int>(client);
        }

        public bool Update(Client client)
        {
            var retorno = false;
            client.State = true;
            try
            {
                clientRepository.Update(client);
                retorno = true;
            }
            catch (Exception)
            {
                throw;
            }
            return retorno;
        }

        public bool Remove(Client client)
        {
            var retorno = false;
            client.State = true;
            try
            {
                clientRepository.Remove(client);
                retorno = true;
            }
            catch (Exception)
            {
                throw;
            }
            return retorno;
        }
    }
}
