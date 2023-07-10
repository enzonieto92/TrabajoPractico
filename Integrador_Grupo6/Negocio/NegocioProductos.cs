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
    public class NegocioProductos
    {
        DAOproductos Dpr = new DAOproductos();
        public NegocioProductos()
        {

        }

        public DataTable getTabla()
        {
            return Dpr.getTabla();
        }

        public DataTable getTablaInicio()
        {
            return Dpr.getTablaInicio();
        }


        public bool existeProducto(string CodProducto)
        {
            bool existe = Dpr.existeProducto(CodProducto);
            if (existe)
            {
                return true;
            }
            else
                return false;
        }

        public bool eliminarProducto(CaracteristicasXproductoXcolores cxpxc)
        {
            int cantFilas = 0;
            cantFilas = Dpr.eliminarProducto(cxpxc);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool actualizarProducto(Productos prod)
        {
            int cantFilas = 0;
            cantFilas = Dpr.actualizarProducto(prod);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool agregarProducto(Productos prod)
        {
            int cantFilas = 0;
            cantFilas = Dpr.agregarProducto(prod);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public DataTable filtrarProductos(string tipo, string texto)
        {
            return Dpr.filtroProductos(tipo, texto);
        }

        public DataTable buscarProducto(string texto)
        {
            return Dpr.BuscarProducos(texto);
        }

        public Boolean EditarStock(string codigo, string stock)
        {
            if (Dpr.EditarStock(codigo, stock) == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataTable InicioFiltros(string categoria, string marca, string precioMax, string precioMin)
        {
            return Dpr.inicioFiltros(categoria,marca,precioMax,precioMin);
        }
        public DataTable getTablaProductosSeleccionados(String id)
        {
            Productos p = new Productos();
            p.CodProducto_Pr1 = id;
            return Dpr.getTablaProductosSeleccionados(p);
        }

        public bool existeCXPXC(string Prod, string Caract, string Color)
        {
            CaracteristicasXproductoXcolores cxpxc = new CaracteristicasXproductoXcolores();
            DAOcaracteristicasXproductosXcolores DC = new DAOcaracteristicasXproductosXcolores();

            cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 = Prod;
            cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = Caract;
            cxpxc.CodColor_CXPXC1.Cod_Color_Co1 = Color;

            return DC.existeCaractProducto(cxpxc);
        }

        public Boolean getEstadoProducto(string Prod, string Caract, string Color)
        {
            CaracteristicasXproductoXcolores cxpxc = new CaracteristicasXproductoXcolores();
            DAOcaracteristicasXproductosXcolores DC = new DAOcaracteristicasXproductosXcolores();

            cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 = Prod;
            cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = Caract;
            cxpxc.CodColor_CXPXC1.Cod_Color_Co1 = Color;

            return DC.estadoProducto(cxpxc);
        }

        public Boolean ActProducto(string Prod, string Caract, string Color, int stock)
        {
            CaracteristicasXproductoXcolores cxpxc = new CaracteristicasXproductoXcolores();
            DAOcaracteristicasXproductosXcolores DC = new DAOcaracteristicasXproductosXcolores();

            cxpxc.CodProductos_CXPXC1.CodProducto_Pr1 = Prod;
            cxpxc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = Caract;
            cxpxc.CodColor_CXPXC1.Cod_Color_Co1 = Color;
            cxpxc.Stock_CXPXC1 = stock;

            return DC.activarProducto(cxpxc);
        }

        public Boolean bajaProducto(string codProd)
        {
            Productos pro = new Productos();
            DAOproductos dp = new DAOproductos();

            pro.CodProducto_Pr1 = codProd;

            return dp.bajaProducto(pro);
        }

        public Boolean altaProducto(string codProd)
        {
            Productos pro = new Productos();
            DAOproductos dp = new DAOproductos();

            pro.CodProducto_Pr1 = codProd;

            return dp.altaProducto(pro);
        }

        public Boolean getEstadoProd(CaracteristicasXproductoXcolores pro)
        {
            DAOcaracteristicasXproductosXcolores dc = new DAOcaracteristicasXproductosXcolores();

            return dc.getEstado(pro);
        }

    }
}
