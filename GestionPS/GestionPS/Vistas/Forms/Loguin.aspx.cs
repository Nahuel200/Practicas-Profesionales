using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Forms
{
    public partial class Loguin : System.Web.UI.Page
    {
        NegocioUsuario NegUser = new NegocioUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btn_IniciarSesion_Click(object sender, EventArgs e)
        {
            if (NegUser.ExisteEmail(txt_Mail.Text) == true)
            {
                if (NegUser.CoincideContraseña(txt_Mail.Text, txt_Contraseña.Text) == true)
                {
                    Session["usuario"] = NegUser.getUs(txt_Mail.Text);
                    Response.Redirect("AltaAlumno.aspx");
                }
                else
                {
                    lblMensaje.Text = "CONTRASEÑA INCORRECTA";
                    lblMensaje.ForeColor = Color.Red;
                    txt_Contra.Text = "";
                }
            }
            else
            {
                lblMensaje.Text = "Email INVÁLIDO";
                lblMensaje.ForeColor = Color.Red;
                txt_Mail.Text = "";
            }
        }
    }
}