using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP5_Grupo_Nro_06
{
    public partial class ListarSucursal : System.Web.UI.Page
    {
        Negocio listaSucursal = new Negocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!Page.IsPostBack)
            {
                cargarTabla();
            }
        }
        private void cargarTabla()
        {
            grdSucursales.DataSource = listaSucursal.listarSucursalInicial();
            grdSucursales.DataBind();
        }
        private void cargarTabla(string id)
        {
            grdSucursales.DataSource = listaSucursal.listarSucursal(id);
            grdSucursales.DataBind();
        }
        protected void btnAgregarSucursal_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarSucursal.aspx");
        }

        protected void btnListSucursales_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarSucursal.aspx");
        }

        protected void btnEliminarSucursal_Click(object sender, EventArgs e)
        {
            Response.Redirect("EliminarSucursal.aspx");
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            if (txtBusqueda.Text != "")
            {
            cargarTabla(txtBusqueda.Text);
                txtBusqueda.Text = "";
            }
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            cargarTabla();
            txtBusqueda.Text = "";
        }
    }
}