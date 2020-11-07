using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.Actions
{
    public class Actions
    {
        public int Id { get; set; }
        public int ActionId { get; set; }
        public string ActionName { get; set; }
        public bool State { get; set; }
    }
}
