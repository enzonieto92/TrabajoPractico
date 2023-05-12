using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace principalForm
{
    public class AccesoDatos
    {
        private static string rutaConexion = @"Data Source=localhost\sqlexpress; Initial Catalog = Neptuno; Integrated Security = True";
        public DataTable ObtenerTablas(string consultaSQL, string NombreTabla)
        {
            SqlConnection con = new SqlConnection(rutaConexion);
            con.ConnectionString = rutaConexion;
            con.Open();
            SqlDataAdapter adap = new SqlDataAdapter(consultaSQL, con);
            DataSet ds = new DataSet();
            adap.Fill(ds, NombreTabla);
            con.Close();
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