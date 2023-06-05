using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
     class accesoDatos
    {
        string ruta = @"Data Source=localhost\sqlexpress; Initial Catalog = BDSucursales; Integrated Security = True";
        
        public accesoDatos()
        {

        }

        private SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(ruta);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

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

        public Boolean existe(String consulta)
        {
            Boolean estado = false;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }
            return estado;
        }
        public int ObtenerMaximo(String consulta)
        {
            int max = 0;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                max = Convert.ToInt32(datos[0].ToString());
            }
            return max;
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int FilasAlteradas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasAlteradas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasAlteradas;
        }


    }
}
