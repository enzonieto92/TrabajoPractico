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
        public bool existeMail(Usuario Us)
        {
            bool existe = du.existeMail(Us);
            if (existe)
                return true;
            else
                return false;
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
