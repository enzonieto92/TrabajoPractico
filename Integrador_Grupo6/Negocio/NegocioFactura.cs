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
    public class NegocioFactura
    {
        DAOfactura df = new DAOfactura();
        public DataTable getTabla()
        {
            return df.getTabla();
        }
        public DataTable filtrar(string txt)
        {
            return df.getFiltro(txt);
        }
        public DataTable getTablaFecha(string consulta)
        {
            return df.getTablaFecha(consulta);
        }
        public decimal getTotalRecaudado(string consulta)
        {
            decimal cantidad = df.getTotalRecaudado(consulta);
            return cantidad;
        }
    }
}
