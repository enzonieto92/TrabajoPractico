using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace Dao
{
    class AccesoDatos
    {
        string ruta = @"Data Source=localhost\sqlexpress; Initial Catalog = TecnovatosBD; Integrated Security = True";

        public AccesoDatos()
        {

        }

        public int ejecutarTransaccion(String consulta)
        {
            SqlConnection cn = new SqlConnection(ruta);
            cn.Open();
            SqlCommand cm = new SqlCommand(consulta, cn);

            int filasAfectadas = cm.ExecuteNonQuery();  

            return filasAfectadas;
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
        public object consulta(string consultaSQL)
        {
            SqlConnection cn = new SqlConnection(ruta);
            cn.Open();
            SqlCommand cmd = new SqlCommand(consultaSQL, cn);
            object resultado = cmd.ExecuteScalar();
            cn.Close();
            return resultado;
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
        private SqlDataAdapter ObtenerAdaptador(string consultaSql, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, cn);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(string NombreTabla, string Sql)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(Sql, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
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
