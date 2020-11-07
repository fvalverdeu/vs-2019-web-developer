using AutoMapper;
using Collection.Domain.Client;
using Collection.Domain.Users;
using Collection.UI.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Collection.UI.MVC.Helpers
{
    public class Mappers
    {
        public static IMapper ClientViewModelToClientMapping()
        {
            var configuration = new MapperConfiguration(
                cfg =>
                {
                    cfg.CreateMap<ClientViewModel, Client>();
                }
                );

            return configuration.CreateMapper();
        }

        public static IMapper UserListViewModelToUsersMapping()
        {
            var configuration = new MapperConfiguration(
                cfg =>
                {
                    cfg.CreateMap<UserListViewModel, Users>();
                }
                );

            return configuration.CreateMapper();
        }
    }
}