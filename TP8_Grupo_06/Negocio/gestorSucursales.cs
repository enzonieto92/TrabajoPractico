using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Datos;

namespace Negocio
{
    public class gestorSucursales
    {
        Conexion ruta = new Conexion();

        public int AgregarSucursal(string nombre, string descripcion, string idProvincia, string direccion)
        {

            string consultaSQL = "INSERT INTO Sucursal (NombreSucursal, DescripcionSucursal, Id_ProvinciaSucursal, DireccionSucursal) VALUES ('" + nombre + "', '" + descripcion + "', " + idProvincia + ", '" + direccion + "')";
            return ruta.RealizarConsulta(consultaSQL);

        }
    }
}
