using System;

namespace Entidades
{
    public class Alumno
    {

        private String Legajo;
        private String Nombre;
        private String Apellido;
        private String Mail;

        public Alumno(string legajo, string nombre, string apellido, string mail)
        {
            Legajo = legajo;
            Nombre = nombre;
            Apellido = apellido;
            Mail = mail;
        }

        public string Legajo1 { get => Legajo; set => Legajo = value; }
        public string Nombre1 { get => Nombre; set => Nombre = value; }
        public string Apellido1 { get => Apellido; set => Apellido = value; }
        public string Mail1 { get => Mail; set => Mail = value; }
    }
}
