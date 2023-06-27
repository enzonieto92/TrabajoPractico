﻿using System;
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
        Usuario Current = new Usuario();
        NegocioUsuario negU = new NegocioUsuario();
        DataTable TablaProductos = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            Current = (Usuario)HttpContext.Current.Session["Usuario"];
            if (!IsPostBack)
            {
                TablaProductos = neg.getTabla();
                lvProductos.DataSource = TablaProductos;
                lvProductos.DataBind();
            }
            if (Current != null)
            {
                btnAbrirPopup.Text = Current.Nombre_Us1;
                btnAbrirPopup.PostBackUrl = "DetallesUsuario.aspx";
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
                PanelInicioSesion.Visible = false;
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
                PanelRegistro.Visible = false;
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

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            PanelInicioSesion.CssClass = "";
                Session["Usuario"] = negU.CrearLog(txtUsuario.Text, txtContraseña.Text);
                if (Session["Usuario"] == null)
                {
                    lblerror.Text = "Datos Incorrectos!";
                    lblerror.Visible = true;
                }
                else
                {
                if (negU.esAdmin(txtUsuario.Text,txtContraseña.Text))
                    Response.Redirect("~/AdminReportes.aspx");
                else

                Current = (Usuario)HttpContext.Current.Session["Usuario"];
                btnAbrirPopup.Text = Current.Nombre_Us1;
                btnAbrirPopup.PostBackUrl = "DetallesUsuario.aspx";
                PanelInicioSesion.Visible = false;
                }
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario Us = new Usuario();
                Us.DNI_Us1 = txtboxDNI.Text;
                Us.Email_Us1 = txtEmail.Text;
                Us.Nombre_Us1 = txtboxNombre.Text;
                Us.Apellido_Us1 = txtboxApellido.Text;
                Us.FechaNacimineto_Us1 = DateTime.Parse(txtFechaNacimiento.Text);
                Us.Telefono_Us1 = txtTelefono.Text;
                Us.Usuario_Us1 = txtboxCrearUsuario.Text;
                Us.Contraseña_Us1 = txtboxContraseña.Text;




                if (negU.existeUsuario(Us))
                    throw new Exception("Este usuario ya existe");
                if (negU.existeMail(Us))
                    throw new Exception("Este Email ya existe");
                if (negU.existeDNI(Us))
                    throw new Exception("Este DNI ya existe");

                bool agrego = negU.AgregarUsuario(Us);

                if (!agrego)
                    lblLeyenda.Text = "No se pudo registrar al usuario";
                else
                {
                    lblLeyenda.ForeColor = System.Drawing.Color.Green;
                    lblLeyenda.Text = "Usuario registrado con éxito!";
                }
            }
            catch (Exception ex)
            {
                lblLeyenda.Text = ex.Message;
            }
        }
    }
}