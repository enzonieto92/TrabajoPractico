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

        public int agregarFactura(Facturas fac)
        {
            int cantFilas = cn.ejecutarTransaccion("INSERT INTO Facturas (DNI_Fa, CodMetodoEnvio_Fa, CodMetodoPago_Fa, Fecha_Fa, DireccionEntrega_Fa,  Total_Fa)" +
                " SELECT '" + fac.DNI_Fa1.DNI_Us1 + "','" + fac.CodMetodoEnvio_Fa1.CodMetEnvio_En1 + "','" + fac.CodMetodoPago_Fa1.CodMetPago_Pa1 + "',GETDATE(),'" + fac.DireccionEntrega_Fa1 + "','"  + fac.Total_Fa1 + "'");
            return cantFilas;
        }
        public DataTable getTablaFecha(String consulta)
        {
            string con = "select * from Facturas " + consulta;
            DataTable tabla = cn.ObtenerTabla("Facturas", con);
            return tabla;
        }

        public decimal getTotalRecaudado(String consulta)
        {
            string con = "SELECT SUM(Total_Fa) AS[Total Recaudado] FROM Facturas " + consulta;
            DataTable tabla = cn.ObtenerTabla("Facturas", con);
            decimal cantidad = 0;

            cantidad = Convert.ToInt32(tabla.Rows[0]["Total Recaudado"] is DBNull ? 0 : tabla.Rows[0]["Total Recaudado"]);

            return cantidad;
        }
    }
}
