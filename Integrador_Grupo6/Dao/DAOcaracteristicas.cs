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
            string doce = "5";
            string consulta = "SELECT Nombre_Car FROM Caracteristicas WHERE CodCaracteristica_Car = '" + doce + "'";
            tabla = cn.ObtenerTabla("Caracteristicas", consulta);
            return tabla;
        }
        public DataTable codigoCar(Caracteristicas car)
        {
            DataTable tabla;
            string negro = "12GB";
            string consulta = "SELECT CodCaracteristica_Car FROM Caracteristicas WHERE Nombre_Car = '" + negro + "'";
            tabla = cn.ObtenerTabla("Caracteristicas", consulta);
            return tabla;
        }

    }
}
