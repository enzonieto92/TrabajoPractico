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
    public class NegocioMarcas
    {
        DAOmarcas Dmar = new DAOmarcas();
        public NegocioMarcas()
        {

        }

        public bool agregarMarca(string codMarca, string descripcion)
        {
            int cantFilas = 0;
            Marcas mar = new Marcas();

            mar.CodMarca_Ma = codMarca;
            mar.Descripcion_Ma = descripcion;

            cantFilas = Dmar.agregarStock(mar);

            if (cantFilas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public DataTable listarMarcas()
        {

            return Dmar.tablaMarcas();
        }
        public DataTable listarMarcasv2(Productos p)
        {

            return Dmar.tablaMarcasv2(p);
        }
        public string nombreMarca(string codigoMarca)
        {
            string nombre;
            DataTable tabla;

            tabla = Dmar.nomMarca(codigoMarca);
            nombre = tabla.Rows[0]["Descripcion_Ma"].ToString();

            return nombre;
        }

        public string codigoMarca (string nombre)
        {
            string codigo;
            DataTable tabla;

            tabla = Dmar.codMarca(nombre);
            codigo = tabla.Rows[0]["CodMarca_Ma"].ToString();

            return codigo;
        }
    }
}
