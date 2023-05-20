using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace principalForm
{
    public partial class formEjercicio2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblEliminados.Visible = false;
        }

        protected void lbEliminar_Click(object sender, EventArgs e)
        {
            if (Session["ProductosSeleccionados"] == null)
            {
                lblEliminados.Visible = true;
                lblEliminados.ForeColor = System.Drawing.Color.DarkOrange;
                lblEliminados.Text = "No hay productos cargados en la lista";
            }
            else
            {
                Session["ProductosSeleccionados"] = null;
                lblEliminados.Visible = true;
            }
            
        }
    }
}