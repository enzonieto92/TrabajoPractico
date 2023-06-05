using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class datosProvincia
    {
        accesoDatos ds = new accesoDatos();

        public Boolean existenProvincias()
        {
            String consulta = "Select * from Provincia";
            return ds.existe(consulta);
        }

        public DataTable getTablaProvincias()
        {
            DataTable tabla = ds.ObtenerTablas("SELECT * from Provincia", "Provincia");
            return tabla;
        }

    }
}
