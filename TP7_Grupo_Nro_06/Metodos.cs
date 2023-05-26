using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace TP7_Grupo_Nro_06
{
    public class Metodos
    {
        public DataTable CrearTabla()
        {
            DataTable tabla = new DataTable();

            tabla.Columns.Add("ID_Sucursal");
            tabla.Columns.Add("Nombre Sucursal");
            tabla.Columns.Add("Descripcion Sucursal");

            return tabla;
        }

        public void AgregarFila(DataTable tabla, string idSucursal, string nombreSucursal, string DescripcionSucursal)
        {
            DataRow fila;
            fila = tabla.NewRow();
            fila["ID_Sucursal"] = idSucursal;
            fila["Nombre Sucursal"] = nombreSucursal;
            fila["Descripcion Sucursal"] = DescripcionSucursal;
            tabla.Rows.Add(fila);
        }
    }
}