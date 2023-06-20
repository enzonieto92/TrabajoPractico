using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class DAOcolor
    {
        AccesoDatos cn = new AccesoDatos();
        public DAOcolor()
        {

        }

        public DataTable tablaCategorias()
        {
            DataTable tabla;
            string consulta = "SELECT CodColor_Co, Descripcion_Co FROM Colores";

            tabla = cn.ObtenerTabla("Marcas", consulta);

            return tabla;
        }
    }
}
