using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.ActionState
{
    public class ActionState
    {
        public int Id { get; set; }
        public int ActionStateId { get; set; }
        public string Description { get; set; }
        public bool State { get; set; }
    }
}
