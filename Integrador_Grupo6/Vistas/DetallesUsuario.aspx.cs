using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class DetallesUsuario : System.Web.UI.Page
    {
        Usuario user = new Usuario();
        NegocioFactura nsF = new NegocioFactura();
        NegocioDetalleFactura nDF = new NegocioDetalleFactura();
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Usuario)HttpContext.Current.Session["Usuario"];
            btnUsuario.Text = ((Usuario)Session["usuario"]).Nombre_Us1;
            lblNombre.Text = ((Usuario)Session["usuario"]).Nombre_Us1;
            lblApellido.Text = ((Usuario)Session["usuario"]).Apellido_Us1;
            lblDNI.Text = ((Usuario)Session["usuario"]).DNI_Us1;
            lblEmail.Text = ((Usuario)Session["usuario"]).Email_Us1;
            lblFechaNac.Text = ((Usuario)Session["usuario"]).DNI_Us1;
            lblTelefono.Text = ((Usuario)Session["usuario"]).Telefono_Us1;
            lblUsuario.Text = ((Usuario)Session["usuario"]).Usuario_Us1;
            lblContraseña.Text = "********";
            if (!IsPostBack)
            {
                cargarTablaFacturasTODO();
            }
        }
        void cargarTablaFacturasTODO()
        {
            string dni = ((Usuario)Session["usuario"]).DNI_Us1;
            DataTable tablaFacturas = nsF.getTablav2(dni);
            grvFacturas.DataSource = tablaFacturas;
            grvFacturas.DataBind();
        }
        protected void grvFacturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eventoVerMas")
            {
                int fila = Convert.ToInt32(e.CommandArgument);
                string s_nroFactura = ((Label)grvFacturas.Rows[fila].FindControl("it_lbl_NFactura")).Text;
                cargarTablaDetalleFacturas(s_nroFactura);
            }
        }
        public void cargarTablaDetalleFacturas(String nroFactura)
        {
            grvDetalleFacturas.DataSource = nDF.getTabla(nroFactura);
            grvDetalleFacturas.DataBind();
        }
        protected void grvDetalleFacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            String s_NroFactura = ((Label)grvFacturas.Rows[e.NewPageIndex].FindControl("it_lbl_NFactura")).Text;
            grvDetalleFacturas.PageIndex = e.NewPageIndex;
            cargarTablaDetalleFacturas(s_NroFactura);
        }

        protected void grvFacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvFacturas.PageIndex = e.NewPageIndex;
            cargarTablaFacturasTODO();
        }

        protected void CerrarSesion(object sender, EventArgs e)
        {
            user = null;
            Session["Usuario"] = null;
            Response.Redirect("Inicio.aspx");
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
                Response.Redirect("DetallesUsuario.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }
    }
}