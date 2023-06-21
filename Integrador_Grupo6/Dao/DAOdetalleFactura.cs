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
    }
}
