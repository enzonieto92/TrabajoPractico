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
            string consulta = "SELECT CodProducto_Pr, CodCaracteristicas_CXPXC, CodMarcas_Pr, Descripcion_Ma, CodCategoria_Pr, Descripcion_Cat, Descripcion_Co, Nombre_Pr, Descripcion_Pr, Nombre_Car, PrecioUnitario, URLimagen_Pr, Stock_CXPXC, Estado_CXPXC FROM Productos " +
                              "INNER JOIN Marcas ON CodMarcas_Pr = CodMarca_Ma INNER JOIN Categoria ON CodCategoria_Pr = CodCategoria_Cat " +
                              "INNER JOIN CaracteristicasXproductosXcolores ON CodProducto_Pr = CodProducto_CXPXC INNER JOIN Colores ON CodColor_Co = CodColor_CXPXC INNER JOIN Caracteristicas ON CodCaracteristica_Car = CodCaracteristicas_CXPXC " +
                              "WHERE Estado_CXPXC = 1 ORDER BY LEN(CodProducto_CXPXC), CodProducto_CXPXC";
            DataTable tabla = cn.ObtenerTabla("Productos", consulta);
            return tabla;
        }

        public DataTable getTablaInicio()///
        {
            string consulta = "SELECT CodProducto_Pr, Codmarcas_Pr, Descripcion_Ma, CodCategoria_Pr, Descripcion_Cat, Nombre_Pr, Descripcion_Pr, URLimagen_Pr, PrecioUnitario " +
                              "FROM Productos INNER JOIN Marcas ON CodMarcas_Pr = CodMarca_Ma INNER JOIN Categoria ON CodCategoria_Pr = CodCategoria_Cat WHERE Estado_Pr = 1 ORDER BY LEN(CodProducto_Pr), CodProducto_Pr";   //INNER JOIN CaracteristicasXproductosXcolores ON CodProducto_Pr = CodProducto_CXPXC WHERE Estado_CXPXC = '1'
            DataTable tabla = cn.ObtenerTabla("Productos", consulta);
            return tabla;
        }

        public DataTable BuscarProducos(string texto)
        {
            string consulta = "SELECT * FROM Productos WHERE Estado_Pr = 1 AND nombre_Pr LIKE '%" + texto + "%'";
            DataTable tabla = cn.ObtenerTabla("Productos", consulta);
            return tabla;
        }

        public Boolean existeProducto(string codProd)///LO USAMOS EN ADMINPRODUCTOS 
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

        public int eliminarProducto(CaracteristicasXproductoXcolores cxpxc)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametroEliminar(ref comando, cxpxc);
            int cant = cn.EjecutarProcedimientoAlmacenado(comando, "SPEliminarProducto");
            return cant;

        }

        public int actualizarProducto(Productos prod)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosActualizar(ref comando, prod);
            return cn.EjecutarProcedimientoAlmacenado(comando, "SPActualizarProducto");
        }
        public void ArmarParametroEliminar(ref SqlCommand cmd, CaracteristicasXproductoXcolores cxpxc)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@CodProducto", SqlDbType.Char);
            SqlParametros.Value = cxpxc.CodProductos_CXPXC1.CodProducto_Pr1;
            SqlParametros = cmd.Parameters.Add("@CodCaract", SqlDbType.Char);
            SqlParametros.Value = cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1;
            SqlParametros = cmd.Parameters.Add("@CodColor", SqlDbType.Char);
            SqlParametros.Value = cxpxc.CodColor_CXPXC1.Cod_Color_Co1;
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

        public DataTable filtroProductos(string tipo, string texto)

        {
            string consulta = "SELECT CodProducto_Pr, CodCaracteristicas_CXPXC, CodMarcas_Pr, Descripcion_Ma, CodCategoria_Pr, Descripcion_Cat, Descripcion_Co, Nombre_Pr, Descripcion_Pr, Nombre_Car, PrecioUnitario, URLimagen_Pr, Stock_CXPXC, Estado_CXPXC FROM Productos " +
                              "INNER JOIN Marcas ON CodMarcas_Pr = CodMarca_Ma INNER JOIN Categoria ON CodCategoria_Pr = CodCategoria_Cat " +
                              "INNER JOIN CaracteristicasXproductosXcolores ON CodProducto_Pr = CodProducto_CXPXC INNER JOIN Colores ON CodColor_Co = CodColor_CXPXC INNER JOIN Caracteristicas ON CodCaracteristica_Car = CodCaracteristicas_CXPXC " +
                              "WHERE " + tipo + " LIKE '%" + texto + "%' AND Estado_CXPXC = 1";
            DataTable tabla;

            tabla = cn.ObtenerTabla("Productos Filtrados", consulta);

            return tabla;
        }

        public int EditarStock(string codigo, string stock)
        {
            int filas;
            string consulta = "EXEC SPActualizarStock '" + codigo + "', '" + stock + "'";
            filas = cn.RealizarConsulta(consulta);
            return filas;
        }

        public DataTable inicioFiltros(string categoria, string marca, string precioMax, string precioMin)
        {
            string consulta = "SELECT * FROM Productos WHERE Estado_Pr = 1";

            if (categoria != "")
            {
                consulta += " AND CodCategoria_Pr = '" + categoria + "'";
            }
            if (marca != "")
            {
                consulta += " AND CodMarcas_Pr = '" + marca + "'";
            }
            if (precioMin != "")
            {
                consulta += " AND PrecioUnitario <= '" + precioMin + "'";
            }
            if (precioMax != "")
            {
                consulta += " AND PrecioUnitario >= '" + precioMax + "'";
            }
            return cn.ObtenerTabla("Productos", consulta);
        }
        public DataTable getTablaProductosSeleccionados(Productos p)
        {
            string consulta = "SELECT * FROM Productos WHERE CodProducto_Pr = '" + p.CodProducto_Pr1 + "'";
            DataTable tabla = cn.ObtenerTabla("Productos", consulta);
            return tabla;
        }

        public Boolean bajaProducto(Productos prod)
        {
            string consulta = "UPDATE Productos SET Estado_Pr = 0 where CodProducto_Pr='" + prod.CodProducto_Pr1 + "' AND Estado_Pr = 1 ";

            int fila = cn.RealizarConsulta(consulta);
            if (fila == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Boolean altaProducto(Productos prod)
        {
            string consulta = "UPDATE Productos SET Estado_Pr = 1 where CodProducto_Pr='" + prod.CodProducto_Pr1 + "' AND Estado_Pr = 0 ";

            int fila = cn.RealizarConsulta(consulta);
            if (fila == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }

    
}
