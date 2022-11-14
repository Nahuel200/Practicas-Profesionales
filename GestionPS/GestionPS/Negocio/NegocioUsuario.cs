using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    class NegocioUsuario
    {
        DaoUsuarios da = new DaoUsuarios();
        Usuario us = new Usuario();

        public bool ExisteEmail(String Mail)
        {
            return dao.ExisteEmail(Mail);
        }

        public bool CoincideContraseña(String Mail, String Contraseña)
        {
            return dao.CoincideContraseña(Mail, Contraseña);
        }

        public Usuario getUs(String email)
        {
            us.mail = email;
            return dao.getAlumnoXEmail(us);
        }
    }
}
