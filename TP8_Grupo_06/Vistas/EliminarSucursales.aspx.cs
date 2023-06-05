using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class EliminarSucursales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            negocioSucursales sucursal = new negocioSucursales();
            Boolean estado = sucursal.eliminarSucursal(Convert.ToInt32(txtIngresarID.Text));
            if (estado)
            {
                lblMensaje.Text = "Sucursal Eliminada!";
                txtIngresarID.Text = "";

            }
            else
            {
                lblMensaje.Text = "No se encontró la sucursal!";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                txtIngresarID.Text = "";
            }
        }
    }
}