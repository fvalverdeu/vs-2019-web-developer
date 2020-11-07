using Collection.Domain.CollectionManagementAction;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.Interfaces.Repositories
{
    public interface ICollectionManagementActionRepository: IGenericRepository<CollectionManagementAction>
    {
        List<CollectionManagementAction> GetCollectionManagementAction(int Userid);       
    }
}
