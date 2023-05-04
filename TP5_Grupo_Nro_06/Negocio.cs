﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace TP5_Grupo_Nro_06
{
    public class Negocio
    {
        AccesoDatos conexion = new AccesoDatos();

        public DataTable ObtenerProvincias()
        {
            string consultaSQL = "SELECT * FROM Provincia";
            string nombreTabla = "Provincias";
            return conexion.ObtenerTablas(consultaSQL, nombreTabla);
        }

        public int AgregarSucursal(string nombre, string descripcion, string idProvincia, string direccion)
        {
            if(string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(descripcion) || string.IsNullOrEmpty(idProvincia) || string.IsNullOrEmpty(direccion))
            {
                return -1;
            }
            else
            {
            string consultaSQL = "INSERT INTO Sucursal (NombreSucursal, DescripcionSucursal, Id_ProvinciaSucursal, DireccionSucursal) VALUES ('"+nombre+"', '"+descripcion+"', "+idProvincia+", '"+direccion+"')";
            return conexion.RealizarConsulta(consultaSQL);
            }
            
        }

        public DataTable listarSucursalInicial()
        {
            string consultaListarSQL = "select Sucursal.Id_Sucursal, Sucursal.NombreSucursal, Sucursal.DescripcionSucursal, Provincia.DescripcionProvincia, Sucursal.DireccionSucursal from Sucursal inner join Provincia on Sucursal.Id_ProvinciaSucursal = Provincia.Id_Provincia";
            string nombre = "Sucursal";
            return conexion.ObtenerTablas(consultaListarSQL, nombre);
        }

    }
}