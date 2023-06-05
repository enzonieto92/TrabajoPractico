using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class datosSucursal
    {
        accesoDatos ds = new accesoDatos();
        public Boolean existeSucursal(Sucursal suc)
        {
            int Id = suc.Id;
            String consulta = "Select * from Sucursal where NombreSucursal='" + Id + "'";
            return ds.existe(consulta);
        }

        public int agregarSucursal(Sucursal suc)
        {
            suc.Id = (ds.ObtenerMaximo("SELECT max(Id_Sucursal) FROM Sucursal")+1);
            SqlCommand comando = new SqlCommand();
            ArmarParametrosAgregarSucursal(ref comando, suc);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spAgregarSucursal");
        }

        private void ArmarParametrosAgregarSucursal(ref SqlCommand Comando, Sucursal suc)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@NOMBRESUC", SqlDbType.VarChar);
            SqlParametros.Value = suc.Nombre;
            SqlParametros = Comando.Parameters.Add("@DESCRIPCION", SqlDbType.VarChar);
            SqlParametros.Value = suc.Descripcion;
            SqlParametros = Comando.Parameters.Add("@IDPROVINCIASUCURSAL", SqlDbType.Int);
            SqlParametros.Value = suc.IdProvincia;
            SqlParametros = Comando.Parameters.Add("@DIRECCIONSUC", SqlDbType.VarChar);
            SqlParametros.Value = suc.Direccion;
        }

        public DataTable TablaSucursales()
        {
            accesoDatos ac = new accesoDatos();
            DataTable tabla;

            string consulta = "SELECT Id_Sucursal, NombreSucursal, DescripcionSucursal, Id_ProvinciaSucursal, DireccionSucursal FROM Sucursal";

            tabla = ac.ObtenerTablas(consulta, "Sucursales");

            return tabla;
        }

        public DataTable DatosSucursal(Sucursal suc)
        {
            accesoDatos ac = new accesoDatos();
            DataTable tabla;
            string consulta = "SELECT Id_Sucursal, NombreSucursal, DescripcionSucursal, Id_ProvinciaSucursal, DireccionSucursal FROM Sucursal WHERE Id_Sucursal = '"+suc.Id+"'";

            tabla = ac.ObtenerTablas(consulta, "Sucursal");

            //suc.Nombre = tabla.Rows[0]["NombreSucursal"].ToString();
            //suc.Descripcion = tabla.Rows[0]["DescripcionSucursal"].ToString();
            //suc.IdProvincia = Convert.ToInt32(tabla.Rows[0]["Id_ProvinciaSucursal"]);

            return tabla;
        }
    }
}
