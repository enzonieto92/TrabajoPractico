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
            SqlCommand comando = new SqlCommand();
            armarParametrosAgregar(ref comando, fac);
            return cn.EjecutarProcedimientoAlmacenado(comando, "SPInsertarFactura");
        }
        private void armarParametrosAgregar(ref SqlCommand cmd, Facturas fac)
        {
            DateTime fecha = DateTime.Today;
            fac.Fecha_Fa1 = fecha;
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@DNI", SqlDbType.Char);
            SqlParametros.Value = fac.DNI_Fa1.DNI_Us1;
            SqlParametros = cmd.Parameters.Add("@CodMetEnvio", SqlDbType.Char);
            SqlParametros.Value = fac.CodMetodoEnvio_Fa1.CodMetEnvio_En1;
            SqlParametros = cmd.Parameters.Add("@CodMetPago", SqlDbType.Char);
            SqlParametros.Value = fac.CodMetodoPago_Fa1.CodMetPago_Pa1;
            SqlParametros = cmd.Parameters.Add("@Fecha", SqlDbType.Date);
            SqlParametros.Value = fac.Fecha_Fa1;
            SqlParametros = cmd.Parameters.Add("@DireccionEntrega", SqlDbType.VarChar);
            SqlParametros.Value = fac.DireccionEntrega_Fa1;
            SqlParametros = cmd.Parameters.Add("@Total", SqlDbType.Decimal);
            SqlParametros.Value = fac.Total_Fa1;
        }
        public DataTable getTablav2(Facturas f)
        {
            string consulta = "Select * from Facturas where Dni_Fa = '" + f.DNI_Fa1.DNI_Us1 + "'";
            DataTable tabla = cn.ObtenerTabla("Facturas", consulta);
            return tabla;
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
