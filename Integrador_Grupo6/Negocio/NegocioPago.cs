using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;

namespace Negocio
{
    public class NegocioPago
    {

        DAOmetodoPago Dpag = new DAOmetodoPago();
        public NegocioPago()
        {

        }

        public DataTable listarMetodoPago()
        {
            DataTable tabla;

            tabla = Dpag.tablaMetodoPago();

            return tabla;
        }


    }
}
