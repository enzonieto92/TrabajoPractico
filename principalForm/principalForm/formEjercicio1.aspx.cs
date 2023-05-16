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

        protected void grdProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdProductos.EditIndex = -1;
            cargarGridView();
        }

        protected void grdProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string s_IdProducto = ((Label)grdProductos.Rows[e.RowIndex].FindControl("lbl_eitIdProducto")).Text;
            string s_Nombre = ((TextBox)grdProductos.Rows[e.RowIndex].FindControl("txt_EITnombreProducto")).Text;
            string s_Cantidad = ((TextBox)grdProductos.Rows[e.RowIndex].FindControl("txt_EITcantidad")).Text;
            string s_Precio = ((TextBox)grdProductos.Rows[e.RowIndex].FindControl("txt_EITprecio")).Text;

            Productos prod = new Productos(Convert.ToInt32(s_IdProducto), s_Nombre, s_Cantidad, Convert.ToSingle(s_Precio));

            Metodos met = new Metodos();
            int filas = met.ActualizarProducto(prod);
            if (filas == 1)
            {
                grdProductos.EditIndex = -1;
                cargarGridView();
            }
            
        }

        protected void grdProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string s_IDlibro = ((Label)grdProductos.Rows[e.RowIndex].FindControl("Lbl_IDProducto")).Text;
            Productos prod = new Productos();
            prod.IdProducto = Convert.ToInt32(s_IDlibro);

            Metodos prod2 = new Metodos();
            prod2.EliminarProducto(prod,s_IDlibro);
            cargarGridView();
        }

        protected void grdProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdProductos.PageIndex = e.NewPageIndex;
            cargarGridView();
        }
    }
}