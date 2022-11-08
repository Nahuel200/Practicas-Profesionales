using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
 public class Usuario
    {
        private int ID;
        private String User;
        private String Apellido;
        private String Nombre;
        private String Mail;
        private String Password;
        private DateTime FechaAlta;
        private DateTime FechaBaja;
        private String CausaBaja;



        public Usuario(int id, String user, String apellido, String nombre, String mail,String password, DateTime fechaalta, DateTime fechabaja,String causabaja)
        {
            this.ID = id;
            this.User = user;
            this.Apellido = apellido;
            this.Nombre = nombre;
            this.Mail = mail;
            this.Password = password;
            this.FechaAlta = fechaalta;
            this.FechaBaja = fechabaja;
            this.CausaBaja = causabaja;

        }


        public int   ID1 { get => ID; set => ID = value; }
        public string User1 { get => User; set => User = value; }
        public string Nombre1 { get => Nombre; set => Nombre = value; }
        public string Apellido1 { get => Apellido; set => Apellido = value; }
        public string Mail1 { get => Mail; set => Mail = value; }
        public string Password1 { get => Password; set => Password = value; }
        public DateTime FechaAlta1 { get => FechaAlta; set => FechaAlta = value; }
        public DateTime FechaBaja1 { get => FechaBaja; set => FechaBaja = value; }
        public string CausaBaja1 { get => CausaBaja; set => CausaBaja = value; }




    }
}
