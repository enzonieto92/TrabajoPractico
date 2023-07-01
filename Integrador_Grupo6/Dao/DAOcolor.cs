using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;

namespace Dao
{
    public class DAOcolor
    {
        AccesoDatos cn = new AccesoDatos();
        public DAOcolor()
        {

        }
        public DataTable getTabla()
        {
            string consulta = "select * from Colores";
            DataTable tabla = cn.ObtenerTabla("Colores", consulta);
            return tabla;
        }
        public DataTable tablaCategorias()
        {
            DataTable tabla;
            string consulta = "SELECT CodColor_Co, Descripcion_Co FROM Colores";

            tabla = cn.ObtenerTabla("Marcas", consulta);

            return tabla;
        }
        public DataTable nombreColor(Colores col)
        {
            DataTable tabla;
            string color = "2";
            string consulta = "SELECT Descripcion_Co FROM Colores WHERE CodColor_Co = '" + color + "'";
            tabla = cn.ObtenerTabla("Colores", consulta);
            return tabla;
        }

        public DataTable codigoColor(Colores col)
        {
            DataTable tabla;
            string nombre = "Negro";
            string consulta = "SELECT CodColor_Co FROM Colores WHERE Descripcion_Co = '" + nombre + "'";
            tabla = cn.ObtenerTabla("Colores", consulta);
            return tabla;
        }
    }
}
