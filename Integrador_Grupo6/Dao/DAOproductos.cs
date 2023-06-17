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

        public DataTable getTabla(string consulta)
        {
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
            int cantFilas = cn.ejecutarTransaccion("UPDATE Productos SET Estado_Pr = 0 WHERE CodProducto_Pr = '" + prod.CodProducto_Pr1 + "'");
            return cantFilas;
        }

        public int actualizarProducto(Productos prod)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosActualizar(ref comando, prod);
            return cn.EjecutarProcedimientoAlmacenado(comando, "SPActualizarProducto");
        }


        private void armarParametrosAgregar(ref SqlCommand cmd, Productos prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@CodProducto_Pr", SqlDbType.Char);
            SqlParametros.Value = prod.CodProducto_Pr1;
            SqlParametros = cmd.Parameters.Add("@CodMarcas_Pr", SqlDbType.Char);
            SqlParametros.Value = prod.CodMarcas_Pr1.CodMarca_Ma;
            SqlParametros = cmd.Parameters.Add("@CodCategoria_Pr", SqlDbType.Char);
            SqlParametros.Value = prod.CodCategoria_Pr1.CodCategoria_Ca;
            SqlParametros = cmd.Parameters.Add("@Descripcion_Pr", SqlDbType.VarChar);
            SqlParametros.Value = prod.Descripcion_Pr1;
            SqlParametros = cmd.Parameters.Add("@Nombre_Pr", SqlDbType.VarChar);
            SqlParametros.Value = prod.Nombre_Pr1;
            SqlParametros = cmd.Parameters.Add("@Urlimagen_Pr", SqlDbType.VarChar);
            SqlParametros.Value = prod.UrlImagen_Pr1;
            SqlParametros = cmd.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = prod.PrecioUnitario_Pr1;
        }

        private void armarParametrosActualizar(ref SqlCommand cmd, Productos prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@CodProducto_Pr", SqlDbType.Char);
            SqlParametros.Value = prod.CodProducto_Pr1;
            SqlParametros = cmd.Parameters.Add("@CodMarcas_Pr", SqlDbType.Char);
            SqlParametros.Value = prod.CodMarcas_Pr1.CodMarca_Ma;
            SqlParametros = cmd.Parameters.Add("@CodCategoria_Pr", SqlDbType.Char);
            SqlParametros.Value = prod.CodCategoria_Pr1.CodCategoria_Ca;
            SqlParametros = cmd.Parameters.Add("@Descripcion_Pr", SqlDbType.VarChar);
            SqlParametros.Value = prod.Descripcion_Pr1;
            SqlParametros = cmd.Parameters.Add("@Nombre_Pr", SqlDbType.VarChar);
            SqlParametros.Value = prod.Nombre_Pr1;
            SqlParametros = cmd.Parameters.Add("@Urlimagen_Pr", SqlDbType.VarChar);
            SqlParametros.Value = prod.UrlImagen_Pr1;
            SqlParametros = cmd.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = prod.PrecioUnitario_Pr1;
            SqlParametros = cmd.Parameters.Add("@Estado_Pr", SqlDbType.Bit);
            SqlParametros.Value = prod.Estado_Pr;
            
        }

    }
}
