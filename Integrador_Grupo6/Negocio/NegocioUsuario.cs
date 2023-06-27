using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioUsuario
    {
        DAOusuario du = new DAOusuario();
        public DataTable getTabla()
        {
            return du.getTabla();
        }
        public bool EliminarUsuario(Usuario us)
        {
            DAOusuario dao = new DAOusuario();
            int op = dao.eliminarUsuario(us);
            if (op == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool existeUsuario(Usuario Us)
        {
            bool existe = du.existeUsuario(Us);
            if (existe)
                return true;
            else
                return false;
        }
        public Usuario CrearLog(string Usuario, string Contraseña)
        {
                Usuario user = new Usuario();
                DataTable tablaUsuario = new DataTable();
                user.Usuario_Us1 = Usuario;
                user.Contraseña_Us1 = Contraseña;
            if (du.IniciarSesion(user))
            {
                tablaUsuario = du.BuscarUsuario(user);
            }
            if (tablaUsuario.Rows.Count > 0)
            {
                DataRow filaUsuario = tablaUsuario.Rows[0];

                user.Nombre_Us1 = filaUsuario["Nombre_Us"].ToString();
                user.Apellido_Us1 = filaUsuario["Apellido_Us"].ToString();
                user.DNI_Us1 = filaUsuario["DNI_Us"].ToString();
                user.Email_Us1 = filaUsuario["Email_Us"].ToString();
                user.Telefono_Us1 = filaUsuario["Telefono_Us"].ToString();
                user.FechaNacimineto_Us1 = Convert.ToDateTime(filaUsuario["FechaNacimiento_Us"]);
                return user;
            }
            else
            {
                return null;
            }


            }
        public bool esAdmin(string usuario, string contraseña)
        {
            Usuario user = new Usuario();
            user.Usuario_Us1 = usuario;
            user.Contraseña_Us1 = contraseña;
            bool esAdmin = du.esAdmin(user);
            if (esAdmin)
                return true;
            else
                return false;
        }
        public bool existeMail(Usuario Us)
        {
            bool existe = du.existeMail(Us);
            if (existe)
                return true;
            else
                return false;
        }
        public bool existeDNI(Usuario Us)
        {
            bool existe = du.existeDNI(Us);
            if (existe)
                return true;
            else
                return false;
        }
        public bool AgregarUsuario(Usuario Us)
        {
            int cantFilas = 0;

            cantFilas = du.AgregarUsuario(Us);
            if (cantFilas == 1) return true;
            else return false;
        }
        public bool ActualizarUsuario(Usuario Us)
        {
            int cantFilas = 0;

            cantFilas = du.ActualizarUsuario(Us);
            if (cantFilas == 1) return true;
            else return false;
        }

        public DataTable filtrarUsuario(string tipo, string texto)
        {
            return du.filtroUsuario(tipo, texto);
        }
    }
}
