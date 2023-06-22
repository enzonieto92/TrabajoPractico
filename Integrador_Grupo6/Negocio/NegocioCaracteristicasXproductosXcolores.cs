using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioCaracteristicasXproductosXcolores
    {
        DAOcaracteristicasXproductosXcolores dcxpxc = new DAOcaracteristicasXproductosXcolores();
        public bool agregarStock(string codProducto, string codCaracteristica, string codColor, int stock)
        {
            int cantFilas = 0;
            CaracteristicasXproductoXcolores CXPXC = new CaracteristicasXproductoXcolores();
            CXPXC.CodProductos_CXPXC1.CodProducto_Pr1 = codProducto;
            CXPXC.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = codCaracteristica;
            CXPXC.CodColor_CXPXC1.Cod_Color_Co1 = codColor;
            CXPXC.Stock_CXPXC1 = stock;
            if (dcxpxc.CaracteristicaXproductosXcolores(CXPXC) == false)
            {
                cantFilas = dcxpxc.agregarStock(CXPXC);
            }
            else
            {
                cantFilas = dcxpxc.actualizarStock(CXPXC);
            }

            if (cantFilas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool existeStock(string codProducto, string codCaracteristica, string codColor)
        {

            CaracteristicasXproductoXcolores cxpxc = new CaracteristicasXproductoXcolores();
            cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 = codProducto;
            cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = codCaracteristica;
            cxpxc.CodColor_CXPXC1.Cod_Color_Co1 = codColor;
            if (dcxpxc.CaracteristicaXproductosXcolores(cxpxc) == false)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public int recuentoStock(string codProducto, string codCaracteristica, string codColor)
        {
            CaracteristicasXproductoXcolores cxpxc = new CaracteristicasXproductoXcolores();
            cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 = codProducto;
            cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = codCaracteristica;
            cxpxc.CodColor_CXPXC1.Cod_Color_Co1 = codColor;

            return dcxpxc.recuentoStock(cxpxc);
        }
    }
}
