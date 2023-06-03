using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    public class Conexion
    {
        public static string ruta = @"Data Source=localhost\sqlexpress; Initial Catalog = BDSucursales; Integrated Security = True";
        public DataTable ObtenerTablas(string consultaSQL, string NombreTabla)
        {
            SqlConnection conex = new SqlConnection(ruta);
            conex.ConnectionString = ruta;
            conex.Open();
            SqlDataAdapter adap = new SqlDataAdapter(consultaSQL, conex);
            DataSet data = new DataSet();
            adap.Fill(data, NombreTabla);
            conex.Close();
            return data.Tables[NombreTabla];
        }

        public int RealizarConsulta(string consultaSQL)
        {
            SqlConnection cn = new SqlConnection(ruta);
            cn.Open();
            SqlCommand cmd = new SqlCommand(consultaSQL, cn);
            int Rows = (int)cmd.ExecuteNonQuery();
            cn.Close();
            return Rows;
        }
    }
}
