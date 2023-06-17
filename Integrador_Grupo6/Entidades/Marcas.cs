using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Marcas
    {
        public Marcas()
        {

        }
        private String codMarca_Ma;
        private String descripcion_Ma;

        
        public Marcas(string codMarca_Ma, string descripcion_Ma)
        {
            this.CodMarca_Ma = codMarca_Ma;
            this.Descripcion_Ma = descripcion_Ma;
        }

        public string CodMarca_Ma { get => codMarca_Ma; set => codMarca_Ma = value; }
        public string Descripcion_Ma { get => descripcion_Ma; set => descripcion_Ma = value; }

    }
}
