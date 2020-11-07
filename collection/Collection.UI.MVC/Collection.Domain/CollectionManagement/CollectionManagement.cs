using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.CollectionManagement
{
    public class CollectionManagement
    {
        public int Id { get; set; }
        public int ClientId { get; set; }
        public int StretchId { get; set; }
        public int ActionId { get; set; }
        public int ResultId { get; set; }
        public string Comment { get; set; }
        public DateTime RegistrationDate { get; set; }
        public int ActionStateId { get; set; }
    }
}
