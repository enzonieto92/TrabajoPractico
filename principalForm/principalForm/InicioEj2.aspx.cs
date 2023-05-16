using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace principalForm
{
    public partial class formEjercicio2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbSeleccionar_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeleccionarProductos.aspx");
        }

        protected void lbMostrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MostrarProductos.aspx");
        }
    }
}