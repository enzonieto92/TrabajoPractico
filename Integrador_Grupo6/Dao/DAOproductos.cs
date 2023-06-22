using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Entidades;


namespace Dao
{
    public class DAOproductos
    {
        AccesoDatos cn = new AccesoDatos();
        public DAOproductos()
        {

        }

        public DataTable getTabla()
        {
            string consulta = "SELECT CodProducto_Pr, Codmarcas_Pr, Descripcion_Ma, CodCategoria_Pr, Descripcion_Cat, Nombre_Pr, Descripcion_Pr, URLimagen_Pr, PrecioUnitario, Estado_Pr " +
                              "FROM Productos INNER JOIN Marcas ON CodMarcas_Pr = CodMarca_Ma INNER JOIN Categoria ON CodCategoria_Pr = CodCategoria_Cat ";
            DataTable tabla = cn.ObtenerTabla("Productos", consulta);
            return tabla;
        }

        public Boolean existeProducto(string codProd)
        {
            String consulta = "SELECT * FROM Productos WHERE CodProducto_Pr= '" + codProd + "'";
            return cn.existe(consulta);
        }

        public int agregarProducto(Productos pr)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosAgregar(ref comando, pr);
            return cn.EjecutarProcedimientoAlmacenado(comando, "SPInsertarProducto");
        }

        public int eliminarProducto(Productos prod)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametroEliminar(ref comando, prod);
            int cant = cn.EjecutarProcedimientoAlmacenado(comando, "DeleteProductoCascada");
            return cant;

        }

        public int actualizarProducto(Productos prod)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosActualizar(ref comando, prod);
            return cn.EjecutarProcedimientoAlmacenado(comando, "SPActualizarProducto");
        }
        public void ArmarParametroEliminar(ref SqlCommand cmd, Productos prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@CodProducto_Pr", SqlDbType.Char);
            SqlParametros.Value = prod.CodProducto_Pr1;

        }

        private void armarParametrosAgregar(ref SqlCommand cmd, Productos prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@CodProducto", SqlDbType.Char);
            SqlParametros.Value = prod.CodProducto_Pr1;
            SqlParametros = cmd.Parameters.Add("@CodMarca", SqlDbType.Char);
            SqlParametros.Value = prod.CodMarcas_Pr1.CodMarca_Ma;
            SqlParametros = cmd.Parameters.Add("@CodCategoria", SqlDbType.Char);
            SqlParametros.Value = prod.CodCategoria_Pr1.CodCategoria_Ca;
            SqlParametros = cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar);
            SqlParametros.Value = prod.Descripcion_Pr1;
            SqlParametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar);
            SqlParametros.Value = prod.Nombre_Pr1;
            SqlParametros = cmd.Parameters.Add("@Urlimagen", SqlDbType.VarChar);
            SqlParametros.Value = prod.UrlImagen_Pr1;
            SqlParametros = cmd.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = prod.PrecioUnitario_Pr1;
        }

        private void armarParametrosActualizar(ref SqlCommand cmd, Productos prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@CodProducto", SqlDbType.Char);
            SqlParametros.Value = prod.CodProducto_Pr1;
            SqlParametros = cmd.Parameters.Add("@CodMarca", SqlDbType.Char);
            SqlParametros.Value = prod.CodMarcas_Pr1.CodMarca_Ma;
            SqlParametros = cmd.Parameters.Add("@CodCategoria", SqlDbType.Char);
            SqlParametros.Value = prod.CodCategoria_Pr1.CodCategoria_Ca;
            SqlParametros = cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar);
            SqlParametros.Value = prod.Descripcion_Pr1;
            SqlParametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar);
            SqlParametros.Value = prod.Nombre_Pr1;
            SqlParametros = cmd.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = prod.PrecioUnitario_Pr1;
            SqlParametros = cmd.Parameters.Add("@Estado", SqlDbType.Bit);
            SqlParametros.Value = prod.Estado_Pr;

        }

        private void armarParametrosAgregarStock(ref SqlCommand cmd, string codigo, string stock)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@CodProducto", SqlDbType.Char);
            SqlParametros.Value = codigo;
            SqlParametros = cmd.Parameters.Add("@StockNuevo", SqlDbType.Int);
            SqlParametros.Value = Convert.ToInt32(stock);
        }

        public DataTable filtroProductos(string tipo, string texto)
        {
            string consulta = "SELECT CodProducto_Pr, CodMarcas_Pr, Descripcion_Ma, CodCategoria_Pr, Descripcion_Cat, Nombre_Pr, Descripcion_Pr, PrecioUnitario, URLimagen_Pr, Stock_CXPXC, Estado_Pr FROM Productos " +
                              "INNER JOIN Marcas ON CodMarcas_Pr = CodMarca_Ma INNER JOIN Categoria ON CodCategoria_Pr = CodCategoria_Cat INNER JOIN CaracteristicasXproductosXcolores ON CodProducto_Pr = CodProducto_CXPXC " +
                              "WHERE " + tipo + " LIKE '" + texto + "%'";
            DataTable tabla;

            tabla = cn.ObtenerTabla("Productos Filtrados", consulta);

            return tabla;
        }

        public int agregarStock(string codigo, string stock)
        {
            int filas;
            string consulta = "EXEC SPActualizarStock '" + codigo + "', '" + stock + "'";
            filas = cn.RealizarConsulta(consulta);
            return filas;
        }

    }
}
