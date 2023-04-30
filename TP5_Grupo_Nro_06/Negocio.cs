using System;
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
            string consultaSQL = "INSERT INTO Sucursal (NombreSucursal, descripcionSucursa, Id_ProvinciaSucursal, DireccionSucursal) VALUES ('nombre', 'descripcion', 'idProvincia', 'direccion')";
            return conexion.RealizarConsulta(consultaSQL);
        }

    }
}