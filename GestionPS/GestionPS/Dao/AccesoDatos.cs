using System;
using System.Collections.Generic;

using System.Text;
using System.Threading.Tasks;
using System.Data;
using Npgsql;

namespace Dao
{
    class AccesoDatos
    {
        
        static private string server = "localhost"; 
        static private string db = "practica_supervisada";
        static private string user =  "postgres"; 
        static private string pass =  "root";
        static private string port = "5432";
        static private string ruta = "server=" + server + ";port=" + port + ";user id=" + user + ";password=" + pass + ";database=" + db + ";";
        public AccesoDatos() { }

        private NpgsqlConnection ObtenerConexion()
        {
            NpgsqlConnection cn = new NpgsqlConnection(ruta);
            try
            {
                cn.Open();
                return cn;
            }
            catch (NpgsqlException)
            {
                return null;
            }
        }

        private NpgsqlDataAdapter ObtenerAdaptador(string consulta, NpgsqlConnection cn)
        {
            NpgsqlDataAdapter adapter;
            try
            {
                adapter = new NpgsqlDataAdapter(consulta, cn);
                return adapter;
            }
            catch (NpgsqlException)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(string nombre, string consulta)
        {
            NpgsqlConnection cn = ObtenerConexion();
            NpgsqlDataAdapter adapter = ObtenerAdaptador(consulta, cn);
            DataSet ds = new DataSet();
            adapter.Fill(ds, nombre);
            cn.Close();
            return ds.Tables[nombre];
        }

        public int EjecutarProcAlmacenado(NpgsqlCommand command, string nombre)
        {
            NpgsqlConnection cn = ObtenerConexion();
            NpgsqlCommand cmd = new NpgsqlCommand();
            cmd = command;
            cmd.Connection = cn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = nombre;
            int cambios = cmd.ExecuteNonQuery();
            cn.Close();
            return cambios;
        }

        public Boolean Existe(string consulta)
        {
            NpgsqlConnection cn = ObtenerConexion();
            NpgsqlCommand cmd = new NpgsqlCommand(consulta, cn);
            NpgsqlDataReader dato = cmd.ExecuteReader();
            Boolean existe = false;
            if (dato.Read()) existe = true;
            return existe;
        }

        public NpgsqlDataReader ejecutarTransaccion(String consulta)
        {
            NpgsqlConnection cn = ObtenerConexion();
            NpgsqlCommand cmd = new NpgsqlCommand(consulta, cn);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            return dr;

        }
    }
}
