using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Application.DTO.Clients
{
    public class ClientDTO
    {
        public int Id { get; set; }
        public int ClientId { get; set; }
        public string Dni { get; set; }
        public string Ruc { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Account { get; set; }
        public Decimal Amount { get; set; }
        public Decimal Debt { get; set; }
        public DateTime ExpirationDate { get; set; }
        public int FeeNumber { get; set; }
        public int UserId { get; set; }
        public bool State { get; set; }
    }
}
