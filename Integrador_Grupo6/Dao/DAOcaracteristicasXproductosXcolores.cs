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
    public class DAOcaracteristicasXproductosXcolores
    {
        AccesoDatos cn = new AccesoDatos();
        public Boolean CaracteristicaXproductosXcolores(CaracteristicasXproductoXcolores cxpxc)
        {
            String consulta = "Select * from CaracteristicasXproductosXcolores where CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND CodCaracteristicas_CXPXC='" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND CodColor_CXPXC='" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "'";
            return cn.existe(consulta);
        }
        public int recuentoStock(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "Select Stock_CXPXC as [stock] from CaracteristicasXproductosXcolores where CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND CodCaracteristicas_CXPXC='" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND CodColor_CXPXC='" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "'";
            DataTable tabla = cn.ObtenerTabla("CaracteristicasXproductoXcolores", consulta);
            int cantidad;
            cantidad = Convert.ToInt32(tabla.Rows[0]["stock"] is DBNull ? 0 : tabla.Rows[0]["stock"]);
            return cantidad;
        }

        public int agregarStock(CaracteristicasXproductoXcolores cxpxc)
        {
            int cantFilas = cn.ejecutarTransaccion("INSERT INTO CaracteristicasXproductosXcolores VALUES ('" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "','" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "','" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "'," + cxpxc.Stock_CXPXC1 + ")");
            return cantFilas;
        }
        public int actualizarStock(CaracteristicasXproductoXcolores cxpxc)
        {
            int cantFilas = cn.RealizarConsulta("UPDATE CaracteristicasXproductosXcolores SET Stock_CXPXC = Stock_CXPXC + '" + cxpxc.Stock_CXPXC1 + "' WHERE CodProducto_CXPXC = '" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND CodCaracteristicas_CXPXC = '" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND CodColor_CXPXC = '" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "'");
            return cantFilas;
        }
        public Boolean existeStock(CaracteristicasXproductoXcolores cxpxc)
        {
            String consulta = "Select * from CaracteristicasXProductosXColores where CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "'";
            return cn.existe(consulta);
        }
        public DataTable getTablaCaracteristicas(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "SELECT distinct CodCaracteristicas_CXPXC, Nombre_Car FROM CaracteristicasXProductosXColores inner join Caracteristicas on CodCaracteristicas_CXPXC = CodCaracteristica_Car WHERE CodProducto_CXPXC = '" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND Estado_CXPXC = '1'";
            DataTable tabla = cn.ObtenerTabla("CaracteristicasXProductosXColores", consulta);
            return tabla;
        }
        public DataTable getTablaColores(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "SELECT Descripcion_Co, CodColor_CXPXC FROM CaracteristicasXProductosXColores INNER JOIN Colores ON CodColor_CXPXC = CodColor_Co WHERE CodProducto_CXPXC = '" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND CodCaracteristicas_CXPXC = '" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND Estado_CXPXC = '1'";
            DataTable tabla = cn.ObtenerTabla("CaracteristicasXProductosXColores", consulta);
            return tabla;
        }
        public DataTable getCantidad(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "SELECT Stock_CXPXC FROM CaracteristicasXProductosXColores where CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND CodCaracteristicas_CXPXC='" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND CodColor_CXPXC='" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "'";
            DataTable tabla = cn.ObtenerTabla("CaracteristicasXProductosXColores", consulta);
            return tabla;
        }

        public int insertarCxPxC(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "INSERT INTO CaracteristicasXproductosXcolores (CodProducto_CXPXC, CodCaracteristicas_CXPXC, CodColor_CXPXC, Stock_CXPXC)" +
                              "SELECT '"+cxpxc.CodProductos_CXPXC1.CodProducto_Pr1+"' , '"+cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1+"' , '"+cxpxc.CodColor_CXPXC1.Cod_Color_Co1+"' , '"+cxpxc.Stock_CXPXC1+"'";
            int filas = cn.RealizarConsulta(consulta);
            return filas;
        }

        public Boolean existeCaractProducto(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "SELECT * FROM CaracteristicasXProductosXColores where CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' " +
                              "AND CodCaracteristicas_CXPXC = '" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND CodColor_CXPXC = '" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "'";

            DataTable tabla = cn.ObtenerTabla("Producto", consulta);
            if(tabla.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Boolean estadoProducto(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "SELECT * FROM CaracteristicasXProductosXColores where CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' " +
                               "AND CodCaracteristicas_CXPXC = '" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND CodColor_CXPXC = '" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "' " +
                               "AND Estado_CXPXC = 1";

            DataTable tabla = cn.ObtenerTabla("Producto", consulta);
            if (tabla.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Boolean activarProducto(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "UPDATE CaracteristicasXProductosXColores SET Estado_CXPXC = 1, Stock_CXPXC = '"+cxpxc.Stock_CXPXC1+"' where CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' " +
                               "AND CodCaracteristicas_CXPXC = '" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND CodColor_CXPXC = '" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "' " +
                               "AND Estado_CXPXC = 0";

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

        public Boolean getEstado(CaracteristicasXproductoXcolores prod)
        {
            string consulta = "SELECT Estado_CXPXC FROM CaracteristicasXProductosXColores WHERE CodProducto_CXPXC = '" + prod.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND Estado_CXPXC = 1";
            DataTable tabla = cn.ObtenerTabla("Productos", consulta);

            //int num = Convert.ToInt32(tabla.Rows[0][0].ToString());

            if (tabla.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /*public Boolean actualizarRegistro(CaracteristicasXproductoXcolores Actual, CaracteristicasXproductoXcolores Nuevo)
        {
            string consulta = "UPDATE CaracteristicasXProductosXColores SET CodProducto_CXPXC = '"+Nuevo.CodProductos_CXPXC1.CodProducto_Pr1+ "', CodCaracteristicas_CXPXC = '"+Nuevo.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1+"' " +
                              "CodColor_CXPXC = '"+Nuevo.CodColor_CXPXC1.Cod_Color_Co1+ "' WHERE CodProducto_CXPXC = '"+Actual.CodProductos_CXPXC1.CodProducto_Pr1+"' AND " +
                              "CodCaracteristicas_CXPXC = '"+Actual.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1+ "' AND CodColor_CXPXC = '"+Actual.CodColor_CXPXC1.Cod_Color_Co1+"'"
        }*/

    }
}
