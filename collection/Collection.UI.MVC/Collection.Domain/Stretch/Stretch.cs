using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.Stretch
{
    public class Stretch
    {
        public int Id { get; set; }
        public int StretchId { get; set; }
        public string StrechName { get; set; }
        public string Description { get; set; }
        public int StartDay { get; set; }
        public int EndDay { get; set; }
        public bool State { get; set; }
        public int StrategyId { get; set; }
    }
}
