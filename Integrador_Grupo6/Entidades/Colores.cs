using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Colores
    {

        public Colores()
        {
        }

        public Colores(string cod_Color_Co, string descripcion_Co)
        {
            Cod_Color_Co1 = cod_Color_Co;
            Descripcion_Co1 = descripcion_Co;
        }

        private string Cod_Color_Co;
        private string Descripcion_Co;

        public string Cod_Color_Co1 { get => Cod_Color_Co; set => Cod_Color_Co = value; }
        public string Descripcion_Co1 { get => Descripcion_Co; set => Descripcion_Co = value; }
    }
}
