using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;



namespace Dao
{
    public class DAOmetodoPago
    {
        AccesoDatos cn = new AccesoDatos();
         
        public DAOmetodoPago()
        {

        }

        public DataTable tablaMetodoPago()
        {
            DataTable tabla;
            string consulta = "SELECT CodMetodoPago_Mp, Descripcion_Mp FROM MetodosPago";

            tabla = cn.ObtenerTabla("MetodosPago", consulta);

            return tabla;
        }
    }
}
