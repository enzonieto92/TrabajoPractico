using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;


namespace Dao
{
    public class DAOcaracteristicas
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla()
        {
            string consulta = "select * from Caracteristicas";
            DataTable tabla = cn.ObtenerTabla("Caracteristicas", consulta);
            return tabla;
        }
    }
}
