using SimpleInjector.Integration.Web;
using SimpleInjector;
using SimpleInjector.Integration.Web.Mvc;
using System.Reflection;
using System.Web.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Collection.Application.Interfaces.UseCases;
using Collection.Application.UseCases;
using Collection.Application.Interfaces.Repositories;
using Collection.Infraestructure.Repositories;
using Collection.Infraestructure.Queries;
using Collection.Application.Interfaces.Queries;

namespace Collection.UI.MVC.App_Start
{
    public class DIConfig
    {
        public static void Configure()
        {
            // Simple Injector set up
            var container = new Container();
            container.Options.DefaultScopedLifestyle = new WebRequestLifestyle();
            //-----------------------------------------------------------------------------------------
            ///Inyectar las depedencias
            //container.Register<IProductoQuery, ProdutoQuery>(Lifestyle.Scoped);
            //container.Register<ICategoriaQuery, CategoriaQuery>(Lifestyle.Scoped);
            container.Register<IUserRepository, UserRepository>(Lifestyle.Scoped);
            container.Register<IUserUseCase, UserUseCase>(Lifestyle.Scoped);
            container.Register<IUserQuery, UserQuery>(Lifestyle.Scoped);
            container.Register<IClientRepository, ClientRepository>(Lifestyle.Scoped);
            container.Register<IClientQuery, ClientQuery>(Lifestyle.Scoped);
            container.Register<IClientUseCase, ClientUseCase>(Lifestyle.Scoped);
            container.Register<ICollectionManagementActionRepository, CollectionManagementActionRepository>(Lifestyle.Scoped);
            container.Register<ICollectionManagementRepository, CollectionManagementRepository>(Lifestyle.Scoped);
            //container.Register<IProductoRepository, ProductoRepository>(Lifestyle.Scoped);
            //container.Register<IProductoUseCase, ProductoUseCase>(Lifestyle.Scoped);
            //container.Register<ICategoriaRepository, CategoriaRepository>(Lifestyle.Scoped);
            //-----------------------------------------------------------------------------------------
            container.RegisterMvcControllers(Assembly.GetExecutingAssembly());
            container.RegisterMvcIntegratedFilterProvider();
            container.Verify();
            DependencyResolver.SetResolver(new SimpleInjectorDependencyResolver(container));
        }

    }
}