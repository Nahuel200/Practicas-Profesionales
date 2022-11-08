using Entidades;
using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dao
{
    class DaoAlumno
    {
        AccesoDatos ad = new AccesoDatos();
        public Alumno getAlumno(Alumno al)
        {
            DataTable tabla = ad.ObtenerTabla("alumnos", "SELECT legajo_alumnos, nombre_alumnos, apellido_alumnos, mail_alumnos FROM practica_supervisada.alumnos WHERE legajo_alumnos = ' " + al.Legajo + "'");

            al.Legajo = tabla.Rows[0][0].ToString();
            al.Nombre = tabla.Rows[0][1].ToString();
            al.Apellido = tabla.Rows[0][2].ToString();
            al.Mail = tabla.Rows[0][3].ToString();
            return al;
        }
        public DataTable getTablaAlumno()
        {
            DataTable tabla = ad.ObtenerTabla("alumnos", "SELECT * FROM practica_supervisada.alumnos");
            return tabla;
        }

        public DataTable getConsulta(string n)
        {
            DataTable tabla = ad.ObtenerTabla("alumnos", "SELECT * FROM practica_supervisada.alumnos WHERE legajo_alumnos LIKE '" + n + "%' ");
            return tabla;
        }
        public DataTable setOrden(String orden)
        {
            DataTable tabla = ad.ObtenerTabla("alumnos", "SELECT * FROM practica_supervisada.alumnos ORDER BY " + orden + "");
            return tabla;
        }
        public bool ExisteAAlumno(Alumno al)
        {
            return ad.Existe("SELECT * FROM practica_supervisada.alumnos WHERE legajo_alumnos ='" + al.Legajo + "'");
        }

        public int EliminarUsuaario(Alumno al)
        {
            NpgsqlCommand cmd = new NpgsqlCommand();
            NpgsqlParameter parametro = new NpgsqlParameter();
            parametro = cmd.Parameters.Add("@legajo", NpgsqlDbType.Varchar);
            parametro.Value = al.Legajo;
            return ad.EjecutarProcAlmacenado(cmd, "SPEliminarUsuario");
        }

        public int AgregarUsuario(Alumno al)
        {
            NpgsqlCommand cmd = new NpgsqlCommand();
            NpgsqlParameter parametro = new NpgsqlParameter();
            parametro = cmd.Parameters.Add("@legajo", NpgsqlDbType.Varchar);
            parametro.Value = al.Legajo;
            parametro = cmd.Parameters.Add("@nombre", NpgsqlDbType.Varchar);
            parametro.Value = al.Nombre;
            parametro = cmd.Parameters.Add("@apellido", NpgsqlDbType.Varchar);
            parametro.Value = al.Apellido;
            parametro = cmd.Parameters.Add("@mail", NpgsqlDbType.Varchar);
            parametro.Value = al.Mail;
            return ad.EjecutarProcAlmacenado(cmd, "SPAgregarUSuario");
        }
        public int ActualizarUsuario(Alumno al)
        {
            NpgsqlCommand cmd = new NpgsqlCommand();
            NpgsqlParameter parametro = new NpgsqlParameter();
            parametro = cmd.Parameters.Add("@legajo", NpgsqlDbType.Varchar);
            parametro.Value = al.Legajo;
            parametro = cmd.Parameters.Add("@nombre", NpgsqlDbType.Varchar);
            parametro.Value = al.Nombre;
            parametro = cmd.Parameters.Add("@apellido", NpgsqlDbType.Varchar);
            parametro.Value = al.Apellido;
            parametro = cmd.Parameters.Add("@mail", NpgsqlDbType.Varchar);
            parametro.Value = al.Mail;
            return ad.EjecutarProcAlmacenado(cmd, "SPActualizarUsuario");
        }

        public DataTable filtrarArticulo(string filtro)
        {
            DataTable tabla = ad.ObtenerTabla("practica_supervisada.alumnos", filtro);
            return tabla;
        }


    }
}
