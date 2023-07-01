using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vistas
{
    public partial class DetallesUsuario : System.Web.UI.Page
    {
        Usuario user = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Usuario)HttpContext.Current.Session["Usuario"];
            btnUsuario.Text = ((Usuario)Session["usuario"]).Nombre_Us1;
            lblNombre.Text = ((Usuario)Session["usuario"]).Nombre_Us1;
            lblApellido.Text = ((Usuario)Session["usuario"]).Apellido_Us1;
            lblDNI.Text = ((Usuario)Session["usuario"]).DNI_Us1;
            lblEmail.Text = ((Usuario)Session["usuario"]).Email_Us1;
            lblFechaNac.Text = ((Usuario)Session["usuario"]).DNI_Us1;
            lblTelefono.Text = ((Usuario)Session["usuario"]).Telefono_Us1;
            lblUsuario.Text = ((Usuario)Session["usuario"]).Usuario_Us1;
            lblContraseña.Text = "********";
        }

        protected void CerrarSesion(object sender, EventArgs e)
        {
            user = null;
            Session["Usuario"] = null;
            Response.Redirect("Inicio.aspx");
        }
    }
}