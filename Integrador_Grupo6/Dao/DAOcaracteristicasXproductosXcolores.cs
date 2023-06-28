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
            int cantFilas = cn.ejecutarTransaccion("UPDATE CaracteristicasXproductosXcolores SET Stock_CXPXC = " + cxpxc.Stock_CXPXC1 + " WHERE CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND CodCaracteristicas_CXPXC = '" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND CodColor_CXPXC = '" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "'");
            return cantFilas;
        }
        public Boolean existeStock(CaracteristicasXproductoXcolores cxpxc)
        {
            String consulta = "Select * from CaracteristicasXProductosXColores where CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "'";
            return cn.existe(consulta);
        }
        public DataTable getTablaCaracteristicas(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "SELECT distinct CodCaracteristicas_CXPXC, Nombre_Car FROM CaracteristicasXProductosXColores inner join Caracteristicas on CodCaracteristicas_CXPXC = CodCaracteristica_Car WHERE CodProducto_CXPXC = '" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "'";
            DataTable tabla = cn.ObtenerTabla("CaracteristicasXProductosXColores", consulta);
            return tabla;
        }
        public DataTable getTablaColores(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "SELECT Descripcion_Co, CodColor_CXPXC FROM CaracteristicasXProductosXColores INNER JOIN Colores ON CodColor_CXPXC = CodColor_Co WHERE CodProducto_CXPXC = '" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND CodCaracteristicas_CXPXC = '" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "'";
            DataTable tabla = cn.ObtenerTabla("CaracteristicasXProductosXColores", consulta);
            return tabla;
        }
        public DataTable getCantidad(CaracteristicasXproductoXcolores cxpxc)
        {
            string consulta = "SELECT Stock_CXPXC FROM CaracteristicasXProductosXColores where CodProducto_CXPXC='" + cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 + "' AND CodCaracteristicas_CXPXC='" + cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 + "' AND CodColor_CXPXC='" + cxpxc.CodColor_CXPXC1.Cod_Color_Co1 + "'";
            DataTable tabla = cn.ObtenerTabla("CaracteristicasXProductosXColores", consulta);
            return tabla;
        }
    }
}
