using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.DTO.Users
{
    public class LoginRequestDTO
    {
        [Required(ErrorMessage = "El campo Email es requerido")]
        public string Email { get; set; }

        [Required(ErrorMessage = "El campo Password es requerido")]
        public string Password { get; set; }
    }

    public class LoginResponseDTO
    {
        public int UserId { get; set; }

        public string Email { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public int RoleId { get; set; }
    }
}
