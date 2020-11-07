using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.Adviser
{
    public class Adviser
    {
        public int Id { get; set; }
        public int AdviserId { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public bool State { get; set; }
    }
}
