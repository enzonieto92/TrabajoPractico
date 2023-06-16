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
    public class DAOusuario
    {
        AccesoDatos cn = new AccesoDatos();
        public Usuario getUsuario(Usuario usu)
        {
            DataTable tabla = cn.ObtenerTabla("Usuario", "SELECT Dni_Us, Email_Us, Nombre_Us, Apellido_Us, FechaNacimiento_Us, Telefono_Us, Usuario_Us, Contraseña_Us, Tipo_Us, Estado_Us FROM USUARIO WHERE Usuario_Us = '" + usu.Usuario_Us1 + "'");

            usu.DNI_Us1 = tabla.Rows[0][0].ToString();
            usu.Email_Us1 = tabla.Rows[0][1].ToString();
            usu.Nombre_Us1 = tabla.Rows[0][2].ToString();
            usu.Apellido_Us1 = tabla.Rows[0][3].ToString();
            usu.FechaNacimineto_Us1 = Convert.ToDateTime(tabla.Rows[0][4].ToString());
            usu.Telefono_Us1 = tabla.Rows[0][5].ToString();
            usu.Usuario_Us1 = tabla.Rows[0][6].ToString();
            usu.Contraseña_Us1 = tabla.Rows[0][7].ToString();
            usu.Tipo_Us1 = Convert.ToInt32(tabla.Rows[0][8].ToString());
            usu.Estado_Us1 = Convert.ToBoolean(tabla.Rows[0][0].ToString());
            return usu;
        }

        public DataTable getTabla(string consulta)
        {
            DataTable tabla = cn.ObtenerTabla("Usuario", consulta);
            return tabla;
        }
        public int eliminarUsuario(Usuario us)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametroSucursalEliminar(ref comando, us);
            return cn.EjecutarProcedimientoAlmacenado(comando, "spEliminarUsuario");
        }
        private void ArmarParametroSucursalEliminar(ref SqlCommand comando, Usuario us)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = comando.Parameters.Add("@DNI", SqlDbType.Int);
            SqlParametros.Value = us.DNI_Us1;
        }
    }
}
