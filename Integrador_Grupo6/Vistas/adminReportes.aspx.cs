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

        }

        protected void btnQuitarFiltros_Click(object sender, EventArgs e)
        {

        }

        protected void lbProcudctos_Click(object sender, EventArgs e)
        {

        }

        protected void lbUsuarios_Click(object sender, EventArgs e)
        {

        }

        protected void lbReportes_Click(object sender, EventArgs e)
        {

        }

        protected void lbCerrarSesión_Click(object sender, EventArgs e)
        {

        }

        protected void ddlFiltroFecha_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnFiltroFecha_Click(object sender, EventArgs e)
        {

        }

        protected void btnFiltroVentas_Click(object sender, EventArgs e)
        {

        }

        protected void btnFiltroTotal_Click(object sender, EventArgs e)
        {

        }
    }
}