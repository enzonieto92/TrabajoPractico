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
        public DataTable getFiltro(string texto)
        {
            string consulta = "Select * from Facturas where NroFactura_Fa = '" + texto + "'";
            DataTable tabla = cn.ObtenerTabla("Facturas", consulta);
            return tabla;
        }
        public DataTable getTablaFecha(String consulta)
        {
            string con = "select * from Facturas " + consulta;
            DataTable tabla = cn.ObtenerTabla("Facturas", con);
            return tabla;
        }
    }
}
