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
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int suc;
            Negocio sucursal = new Negocio();
            suc = sucursal.EliminarSucursal(txtBusqueda.Text);
            if(suc == -1)
            {
                lblAgregado.Text = "Error a eliminar sucursal";
                txtBusqueda.Text = "";
            }
            else
            {
                lblAgregado.Text = "Sucursal Eliminada!";
                txtBusqueda.Text = "";
            }
        }
    }
}