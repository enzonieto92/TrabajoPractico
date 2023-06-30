using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace Dao
{
    public class DAOmetodoEnvio
    {

        AccesoDatos cn = new AccesoDatos();

        public DAOmetodoEnvio()
        {

        }

        public DataTable tablaMetodoEnvio()
        {
            DataTable tabla;
            string consulta = "SELECT CodMetodoEnvio_Me, Descripcion_Me FROM MetodosEnvio";

            tabla = cn.ObtenerTabla("MetodosEnvio", consulta);
            return tabla;
        }
    }
}
