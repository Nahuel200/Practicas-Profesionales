using System;

namespace Entidades
{
    public class Alumno
    {

        private String legajo;
        private String nombre;
        private String apellido;
        private String mail;

        public Alumno(string _legajo, string _nombre, string _apellido, string _mail)
        {
            this.legajo = _legajo;
            this.nombre = _nombre;
            this.apellido = _apellido;
            this.mail = _mail;
        }

        public string Legajo { get => legajo; set => legajo = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Mail { get => mail; set => mail = value; }
    }
}
