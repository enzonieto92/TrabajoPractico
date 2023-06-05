﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class ListarSucursales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            { 
               MostrarSucursales();

            }
            
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            negocioSucursales s = new negocioSucursales();
            
            if (s.ObtenerSucursal(txtBusqueda.Text).Rows.Count == 0)
            {
                lblResultado.Visible = true;
            }
            else
            {
                lblResultado.Visible = false;
            }
            grdSucursales.DataSource = s.ObtenerSucursal(txtBusqueda.Text);
            grdSucursales.DataBind();
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            txtBusqueda.Text = "";
            MostrarSucursales();
        }

        protected void grdSucursales_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void MostrarSucursales()
        {
            negocioSucursales suc = new negocioSucursales();

            lblResultado.Visible = false;
            grdSucursales.DataSource = suc.ListarSucursales();
            grdSucursales.DataBind();
        }
    }
}