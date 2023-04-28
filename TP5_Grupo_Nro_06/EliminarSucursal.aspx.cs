using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP5_Grupo_Nro_13
{
    public partial class Ejercicio1c : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarSucursal_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarSucursal.aspx");
        }

        protected void btnListarSucursal_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarSucursal.aspx");
        }

        protected void btnEliminarSucursal_Click(object sender, EventArgs e)
        {
            Response.Redirect("EliminarSucursal.aspx");
        }
    }
}