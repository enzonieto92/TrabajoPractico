using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categorias
    {
        public Categorias()
        {
        }

        private String codCategoria_Ca;
        private String descripcion_Ca;
       
        public Categorias(String CodCategoria, String Descripcion)
        {
            this.CodCategoria_Ca = CodCategoria;
            this.Descripcion_Ca = Descripcion;
        }

        public string CodCategoria_Ca { get => codCategoria_Ca; set => codCategoria_Ca = value; }
        public string Descripcion_Ca { get => descripcion_Ca; set => descripcion_Ca = value; }

    }
}
