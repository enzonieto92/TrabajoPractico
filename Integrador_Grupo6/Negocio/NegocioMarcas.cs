using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;

namespace Negocio
{
    public class NegocioMarcas
    {
        DAOmarcas Dmar = new DAOmarcas();
        public NegocioMarcas()
        {

        }

        public DataTable listarMarcas()
        {
            DataTable tabla;

            tabla = Dmar.tablaCategorias();

            return tabla;
        }

        public string nombreMarca(string codigoMarca)
        {
            string nombre;
            DataTable tabla;

            tabla = Dmar.nomMarca(codigoMarca);
            nombre = tabla.Rows[0]["Descripcion_Ma"].ToString();

            return nombre;
        }
    }
}
