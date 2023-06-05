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
    public partial class agregarSucursal : System.Web.UI.Page
    {
            negocioSucursales neg = new negocioSucursales();
            negocioProvincias prov = new negocioProvincias();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                DataTable Provincias = prov.getProvincias();
                ddlProvincias.DataSource = Provincias;
                ddlProvincias.DataTextField = "DescripcionProvincia"; 
                ddlProvincias.DataValueField = "Id_Provincia";
                ddlProvincias.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            bool estado = false;
            estado = neg.AgregarSucursal(txtNombre.Text, txtDescripcion.Text, ddlProvincias.SelectedIndex, txtDireccion.Text);

            if (estado == true)
            {
                lblResultado.Text = "Sucursal Agregada con Éxito";
            }
            else
            {
                lblResultado.Text = "No se pudo agregar la Sucursal";
            }
        }
    }
}