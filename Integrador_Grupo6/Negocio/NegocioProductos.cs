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

        public bool eliminarProducto(Productos prod)
        {
            int cantFilas = 0;
            cantFilas = Dpr.eliminarProducto(prod);

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

        public Boolean agregarStock(string codigo, string stock)
        {
            if (Dpr.agregarStock(codigo, stock) == 1)
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
            return Dpr.inicioFiltros(categoria, marca, precioMax, precioMin);
        }

    }
}
