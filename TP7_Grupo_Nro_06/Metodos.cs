using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace TP7_Grupo_Nro_06
{
    public class Metodos
    {
        public DataTable CrearTabla()
        {
            DataTable dt = new DataTable();
            DataColumn columna = new DataColumn("Id_Sucursal", System.Type.GetType("System.Int32"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Nombre Sucursal", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Descripcion Sucursal", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            return dt;
        }

        public void AgregarFila(DataTable tabla, string idSucursal, string nombreSucursal, string DescripcionSucursal)
        {
            DataRow fila = tabla.NewRow();
            fila["ID_Sucursal"] = idSucursal;
            fila["Nombre Sucursal"] = nombreSucursal;
            fila["Descripcion Sucursal"] = DescripcionSucursal;
            tabla.Rows.Add(fila);
        }

        public Boolean SucursalRepetida(DataTable tabla, string id)
        {
            int cantFilas, i;

            cantFilas = tabla.Rows.Count;

            for (i = 0; i < cantFilas; i++)
            {
                if (tabla.Rows[i][0].ToString() == id)
                {
                    return true;
                }
            }
            return false;
        }

    }
}