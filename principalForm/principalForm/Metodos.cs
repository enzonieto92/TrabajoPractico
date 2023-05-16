﻿using System;
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
      /*  private void ArmarParametrosActualizarProductos(ref SqlCommand comando, Productos producto)
        {
            SqlParameter sqlParametro = new SqlParameter();
            sqlParametro = comando.Parameters.Add("@IdProducto", SqlDbType.Int);
            sqlParametro = comando.Parameters.Add("@NombreProducto", SqlDbType.NVarChar, 40);
            sqlParametro = comando.Parameters.Add("@CantidadPorUnidad", SqlDbType.NVarChar, 20);
            sqlParametro = comando.Parameters.Add("@PrecioUnidad", SqlDbType.Money);
            sqlParametro.Value = producto.IdProducto;
        }*/
        public int ActualizarProducto(Productos prod)
        {
            int IDprod = prod.IdProducto;
            string nombre = prod.Nombre;
            string cant = prod.Cantidad;
            float pre = (float)prod.Precio;

            string consulta = "update Productos set NombreProducto = '"+nombre+"', CantidadPorUnidad = '"+cant+"', PrecioUnidad = '"+pre+"' where IdProducto = "+IDprod;
            return conexion.RealizarConsulta(consulta);
        }
        public int EliminarProducto(Productos prod, string id)
        {
            string consulta = "delete FROM Productos WHERE IdProducto = " + id;
            return conexion.RealizarConsulta(consulta);

        }

    }
}