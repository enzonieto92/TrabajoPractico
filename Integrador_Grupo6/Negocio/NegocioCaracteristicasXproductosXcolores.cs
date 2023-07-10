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
        CaracteristicasXproductoXcolores cxpxc = new CaracteristicasXproductoXcolores();
        public bool EditarStock(string codProducto, string codCaracteristica, string codColor, int stock)
        {
            int cantFilas = 0;
            CaracteristicasXproductoXcolores CXPXC = new CaracteristicasXproductoXcolores();
            CXPXC.CodProductos_CXPXC1.CodProducto_Pr1 = codProducto;
            CXPXC.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = codCaracteristica;
            CXPXC.CodColor_CXPXC1.Cod_Color_Co1 = codColor;
            CXPXC.Stock_CXPXC1 = stock;


            cantFilas = dcxpxc.actualizarStock(CXPXC);


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
        public bool existeStockv2(CaracteristicasXproductoXcolores cxpxc)
        {
            bool existe = dcxpxc.existeStock(cxpxc);

            if (existe)
                return true;
            else
                return false;
        }
        public DataTable getTablaCaracteristicas(String id)
        {
            cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 = id;
            return dcxpxc.getTablaCaracteristicas(cxpxc);
        }
        public DataTable getTablaColores(String id, string codCaracteristica)
        {
            cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 = id;
            cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = codCaracteristica;
            return dcxpxc.getTablaColores(cxpxc);
        }
        public int getCantidad(String id, string codCaracteristica, string codColor)
        {
            cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 = id;
            cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = codCaracteristica;
            cxpxc.CodColor_CXPXC1.Cod_Color_Co1 = codColor;
            DataTable tabla = dcxpxc.getCantidad(cxpxc);
            return Convert.ToInt32(tabla.Rows[0][0]);
        }

        public Boolean agregarCxPxC(CaracteristicasXproductoXcolores cpc)
        {
            int cantFilas = dcxpxc.insertarCxPxC(cpc);

            if(cantFilas == 0)
            {
                return false;
            }
            else{
                return true;
            }
        }
    }
}
