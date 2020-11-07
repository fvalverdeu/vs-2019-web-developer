using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.Strategy
{
    public class Strategy
    {
        public int Id { get; set; }
        public int StrategyId { get; set; }
        public string StrategyName { get; set; }
        public string Description { get; set; }
        public DateTime CreateDate { get; set; }
        public bool State { get; set; }
    }
}
