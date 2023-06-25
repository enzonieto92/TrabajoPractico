using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

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
            PanelRegistro.Visible = false;
            PanelInicioSesion.Visible = true;
            PanelInicioSesion.CssClass = "fade-in";
        }

        protected void btnCerrar_Click(object sender, ImageClickEventArgs e)
        {
            PanelInicioSesion.CssClass = "fade-out";
            if(PanelInicioSesion.Attributes["visibility"] == "hidden")
            {
                PanelInicioSesion.Visible = false;
            }
        }

        protected void btnAbrirPopup2_Click(object sender, EventArgs e)
        {
            PanelInicioSesion.Visible = false;
            PanelRegistro.Visible = true;
            PanelRegistro.CssClass = "fade-in";
        }

        protected void btnCerrar2_Click(object sender, ImageClickEventArgs e)
        {
            PanelRegistro.CssClass = "fade-out";
            if (PanelRegistro.Attributes["visibility"] == "hidden")
            {
                PanelRegistro.Visible = false;
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