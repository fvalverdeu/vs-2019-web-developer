using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.Result
{
    public class Result
    {
        public int Id { get; set; }
        public int ResultId { get; set; }
        public string Description { get; set; }
        public bool State { get; set; }
        public int ClassificationId { get; set; }
    }
}
