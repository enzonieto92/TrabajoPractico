using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;

namespace Dao
{
    public class DAOmarcas
    {
        AccesoDatos cn = new AccesoDatos();
        public DAOmarcas()
        {

        }

        public int agregarStock(Marcas mar)
        {
            int cantFilas = cn.ejecutarTransaccion("INSERT INTO Marcas VALUES ('" + mar.CodMarca_Ma + "','" + mar.Descripcion_Ma + ")");
            return cantFilas;
        }

        public DataTable tablaMarcas()
        {
            DataTable tabla;
            string consulta = "SELECT CodMarca_Ma, Descripcion_Ma FROM Marcas";

            tabla = cn.ObtenerTabla("Marcas", consulta);

            return tabla;
        }
        public DataTable tablaMarcasv2(Productos p)
        {
            DataTable tabla;
            string consulta = "SELECT CodMarca_Ma, Descripcion_Ma FROM Marcas " +
                              "ORDER BY CASE WHEN CodMarca_Ma = (SELECT CodMarcas_Pr FROM Productos WHERE CodProducto_Pr = '" + p.CodProducto_Pr1 + "') THEN 0 ELSE 1 END, CodMarca_Ma ASC";

            tabla = cn.ObtenerTabla("Marcas", consulta);

            return tabla;
        }

        public DataTable nomMarca(string CodMarca)
        {
            DataTable tabla;
            string consulta = "SELECT Descripcion_Ma FROM Marcas WHERE CodMarca_Ma = " + CodMarca;

            tabla = cn.ObtenerTabla("Marcas", consulta);

            return tabla;
        }

        public DataTable codMarca(string nombre)
        {
            DataTable tabla;
            string consulta = "SELECT CodMarca_Ma FROM Marcas WHERE Descripcion_Ma = " + nombre;

            tabla = cn.ObtenerTabla("Marcas", consulta);

            return tabla;
        }

    }
}
