using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
 public class Usuario
    {
        private int id;
        private String user;
        private String apellido;
        private String nombre;
        private String mail;
        private String password;
        private DateTime fechaAlta;
        private DateTime fechaBaja;
        private String causaBaja;



        public Usuario(int id, String user, String apellido, String nombre, String mail,String password, DateTime fechaalta, DateTime fechabaja,String causabaja)
        {
            this.id = id;
            this.user = user;
            this.apellido = apellido;
            this.nombre = nombre;
            this.mail = mail;
            this.password = password;
            this.fechaAlta = fechaalta;
            this.fechaBaja = fechabaja;
            this.causaBaja = causabaja;

        }

        public int Id { get => id; set => id = value; }
        public string User { get => user; set => user = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Mail { get => mail; set => mail = value; }
        public string Password { get => password; set => password = value; }
        public DateTime FechaAlta { get => fechaAlta; set => fechaAlta = value; }
        public DateTime FechaBaja { get => fechaBaja; set => fechaBaja = value; }
        public string CausaBaja { get => causaBaja; set => causaBaja = value; }
    }
}
