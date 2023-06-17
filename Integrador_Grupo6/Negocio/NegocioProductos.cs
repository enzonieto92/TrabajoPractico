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

        public DataTable getTabla(string consulta)
        {
            return Dpr.getTabla(consulta);
        }

        public bool existeUsuario(string CodProducto)
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



    }
}
