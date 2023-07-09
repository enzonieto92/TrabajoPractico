using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioCategorias
    {
        DAOcategoria Dcat = new DAOcategoria();
        public NegocioCategorias()
        {

        }

        public DataTable listarCategorias()
        {
            DataTable tabla;

            tabla = Dcat.tablaCategorias();

            return tabla;
        }
        public DataTable listarCategoriasv2(Productos p)
        {

            return Dcat.tablaCategoriasv2(p);
        }

        public string CodigoCategoria(string nombreCategoria)
        {
            string codigo;
            DataTable tabla;

            tabla = Dcat.CodCategoria(nombreCategoria);
            codigo = tabla.Rows[0]["Descripcion_Cat"].ToString();

            return codigo;
        }
    }
}
