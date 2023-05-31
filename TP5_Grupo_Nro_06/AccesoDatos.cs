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
        public DataTable ObtenerTablas(string consultaSQL, string NombreTabla)
        {
            SqlConnection conn = new SqlConnection(rutaConexion);
            conn.ConnectionString = rutaConexion;
            conn.Open();
            SqlDataAdapter adap = new SqlDataAdapter(consultaSQL, conn);
            DataSet ds = new DataSet();
            adap.Fill(ds, NombreTabla);
            conn.Close();
            return ds.Tables[NombreTabla];
        }

        public int RealizarConsulta(string consultaSQL)
        {
            SqlConnection cn = new SqlConnection(rutaConexion);
            cn.Open();
            SqlCommand cmd = new SqlCommand(consultaSQL, cn);
            int Rows = (int)cmd.ExecuteNonQuery();
            cn.Close();
            return Rows; 
        }

    }
}