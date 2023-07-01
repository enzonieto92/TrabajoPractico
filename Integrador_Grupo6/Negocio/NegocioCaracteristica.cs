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
    public class NegocioCaracteristica
    {
        DAOcaracteristicas dc = new DAOcaracteristicas();
        public DataTable getTabla()
        {
            return dc.getTabla();
        }
        public string nombreCaract(string codigo)
        {
            DataTable tabla;
            Caracteristicas car = new Caracteristicas();
            string nombre;
            car.Cod_Caracteristica_Car1 = codigo;
            tabla = dc.nombreCar(car);
            nombre = tabla.Rows[0][0].ToString();
            return nombre;
        }
        public string codigoCaract(string nombre)
        {
            DataTable tabla;
            Caracteristicas car = new Caracteristicas();
            string codigo;
            car.Nombre_Car1 = nombre;
            tabla = dc.codigoCar(car);
            codigo = tabla.Rows[0][0].ToString();
            return codigo;
        }
    }
}
