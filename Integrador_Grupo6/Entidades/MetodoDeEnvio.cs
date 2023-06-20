using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class MetodoDeEnvio
    {
        private String CodMetEnvio_En;
        private String descripcion_En;

        public MetodoDeEnvio()
        {

        }

        public MetodoDeEnvio(string codMetEnvio_En, string descripcion_En)
        {
            CodMetEnvio_En1 = codMetEnvio_En;
            this.Descripcion_En = descripcion_En;
        }

        public string CodMetEnvio_En1 { get => CodMetEnvio_En; set => CodMetEnvio_En = value; }
        public string Descripcion_En { get => descripcion_En; set => descripcion_En = value; }
    }
}
