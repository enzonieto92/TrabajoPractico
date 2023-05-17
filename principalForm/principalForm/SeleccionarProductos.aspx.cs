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
    }
}