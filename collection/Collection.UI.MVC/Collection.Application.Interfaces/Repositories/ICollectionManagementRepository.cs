using Collection.Domain.CollectionManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.Interfaces.Repositories
{
    public interface ICollectionManagementRepository: IGenericRepository<CollectionManagement>
    {
        CollectionManagement GetByObject(CollectionManagement collectionManagement);
        int GenerateCollectionAction();
    }
}
