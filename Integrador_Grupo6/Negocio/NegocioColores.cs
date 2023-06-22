using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;

namespace Negocio
{
    public class NegocioColores
    {
        DAOcolor Dcol = new DAOcolor();
        public NegocioColores()
        {

        }
        public DataTable getTabla()
        {
            return Dcol.getTabla();
        }
        public DataTable listarColores()
        {
            DataTable tabla;

            tabla = Dcol.tablaCategorias();

            return tabla;
        }
    }
}
