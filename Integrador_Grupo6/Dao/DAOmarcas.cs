using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class DAOmarcas
    {
        AccesoDatos cn = new AccesoDatos();
        public DAOmarcas()
        {

        }

        public DataTable tablaCategorias()
        {
            DataTable tabla;
            string consulta = "SELECT CodMarca_Ma, Descripcion_Ma FROM Marcas";

            tabla = cn.ObtenerTabla("Marcas", consulta);

            return tabla;
        }

        public DataTable nomMarca(string CodMarca)
        {
            DataTable tabla;
            string consulta = "SELECT Descripcion_Ma FROM Marcas WHERE CodMarca_Ma = " + CodMarca;

            tabla = cn.ObtenerTabla("Marcas", consulta);

            return tabla;
        }

        public DataTable codMarca(string nombre)
        {
            DataTable tabla;
            string consulta = "SELECT CodMarca_Ma FROM Marcas WHERE Descripcion_Ma = " + nombre;

            tabla = cn.ObtenerTabla("Marcas", consulta);

            return tabla;
        }

    }
}
