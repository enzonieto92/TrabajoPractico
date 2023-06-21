using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;


namespace Dao
{
    public class DAOfactura
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla()
        {
            string consulta = "Select * from Facturas";
            DataTable tabla = cn.ObtenerTabla("Facturas", consulta);
            return tabla;
        }
    }
}
