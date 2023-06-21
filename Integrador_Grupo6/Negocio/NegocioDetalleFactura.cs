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
    public class NegocioDetalleFactura
    {
        DAOdetalleFactura dDF = new DAOdetalleFactura();
        public DataTable getTabla(String nroFactura)
        {
            return dDF.getTabla(nroFactura);
        }
    }
}
