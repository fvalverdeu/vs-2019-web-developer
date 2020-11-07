using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Collection.Domain.CollectionManagementAction
{
    public class CollectionManagementAction
    {
        public string Documento { get; set; }
        public string Nombre { get; set; }
        public Decimal Cuenta { get; set; }
        public Decimal Monto { get; set; }
        public DateTime Vencimiento { get; set; }
        public int Mora { get; set; }
        public string Tramo { get; set; }
        public string Accion { get; set; }
        public int Estado { get; set; }
    }
}
