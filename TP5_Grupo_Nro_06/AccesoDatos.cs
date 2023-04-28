using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace TP5_Grupo_Nro_06
{
    public class AccesoDatos
    {
        private static string rutaConexion = @"Data Source=localhost\sqlexpress; Initial Catalog = BDSucursales; Integrated Security = True";
        public DataTable ObtenerTablas(string consultaSQL, string Provincias)
        {
            SqlConnection conn = new SqlConnection(rutaConexion);
            conn.ConnectionString = rutaConexion;
            conn.Open();
            SqlDataAdapter adap = new SqlDataAdapter(consultaSQL, conn);
            DataSet ds = new DataSet();
            adap.Fill(ds, "Provincias");
            conn.Close();
            return ds.Tables["Provincias"];
        }


    }
}