using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;
using System.Threading;

namespace Vistas
{
    public partial class Inicio : System.Web.UI.Page
    {
        NegocioProductos neg = new NegocioProductos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable TablaProductos = neg.getTabla();
                lvProductos.DataSource = TablaProductos;
                lvProductos.DataBind();
            }
        }

        protected void btnLimpiarCategorias_Click(object sender, EventArgs e)
        {

        }

        protected void btnLimpiarMarcas_Click(object sender, EventArgs e)
        {

        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {

        }

        protected void btnAbrirPopup_Click(object sender, EventArgs e)
        {
            Panelpopup2.Visible = false;
            Panelpopup.Visible = true;
            Panelpopup.CssClass = "fade-in";
        }

        protected void btnCerrar_Click(object sender, ImageClickEventArgs e)
        {
            Panelpopup.CssClass = "fade-out";
            if(Panelpopup.Attributes["visibility"] == "hidden")
            {
                Panelpopup.Visible = false;
            }
        }

        protected void btnAbrirPopup2_Click(object sender, EventArgs e)
        {
            Panelpopup.Visible = false;
            Panelpopup2.Visible = true;
            Panelpopup2.CssClass = "fade-in";
        }

        protected void btnCerrar2_Click(object sender, ImageClickEventArgs e)
        {
            Panelpopup2.CssClass = "fade-out";
            if (Panelpopup2.Attributes["visibility"] == "hidden")
            {
                Panelpopup2.Visible = false;
            }
        }

        protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            lvProductos.DataSource = neg.buscarProducto(txtBuscar.Text);
            lvProductos.DataBind();
        }
    }
}