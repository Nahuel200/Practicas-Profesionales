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
    class DaoUsuario
    {
        AccesoDatos ad = new AccesoDatos();
        public Usuario getAlumno(Usuario user)
        {
            DataTable tabla = ad.ObtenerTabla("usuarios", "SELECT id_usuarios, user_usuarios, apellido_usuarios, nombre_usuarios, mail_usuarios, password_usuarios, fecha_alta_usuarios, fecha_baja_usuarios, causa_baja_usuarios FROM practica_supervisada.usuarios WHERE id_usuarios = ' " + user.Id + "'");

            user.Id = Int32.Parse(tabla.Rows[0][0].ToString());
            user.User = tabla.Rows[0][1].ToString();
            user.Password = tabla.Rows[0][2].ToString();
            user.Mail = tabla.Rows[0][3].ToString();
            user.Apellido = tabla.Rows[0][4].ToString();
            user.FechaAlta = DateTime.Parse ( tabla.Rows[0][5].ToString());
            user.FechaBaja = DateTime.Parse (tabla.Rows[0][6].ToString());
  
            return user;
        }

        public Usuario getAlunoXMail(Usuario user)
        {
            DataTable tabla = ad.ObtenerTabla("usuarios", "SELECT id_usuarios, user_usuarios, apellido_usuarios, nombre_usuarios, mail_usuarios, password_usuarios, fecha_alta_usuarios, fecha_baja_usuarios, causa_baja_usuarios FROM practica_supervisada.usuarios WHERE nombre_usuarios = ' " + user.Mail + "'");

            user.Id = Int32.Parse(tabla.Rows[0][0].ToString());
            user.User = tabla.Rows[0][1].ToString();
            user.Password = tabla.Rows[0][2].ToString();
            user.Mail = tabla.Rows[0][3].ToString();
            user.Apellido = tabla.Rows[0][4].ToString();
            user.FechaAlta = DateTime.Parse(tabla.Rows[0][5].ToString());
            user.FechaBaja = DateTime.Parse(tabla.Rows[0][6].ToString());

            return user;
        }
        public DataTable getTablaAlumno()
        {
            DataTable tabla = ad.ObtenerTabla("usuarios", "SELECT * FROM practica_supervisada.usuarios");
            return tabla;
        }

        public DataTable getConsulta(string n)
        {
            DataTable tabla = ad.ObtenerTabla("usuarios", "SELECT * FROM practica_supervisada.usuarios WHERE id_usuarios LIKE '" + n + "%' ");
            return tabla;
        }
        public DataTable setOrden(String orden)
        {
            DataTable tabla = ad.ObtenerTabla("usuarios", "SELECT * FROM practica_supervisada.usuarios ORDER BY " + orden + "");
            return tabla;
        }
        public bool ExisteAAlumno(Usuario user)
        {
            return ad.Existe("SELECT * FROM practica_supervisada.usuarios WHERE id_usuarios ='" + user.Id + "'");
        }

        public bool ExisteMail(String mail)
        {
            return ad.Existe("SELECT * FROM practica_supervisada.usuarios WHERE mail_usuarios ='" + mail + "'");
        }

        public bool CoincideContraseña(String mail, String pass)
        {
            return ad.Existe("SELECT * FROM practica_supervisada.usuarios  WHERE mail_usuarios ='" + mail + "' AND password_usuarios = '" + pass + "'");
        }

        public int EliminarUsuaario(Usuario user)
        {
            NpgsqlCommand cmd = new NpgsqlCommand();
            NpgsqlParameter parametro = new NpgsqlParameter();
            parametro = cmd.Parameters.Add("@id", NpgsqlDbType.Varchar);
            parametro.Value = user.Id;
            return ad.EjecutarProcAlmacenado(cmd, "SPEliminarUsuario");
        }

        public int AgregarUsuario(Usuario user)
        {
            NpgsqlCommand cmd = new NpgsqlCommand();
            NpgsqlParameter parametro = new NpgsqlParameter();
            parametro = cmd.Parameters.Add("@id", NpgsqlDbType.Varchar);
            parametro.Value = user.Id;
            parametro = cmd.Parameters.Add("@user", NpgsqlDbType.Varchar);
            parametro.Value = user.User;
            parametro = cmd.Parameters.Add("@nombre", NpgsqlDbType.Varchar);
            parametro.Value = user.Nombre;
            parametro = cmd.Parameters.Add("@apellido", NpgsqlDbType.Varchar);
            parametro.Value = user.Apellido;
            parametro = cmd.Parameters.Add("@mail", NpgsqlDbType.Varchar);
            parametro.Value = user.Mail;
            parametro = cmd.Parameters.Add("@password", NpgsqlDbType.Varchar);
            parametro.Value = user.Password;
            return ad.EjecutarProcAlmacenado(cmd, "SPAgregarUSuario");
        }
        public int ActualizarUsuario(Usuario user)
        {
            NpgsqlCommand cmd = new NpgsqlCommand();
            NpgsqlParameter parametro = new NpgsqlParameter();
            parametro = cmd.Parameters.Add("@id", NpgsqlDbType.Varchar);
            parametro.Value = user.Id;
            parametro = cmd.Parameters.Add("@user", NpgsqlDbType.Varchar);
            parametro.Value = user.User;
            parametro = cmd.Parameters.Add("@nombre", NpgsqlDbType.Varchar);
            parametro.Value = user.Nombre;
            parametro = cmd.Parameters.Add("@apellido", NpgsqlDbType.Varchar);
            parametro.Value = user.Apellido;
            parametro = cmd.Parameters.Add("@mail", NpgsqlDbType.Varchar);
            parametro.Value = user.Mail;
            parametro = cmd.Parameters.Add("@password", NpgsqlDbType.Varchar);
            parametro.Value = user.Password;
            return ad.EjecutarProcAlmacenado(cmd, "SPActualizarUsuario");
        }

        public DataTable filtrarUsuario(string filtro)
        {
            DataTable tabla = ad.ObtenerTabla("practica_supervisada.usuarios", filtro);
            return tabla;
        }


    }
}
