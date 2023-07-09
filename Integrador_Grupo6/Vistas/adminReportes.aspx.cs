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
    public partial class adminReportes : System.Web.UI.Page
    {
        NegocioFactura nsF = new NegocioFactura();
        NegocioDetalleFactura nDF = new NegocioDetalleFactura();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                cargarTablaFacturasTODO();
            }
        }
        void cargarTablaFacturasTODO()
        {
            DataTable tablaFacturas = nsF.getTabla();

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

        protected void btnBuscarReporte_Click(object sender, EventArgs e)
        {
            DataTable tablaFacturas = nsF.filtrar(txtReporteDeVenta.Text);
            grvFacturas.DataSource = tablaFacturas;
            grvFacturas.DataBind();
            txtReporteDeVenta.Text = "";
            vaciarGridDetalleFacturas();
        }

        protected void btnQuitarFiltros_Click(object sender, EventArgs e)
        {
            cargarTablaFacturasTODO();
            vaciarGridDetalleFacturas();
            limpiarCampos();
        }
        void limpiarCampos()
        {
            txtReporteDeVenta.Text = "";
        }
        public string armarParametrosFecha()
        {

            string consulta = "WHERE Fecha_Fa";
            if (txtFecha1.Text != "" || txtFecha2.Text != "")
            {


                if (ddlFiltroFecha.SelectedValue == "=")
                {
                    consulta += $" = '{txtFecha1.Text}'";

                }
                if (ddlFiltroFecha.SelectedValue == ">=")
                {
                    consulta += $" >= '{txtFecha1.Text}'";


                }
                if (ddlFiltroFecha.SelectedValue == "<=")
                {
                    consulta += $" <= '{txtFecha1.Text}'";

                }
                if (ddlFiltroFecha.SelectedValue == "entre")
                {
                    consulta += $" >= '{txtFecha1.Text}' AND Fecha_Fa <= '{txtFecha2.Text}'";

                }
            }
            return consulta;

        }

        protected void ddlFiltroFecha_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFiltroFecha.SelectedValue != "-1")
            {
                if (ddlFiltroFecha.SelectedValue == "entre")
                {
                    txtFecha2.Visible = true;
                    rfvFecha2.Visible = true;
                }
                else
                {
                    txtFecha2.Visible = false;
                    rfvFecha2.Visible = false;
                }

                txtFecha1.Visible = true;
                txtFecha2.Text = "";
                btnFiltroFecha.Visible = true;
            }
            else
            {
                PanelFiltros.Visible = false;
                txtFecha1.Text = "";
                txtFecha1.Visible = false;
                txtFecha2.Visible = false;
                btnFiltroFecha.Visible = false;
            }
        }

        protected void btnFiltroFecha_Click(object sender, EventArgs e)
        {
            string consulta = armarParametrosFecha();
            DataTable tablaFacturas = nsF.getTablaFecha(consulta);
            grvFacturas.DataSource = tablaFacturas;
            grvFacturas.DataBind();
            PanelFiltros.Visible = true;
            lblProductosVendidos.Text = Convert.ToString(nDF.getTotalProductosVendidos(consulta));
            lblReporteTotal.Text = "$ " + Convert.ToString(nsF.getTotalRecaudado(consulta));
            vaciarGridDetalleFacturas();
        }
        public void vaciarGridDetalleFacturas()
        {
            grvDetalleFacturas.DataSource = null;
            grvDetalleFacturas.DataBind();
        }

        protected void grvFacturas_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            grvFacturas.PageIndex = e.NewPageIndex;
            cargarTablaFacturasTODO();
        }

        protected void lbCerrarSesión_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("~/Inicio.aspx");
        }
    }
}