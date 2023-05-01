﻿using System;
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

            //lblPruebassss.Text = ddlProvincias.SelectedValue;
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
            Negocio Sucursal = new Negocio();
            Sucursal.AgregarSucursal(txtNombre.Text, txtDescripcion.Text, ddlProvincias.SelectedValue, txtDireccion.Text);
        }
    }
}