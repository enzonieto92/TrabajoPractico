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
            btnUsuario.Text = user.Nombre_Us1;
        }
    }
}