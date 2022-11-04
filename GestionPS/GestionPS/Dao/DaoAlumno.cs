using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dao
{
    class DaoUsuario
    {
        AccesoDatos ad = new AccesoDatos();
        public Alumno getAlumno(Alumno al)
        {
            DataTable tabla = ad.ObtenerTabla("alumnos", "SELECT legajo_alumnos, nombre_alumnos, apellido_alumnos, mail_alumnos FROM practica_supervisada.alumnos WHERE legajo_alumnos = ' " + al.Legajo1 + "'");

            al.Legajo1 = tabla.Rows[0][0].ToString();
            al.Nombre1 = tabla.Rows[0][1].ToString();
            al.Apellido1 = tabla.Rows[0][2].ToString();
            al.Mail1 = tabla.Rows[0][3].ToString();
            return al;
        }
    }
}
