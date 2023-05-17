using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace principalForm
{
    public partial class SeleccionarProductos : System.Web.UI.Page
    {
        Metodos cargarGrid = new Metodos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                cargarGridView();
            }
        }
        private void cargarGridView()
        {
            grdSeleccionarProductos.DataSource = cargarGrid.cargarTablaej2();
            grdSeleccionarProductos.DataBind();
        }

        protected void grdSeleccionarProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdSeleccionarProductos.PageIndex = e.NewPageIndex;
            cargarGridView();
        }

        protected void grdSeleccionarProductos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string i_IdProducto = ((Label)grdSeleccionarProductos.Rows[e.NewSelectedIndex].FindControl("lbl_IdProducto")).Text;
            string i_NombreProducto = ((Label)grdSeleccionarProductos.Rows[e.NewSelectedIndex].FindControl("lbl_NombreProducto")).Text;
            string i_IdProveedor = ((Label)grdSeleccionarProductos.Rows[e.NewSelectedIndex].FindControl("lbl_IdProveedor")).Text;
            string i_Precio = ((Label)grdSeleccionarProductos.Rows[e.NewSelectedIndex].FindControl("lbl_PrecioUnitario")).Text;

            lblSelect.Text = "Usted Selecciono: " + i_IdProducto + " " + i_NombreProducto + " " + i_IdProveedor + " " + i_Precio;
        }
    }
}