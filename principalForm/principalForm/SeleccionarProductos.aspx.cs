using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace principalForm
{
    public partial class SeleccionarProductos : System.Web.UI.Page
    {
        private Metodos Seleccion;

        protected void Page_Load(object sender, EventArgs e)
        {
            Seleccion = new Metodos();

            if (!IsPostBack)
            {
                CargarGridView();
            }
        }

        private void CargarGridView()
        {
            grdSeleccionarProductos.DataSource = Seleccion.cargarTablaej2();
            grdSeleccionarProductos.DataBind();
        }

        protected void grdSeleccionarProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdSeleccionarProductos.PageIndex = e.NewPageIndex;
            CargarGridView();
        }

        protected void grdSeleccionarProductos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow selectedRow = grdSeleccionarProductos.Rows[e.NewSelectedIndex];
            string i_IdProducto = GetLabelValue(selectedRow, "lbl_IdProducto");
            string i_NombreProducto = GetLabelValue(selectedRow, "lbl_NombreProducto");
            string i_IdProveedor = GetLabelValue(selectedRow, "lbl_IdProveedor");
            string i_Precio = GetLabelValue(selectedRow, "lbl_PrecioUnitario");
            lblSelect.Text = $"Usted Seleccionó:  {i_IdProducto} {i_NombreProducto} {i_IdProveedor} ${i_Precio}";

            if (Session["ProductosSeleccionados"] == null)
            {
                Session["ProductosSeleccionados"] = Seleccion.CrearTabla();
            }

            if (!Seleccion.BuscarFila((DataTable)Session["ProductosSeleccionados"], i_IdProducto))
            {
                Seleccion.AgregarFila((DataTable)Session["ProductosSeleccionados"], i_IdProducto, i_NombreProducto, i_IdProveedor, i_Precio);
            }
        }

        private string GetLabelValue(GridViewRow row, string labelId)
        {
            Label label = (Label)row.FindControl(labelId);
            return label.Text;
        }
    }
}