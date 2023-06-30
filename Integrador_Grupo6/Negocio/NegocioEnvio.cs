using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;

namespace Negocio
{
    public class NegocioEnvio
    {
        DAOmetodoEnvio Denv = new DAOmetodoEnvio();
        public NegocioEnvio()
        {

        }

        public DataTable tablaEnvio()
        {
            DataTable tabla = Denv.tablaMetodoEnvio();

            return tabla;
        }

    }
}
