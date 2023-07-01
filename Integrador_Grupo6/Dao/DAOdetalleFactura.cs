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
    public class DAOdetalleFactura
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla(string nroFactura)
        {
            string consulta = "SELECT DISTINCT  NroFactura_Df, Nombre_Pr, Descripcion_Cat, Nombre_Car, Descripcion_Co, PrecioUnitario_Df, Cantidad_Df" +
                                                        " FROM DetalleFacturas  INNER JOIN CaracteristicasXproductosXcolores ON CodProducto_Df=CodProducto_CXPXC" +
                                                        " INNER JOIN Caracteristicas ON CodCaracteristicas_Df=CodCaracteristica_Car INNER JOIN Colores ON CodColor_Df = CodColor_Co" +
                                                        " INNER JOIN Productos ON CodProducto_Df = CodProducto_Pr INNER JOIN Categoria on CodCategoria_Pr = CodCategoria_Cat WHERE NroFactura_Df = '" + nroFactura + "'";
            DataTable tabla = cn.ObtenerTabla("DetalleFacturas", consulta);
            return tabla;
        }

        public decimal getTotalProductosVendidos(string consulta)
        {
            string con = "SELECT SUM(Cantidad_Df) AS [Total Productos Vendidos] FROM DetalleFacturas INNER JOIN Facturas ON NroFactura_Df = NroFactura_Fa " + consulta;
            DataTable tabla = cn.ObtenerTabla("Facturas", con);
            decimal cantidad = 0;

            cantidad = Convert.ToInt32(tabla.Rows[0]["Total Productos Vendidos"] is DBNull ? 0 : tabla.Rows[0]["Total Productos Vendidos"]);

            return cantidad;
        }
        public int nroFactura()
        {
            string nro = "SELECT MAX(NroFactura_Fa) FROM Facturas";
            int numero = Convert.ToInt32(cn.consulta(nro));
            return numero;
        }
        public int agregarDetalleFacturas(DetalleFacturas df)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosAgregar(ref comando, df);
            return cn.EjecutarProcedimientoAlmacenado(comando, "SPInsertarDetalleFactura");
        }
        private void armarParametrosAgregar(ref SqlCommand cmd, DetalleFacturas df)
        {
            int factura = nroFactura();
            df.NroFacturas_Df1.NroFactura_Fa1 = factura;
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@NroFactura", SqlDbType.Int);
            SqlParametros.Value = df.NroFacturas_Df1.NroFactura_Fa1;
            SqlParametros = cmd.Parameters.Add("@CodProducto", SqlDbType.Char);
            SqlParametros.Value = df.CodProducto_Df1.CodProducto_Pr1;
            SqlParametros = cmd.Parameters.Add("@CodCaracteristica", SqlDbType.Char);
            SqlParametros.Value = df.CodCaracteristicas_Df1.Cod_Caracteristica_Car1;
            SqlParametros = cmd.Parameters.Add("@CodColor", SqlDbType.Char);
            SqlParametros.Value = df.CodColor_Df1.Cod_Color_Co1;
            SqlParametros = cmd.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = df.PrecioUnitario_Df1;
            SqlParametros = cmd.Parameters.Add("@Cantidad", SqlDbType.Int);
            SqlParametros.Value = df.Cantidad_Df1;
        }
    }


}
