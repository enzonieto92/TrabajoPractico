using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP5_Grupo_Nro_06
{
    public partial class EliminarSucursal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarSucursal_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarSucursal.aspx");
        }

        protected void btnListSucursales_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarSucursal.aspx");
        }

        protected void btnEliminarSucursal_Click(object sender, EventArgs e)
        {
            Response.Redirect("EliminarSucursal.aspx");
        }
    }
}