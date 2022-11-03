using System;

namespace Entidades
{
    public class Alumno
    {

        private String Legajo;
        private String Nombre;
        private String Apellido;
        private String Mail;


        public Alumno()
        {
            this.Legajo = null;
            this.Nombre = null;
            this.Apellido = null;
            this.Mail = null;
        }

        public Alumno(String _legajo, String _nombre, String _apellido , String _mail)
        {
            this.Legajo = _legajo;
            this.Nombre = _nombre;
            this.Apellido = _apellido;
            this.Mail = _mail;

        }

        public String getLegajo()
        {
            return this.Legajo;

        }

        public void setLegajo(String _Legajo)
        {
            this.Legajo = _Legajo;


        }

        public String getNombre()
        {
            return this.Nombre;

        }

        public void setNombre(String _Nombre)
        {
            this.Nombre = _Nombre;


        }

        public String getApellido()
        {
            return this.Apellido;

        }

        public void setApellido(String _Apellido)
        {
            this.Apellido = _Apellido;


        }

        public String getMail()
        {
            return this.Mail;

        }

        public void setMail(String _Mail)
        {
            this.Mail = _Mail;


        }


    }
}
