﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using Entidades;
using Negocio;
using System.Text.RegularExpressions;
using System.Windows;

namespace Vistas
{
    public partial class adminProductos : System.Web.UI.Page
    {

        NegocioProductos np = new NegocioProductos();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cargartablaProductos();
                cargarCategorias();
                cargarMarcas();
                cargarColores();
            }

        }
        void cargartablaProductos()
        {
            NegocioMarcas NM = new NegocioMarcas();
            DataTable tablaProductos = np.getTabla();
            grvProductos.DataSource = tablaProductos;
            grvProductos.DataBind();
        }

        void cargarCategorias()
        {
            NegocioCategorias NC = new NegocioCategorias();
            DataTable tabla;

            tabla = NC.listarCategorias();
            ddlCategoriaProducto.DataSource = tabla;
            tabla.Rows.Add("-- Seleccionar --", "-- Seleccionar --");
            ddlCategoriaProducto.DataTextField = "Descripcion_Cat";
            ddlCategoriaProducto.DataValueField = "CodCategoria_Cat";
            ddlCategoriaProducto.Text = "-- Seleccionar --";
            ddlCategoriaProducto.DataBind();
        }

        void cargarMarcas()
        {
            NegocioMarcas NM = new NegocioMarcas();
            DataTable tabla;

            tabla = NM.listarMarcas();
            ddlMarcas.DataSource = tabla;
            tabla.Rows.Add("-- Seleccionar --", "-- Seleccionar --");
            ddlMarcas.DataTextField = "Descripcion_Ma";
            ddlMarcas.DataValueField = "CodMarca_Ma";
            ddlMarcas.Text = "-- Seleccionar --";
            ddlMarcas.DataBind();
        }

        void cargarColores()
        {
            NegocioColores NC = new NegocioColores();
            DataTable tabla;

            tabla = NC.listarColores();
            ddlColorProducto.DataSource = tabla;
            tabla.Rows.Add("-- Seleccionar --", "-- Seleccionar --");
            ddlColorProducto.DataTextField = "Descripcion_Co";
            ddlColorProducto.DataValueField = "CodColor_Co";
            ddlColorProducto.Text = "-- Seleccionar --";
            ddlColorProducto.DataBind();
        }

        protected void lbCerrarSesión_Click(object sender, EventArgs e)
        {

        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {

        }

        protected void grvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string codPr = ((Label)grvProductos.Rows[e.RowIndex].FindControl("lbl_it_CodProd")).Text;
            Productos prod = new Productos();
            prod.CodProducto_Pr1 = codPr;
           bool result = np.eliminarProducto(prod);
            if (result)
            {
                Resultado.Text = "No se eliminó";
            }
            else
            {
                Resultado.Text = "Eliminado";
            }
            cargartablaProductos();
            
        }

        protected void btnIngresarProducto_Click(object sender, EventArgs e)
        {
            Productos pro = new Productos();
            NegocioProductos NP = new NegocioProductos();

            pro = cargarproducto();

            if (NP.agregarProducto(pro))
            {
                cargartablaProductos();
                limpiarCampos();
                FileUploadImagenProd.SaveAs(Server.MapPath("~/Imagenes/Productos/") + FileUploadImagenProd.PostedFile.FileName);
                lblMensajeAgregado.ForeColor = System.Drawing.Color.Green;
                lblMensajeAgregado.Text = "Producto agregado con èxito";
            }
            else
            {
                lblMensajeAgregado.Text = "No se pudo agregar el producto";
            }
        }

        protected void btnIngresarStock_Click(object sender, EventArgs e)
        {

        }

        private Productos cargarproducto()
        {
            Productos pro = new Productos();
            NegocioMarcas NM = new NegocioMarcas();
            Marcas mar = new Marcas();

            pro.CodProducto_Pr1 = txtCodProd.Text;
            pro.Nombre_Pr1 = txtNombre.Text;
            pro.CodCategoria_Pr1 = ddlCategoriaProducto.SelectedValue.ToString();
            pro.CodMarcas_Pr1 = ddlMarcas.SelectedValue.ToString();
            pro.PrecioUnitario_Pr1 = Convert.ToDecimal(txtPrecioUnitario.Text);
            pro.UrlImagen_Pr1 = "~/Imagenes/Productos/" + FileUploadImagenProd.PostedFile.FileName;
            pro.Descripcion_Pr1 = txtDescripcion.Text;

            return pro;
        }

        private void limpiarCampos()
        {
            txtCodProd.Text = "";
            txtNombre.Text = "";
            ddlCategoriaProducto.Text = "-- Seleccionar --";
            ddlColorProducto.Text = "-- Seleccionar --";
            ddlMarcas.Text = "-- Seleccionar --";
            txtPrecioUnitario.Text = "";
            txtStock.Text = "";
            txtDescripcion.Text = "";
        }
    }
}



