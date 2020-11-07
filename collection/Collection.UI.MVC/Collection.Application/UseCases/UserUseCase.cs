using Collection.Application.DTO.Users;
using Collection.Application.Interfaces.Repositories;
using Collection.Application.Interfaces.UseCases;
using Collection.Domain.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.UseCases
{
    public class UserUseCase : IUserUseCase
    {
        private readonly IUserRepository usuarioRepository;
        public UserUseCase(IUserRepository usuarioRepository)
        {
            this.usuarioRepository = usuarioRepository;
        }

        public Users Register(Users user)
        {
            return this.usuarioRepository.RegisterUser(user);
        }

        public bool Remove(Users user)
        {
            var retorno = false;
            try
            {
                usuarioRepository.Remove(user);
                retorno = true;
            }
            catch (Exception)
            {
                throw;
            }
            return retorno;
        }

        public bool Update(Users user)
        {
            var retorno = false;
            try
            {
                usuarioRepository.Update(user);
                retorno = true;
            }
            catch (Exception)
            {
                throw;
            }
            return retorno;
        }

        public LoginResponseDTO ValidateUser(LoginRequestDTO login)
        {
            LoginResponseDTO response = null;
            var usuario = usuarioRepository.ValidateUser(login.Email, login.Password);
            if (usuario != null)
            {
                response = LoginMapping(usuario);
            }
            return response;
        }


        private LoginResponseDTO LoginMapping(Users usuario)
        {
            return new LoginResponseDTO()
            {
                UserId = usuario.UserId,
                FirstName = usuario.FirstName,
                LastName = usuario.LastName,
                Email = usuario.Email,
                RoleId = usuario.RoleId
            };
        }
    }
}
