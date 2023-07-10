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

        public DataTable getTabla()
        {
            string consulta = "Select * from Usuario";
            DataTable tabla = cn.ObtenerTabla("Usuario", consulta);
            return tabla;
        }
        public Boolean existeMail(Usuario Us)
        {
            String consulta = "Select * from Usuario where Email_Us='" + Us.Email_Us1 + "'AND NOT DNI_Us = '" + Us.DNI_Us1 + "'";
            return cn.existe(consulta);
        }
        public Boolean existeUsuario(Usuario Us)
        {
            String consulta = "Select * from Usuario where Usuario_Us='" + Us.Usuario_Us1 + "' AND NOT DNI_Us='" + Us.DNI_Us1 + "'";
            return cn.existe(consulta);
        }
        public Boolean IniciarSesion(Usuario Us)
        {
            String consulta = "Select * from Usuario where Usuario_Us='" + Us.Usuario_Us1 + "' AND Contraseña_Us='" + Us.Contraseña_Us1 + "' AND Estado_Us=1";
            return cn.existe(consulta);
        }
        public DataTable BuscarUsuario(Usuario Us)
        {
            String consulta = "Select * FROM Usuario WHERE Usuario_Us='" + Us.Usuario_Us1 + "' AND Contraseña_Us='" + Us.Contraseña_Us1+ "'";
            if (cn.existe(consulta))
            {
                String consulta2 = "SELECT * FROM Usuario WHERE Usuario_Us='" + Us.Usuario_Us1 + "'";
                return cn.ObtenerTabla("Usuario", consulta2);
            }
            else
            {
                return null;
            }
        }

        public Boolean esAdmin(Usuario Us)
        {
            String consulta = "Select * from Usuario where Usuario_Us='" + Us.Usuario_Us1 + "'AND Tipo_Us = '2'";
            return cn.existe(consulta);
        }
        public Boolean existeDNI(Usuario Us)
        {
            String consulta = "Select * from Usuario where DNI_Us='" + Us.DNI_Us1 + "'";
            return cn.existe(consulta);
        }
        public int AgregarUsuario(Usuario Us)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosAgregar(ref cmd, Us);
            AccesoDatos cn = new AccesoDatos();
            int filasAfectadas = cn.EjecutarProcedimientoAlmacenado(cmd, "SPInsertarUsuario");
            if (filasAfectadas == 1) return 1;
            return 0;
        }

        public void armarParametrosAgregar(ref SqlCommand cmd, Usuario Us)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@DNI", SqlDbType.Char, 10);
            parametros.Value = Us.DNI_Us1;

            parametros = cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 30);
            parametros.Value = Us.Usuario_Us1;

            parametros = cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar, 30);
            parametros.Value = Us.Contraseña_Us1;

            parametros = cmd.Parameters.Add("@Email", SqlDbType.VarChar, 60);
            parametros.Value = Us.Email_Us1;

            parametros = cmd.Parameters.Add("@Telefono", SqlDbType.Char, 10);
            parametros.Value = Us.Telefono_Us1;

            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 30);
            parametros.Value = Us.Nombre_Us1;

            parametros = cmd.Parameters.Add("@Apellido", SqlDbType.VarChar, 30);
            parametros.Value = Us.Apellido_Us1;

            parametros = cmd.Parameters.Add("@FechaNac", SqlDbType.Date);
            parametros.Value = Us.FechaNacimineto_Us1;
        }

        public int eliminarUsuario(Usuario us)
        {
            SqlCommand comando = new SqlCommand();
            ArmarParametroUsuarioEliminar(ref comando, us);
            return cn.EjecutarProcedimientoAlmacenado(comando, "spEliminarUsuario");
        }

        private void ArmarParametroUsuarioEliminar(ref SqlCommand comando, Usuario us)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = comando.Parameters.Add("@DNI", SqlDbType.Int);
            SqlParametros.Value = us.DNI_Us1;
        }
        public int ActualizarUsuario(Usuario Us)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosUsuarioActualizar(ref cmd, Us);
            AccesoDatos cn = new AccesoDatos();
            int filasAfectadas = cn.EjecutarProcedimientoAlmacenado(cmd, "SPActualizarUsuario");
            if (filasAfectadas == 1) return 1;
            return 0;
        }
        public void armarParametrosUsuarioActualizar(ref SqlCommand cmd, Usuario Us)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@DNI", SqlDbType.Char, 10);
            parametros.Value = Us.DNI_Us1;

            parametros = cmd.Parameters.Add("@Email", SqlDbType.VarChar, 60);
            parametros.Value = Us.Email_Us1;

            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 30);
            parametros.Value = Us.Nombre_Us1;

            parametros = cmd.Parameters.Add("@Apellido", SqlDbType.VarChar, 30);
            parametros.Value = Us.Apellido_Us1;

            parametros = cmd.Parameters.Add("@FechaNac", SqlDbType.Date);
            parametros.Value = Us.FechaNacimineto_Us1;

            parametros = cmd.Parameters.Add("@Telefono", SqlDbType.Char, 10);
            parametros.Value = Us.Telefono_Us1;

            parametros = cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 30);
            parametros.Value = Us.Usuario_Us1;

            parametros = cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar, 30);
            parametros.Value = Us.Contraseña_Us1;

            parametros = cmd.Parameters.Add("@Tipo", SqlDbType.Int);
            parametros.Value = Us.Tipo_Us1;

            parametros = cmd.Parameters.Add("@Estado", SqlDbType.Bit);
            parametros.Value = Us.Estado_Us1;
        }
        public DataTable filtroUsuario(string tipo, string texto)
        {
            string consulta = "select * from Usuario where " + tipo + " like '%[" + texto + "]%'";
            DataTable tabla = cn.ObtenerTabla("Usuario", consulta);
            return tabla;
        }
    }
}
