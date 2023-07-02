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
        public DataTable nombreCar(Caracteristicas car)
        {
            DataTable tabla;
            string consulta = "SELECT Nombre_Car FROM Caracteristicas WHERE CodCaracteristica_Car = '" + car.Cod_Caracteristica_Car1 + "'";
            tabla = cn.ObtenerTabla("Caracteristicas", consulta);
            return tabla;
        }
        public DataTable codigoCar(Caracteristicas car)
        {
            DataTable tabla;
            string consulta = "SELECT CodCaracteristica_Car FROM Caracteristicas WHERE Nombre_Car = '" + car.Nombre_Car1 + "'";
            tabla = cn.ObtenerTabla("Caracteristicas", consulta);
            return tabla;
        }

    }
}
