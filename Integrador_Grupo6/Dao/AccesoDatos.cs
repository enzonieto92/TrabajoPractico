using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Dao
{
    class AccesoDatos
    {
        string ruta = @"Data Source=localhost\sqlexpress; Initial Catalog = BD_TecnoUTN; Integrated Security = True";

        public AccesoDatos()
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
            catch(Exception ex)
            {
                return null;
            }
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
