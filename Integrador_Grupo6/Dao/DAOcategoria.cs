using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class DAOcategoria
    {
        AccesoDatos cn = new AccesoDatos();

        public DAOcategoria()
        {

        }

        public DataTable tablaCategorias()
        {
            DataTable tabla;
            string consulta = "SELECT CodCategoria_Cat, Descripcion_Cat FROM Categoria";

            tabla=cn.ObtenerTabla("Categorias", consulta);

            return tabla;
        }

        public DataTable CodCategoria(string nombreCategoria)
        {
            DataTable tabla;
            string consulta = "SELECT CodCategoria_Cat, FROM Categoria WHERE Descripcion_Cat = " + nombreCategoria;

            tabla = cn.ObtenerTabla("Categorias", consulta);

            return tabla;
        }
    }
}
