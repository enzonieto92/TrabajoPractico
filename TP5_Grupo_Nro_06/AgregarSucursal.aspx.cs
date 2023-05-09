using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP5_Grupo_Nro_06
{
    public partial class AgregarSucursal : System.Web.UI.Page
    {
        Negocio negocio = new Negocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!Page.IsPostBack)
            {
                CargarProvincias();
            }
        }

        private void CargarProvincias()
        {
            ddlProvincias.DataSource = negocio.ObtenerProvincias();
            ddlProvincias.DataTextField = "DescripcionProvincia";
            ddlProvincias.DataValueField = "Id_Provincia";
            ddlProvincias.DataBind();
            ddlProvincias.Items.Insert(0, "-- Seleccione --");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            int a;
            Negocio Sucursal = new Negocio();
            a=Sucursal.AgregarSucursal(txtNombre.Text, txtDescripcion.Text, ddlProvincias.SelectedValue, txtDireccion.Text);
            if (a == -1)
            {
                lblAgregado.Text = "Error al agregar sucursal";
            }
            else
            {
                lblAgregado.Text = "La sucursal se ha agregado con éxito";
            }

            ReiniciarCampos();
        }

        public void ReiniciarCampos()
        {
            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtDireccion.Text = "";
            ddlProvincias.SelectedIndex = 0;
        }
    }
}