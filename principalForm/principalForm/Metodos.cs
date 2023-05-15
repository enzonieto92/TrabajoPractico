using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace principalForm
{
    public class Metodos
    {
        public Metodos()
        {
        }

        AccesoDatos conexion = new AccesoDatos();
        public DataTable cargarTabla()
        {
            string consultaListarSQL = "select IdProducto, NombreProducto, CantidadPorUnidad, PrecioUnidad from Productos";
            string nombre = "Productos";
            return conexion.ObtenerTablas(consultaListarSQL, nombre);
        }

        private void ArmarParametrosEliminarProductos(ref SqlCommand Comando, Productos Producto)
        {
            SqlParameter sqlParametro = new SqlParameter();
            sqlParametro = Comando.Parameters.Add("@IdProducto", SqlDbType.Int);
            sqlParametro.Value = Producto.IdProducto;
        }
    }
}