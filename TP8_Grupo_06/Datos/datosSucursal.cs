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
    }
}
