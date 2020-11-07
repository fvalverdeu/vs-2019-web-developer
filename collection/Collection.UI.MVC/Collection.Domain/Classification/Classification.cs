using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.Classification
{
    public class Classification
    {
        public int Id { get; set; }
        public int ClassificationId { get; set; }
        public string Description { get; set; }
        public int ActionId { get; set; }
        public bool State { get; set; }
    }
}
