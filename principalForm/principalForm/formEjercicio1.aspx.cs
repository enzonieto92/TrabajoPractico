using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace principalForm
{
    
    public partial class formEjercicio1 : System.Web.UI.Page
    {
        Metodos cargarGrid = new Metodos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                cargarGridView();
            }
        }
        private void cargarGridView()
        {
            grdProductos.DataSource = cargarGrid.cargarTabla();
            grdProductos.DataBind();
        }

        protected void grdProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdProductos.EditIndex = e.NewEditIndex;
            cargarGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdProductos.EditIndex = -1;
            cargarGridView();
        }

        protected void grdProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}