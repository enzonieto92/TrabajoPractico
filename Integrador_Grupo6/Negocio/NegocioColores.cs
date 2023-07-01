using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioColores
    {
        DAOcolor Dcol = new DAOcolor();
        public NegocioColores()
        {

        }
        public DataTable getTabla()
        {
            return Dcol.getTabla();
        }
        public DataTable listarColores()
        {
            DataTable tabla;

            tabla = Dcol.tablaCategorias();

            return tabla;
        }
        public string NombreColor(string codigo)
        {
            DataTable tabla;
            Colores col = new Colores();
            string nombre;
            col.Cod_Color_Co1 = codigo;
            tabla = Dcol.nombreColor(col);
            nombre = tabla.Rows[0][0].ToString();
            return nombre;
        }
        public string CodigoColor(string nombre)
        {
            DataTable tabla;
            Colores col = new Colores();
            string codigo;
            col.Descripcion_Co1 = nombre;
            tabla = Dcol.codigoColor(col);
            codigo = tabla.Rows[0][0].ToString();
            return codigo;
        }

    }
}
