using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.ActionPlan
{
    public class ActionPlan
    {
        public int Id { get; set; }
        public int StrategyId { get; set; }
        public int StretchId { get; set; }
        public int ActionId { get; set; }
        public bool State { get; set; }
    }
}
