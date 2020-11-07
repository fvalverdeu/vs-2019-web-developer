using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.Roles
{
    public class Roles
    {
        public int Id { get; set; }
        public int RoleId { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool State { get; set; }
    }
}
