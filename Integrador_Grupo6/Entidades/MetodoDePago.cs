using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class MetodoDePago
    {
        private String CodMetPago_Pa;
        private String descripcion_Pa;
        
        public MetodoDePago()
        {
        }

        public MetodoDePago(string codMetPago_Pa, string descripcion_Pa)
        {
            CodMetPago_Pa1 = codMetPago_Pa;
            this.Descripcion_Pa = descripcion_Pa;
        }

        public string CodMetPago_Pa1 { get => CodMetPago_Pa; set => CodMetPago_Pa = value; }
        public string Descripcion_Pa { get => descripcion_Pa; set => descripcion_Pa = value; }
    }
}
