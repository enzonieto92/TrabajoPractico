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
        NegocioCategorias NC = new NegocioCategorias();
        NegocioMarcas NM = new NegocioMarcas();
        NegocioColores NCo = new NegocioColores();
        NegocioCaracteristica NCar = new NegocioCaracteristica();
        NegocioCaracteristicasXproductosXcolores nsCXPXC = new NegocioCaracteristicasXproductosXcolores();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cargartablaProductos();
                cargarCategorias();
                cargarMarcas();
                cargarColores();
                cargarCaracteristicas();
                modal.Visible = false;
                modalStock.Visible = false;
                modalAgregarProducto.Visible = false;
                modalConfirmacionEliminar.Visible = false;
            }

        }
        void cargartablaProductos()
        {
            DataTable tablaProductos = np.getTabla();
            grvProductos.DataSource = tablaProductos;
            grvProductos.DataBind();
        }

        void cargarCategorias()
        {

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

            DataTable tabla;

            tabla = NCo.listarColores();
            ddlColorProducto.DataSource = tabla;
            tabla.Rows.Add("-- Seleccionar --", "-- Seleccionar --");
            ddlColorProducto.DataTextField = "Descripcion_Co";
            ddlColorProducto.DataValueField = "CodColor_Co";
            ddlColorProducto.Text = "-- Seleccionar --";
            ddlColorProducto.DataBind();
        }

        private void cargarCaracteristicas()
        {
            DataTable tabla;

            tabla = NCar.getTabla();
            ddlCaracteristicas.DataSource = tabla;
            tabla.Rows.Add("-- Seleccionar --", "-- Seleccionar --");
            ddlCaracteristicas.DataTextField = "Nombre_Car";
            ddlCaracteristicas.DataValueField = "CodCaracteristica_Car";
            ddlCaracteristicas.Text = "-- Seleccionar --";
            ddlCaracteristicas.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string tipo = ddlFiltro.SelectedValue;

            switch (tipo)
            {
                case "CodMarca_Pr":
                    tipo = "Descripcion_Ma";
                    break;
                case "CodCategoria_Pr":
                    tipo = "Descripcion_Cat";
                    break;
            }

            grvProductos.DataSource = np.filtrarProductos(tipo, txtFiltro.Text);
            grvProductos.DataBind();

            if (np.filtrarProductos(tipo, txtFiltro.Text).Rows.Count == 0)
            {
                Resultado.ForeColor = System.Drawing.Color.Red;
                Resultado.Text = "NO SE ENCONTRARON RESULTADOS";
            }
            else
            {
                Resultado.Text = "";
            }

        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
            ddlFiltro.SelectedIndex = 0;
            txtFiltro.Text = "";
            Resultado.Text = "";
            cargartablaProductos();
        }

        protected void grvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string codPr = ((Label)grvProductos.Rows[e.RowIndex].FindControl("lbl_it_CodProd")).Text;
            Productos prod = new Productos();
            prod.CodProducto_Pr1 = codPr;
            cargartablaProductos();
            bool result = np.eliminarProducto(prod);
            if (result)
            {
                Resultado.Text = "No se eliminó";
            }
            else
            {
                Resultado.Text = "Eliminado";
            }

        }

        protected void btnIngresarProducto_Click(object sender, EventArgs e)
        {
            Productos pro = new Productos();
            CaracteristicasXproductoXcolores car = new CaracteristicasXproductoXcolores();

            if (txtCodProd.Text == "" || txtNombre.Text == "" || ddlMarcas.SelectedItem.Text == "-- Seleccionar --" 
                || ddlCategoriaProducto.SelectedItem.Text == "-- Seleccionar --" || ddlColorProducto.SelectedItem.Text == "-- Seleccionar --" ||
                ddlCaracteristicas.SelectedItem.Text == "-- Seleccione --" || txtAgregarStock.Text == "" || txtPrecioUnitario.Text == "")
            {
                lblMensajeAgregado.ForeColor = System.Drawing.Color.Red;
                lblMensajeAgregado.Text = "Debe completar los campos obligatorios";
            }
            else
            {
                pro = cargarproducto();
                car = cargarCxPxC();
                if (np.agregarProducto(pro) && nsCXPXC.agregarCxPxC(car))
                {
                    cargartablaProductos();
                    limpiarCampos();
                    if(FileUploadImagenProd.HasFile == true)
                    {
                        FileUploadImagenProd.SaveAs(Server.MapPath("~/Imagenes/Productos/") + FileUploadImagenProd.PostedFile.FileName);
                    }
                    lblMensajeAgregado.ForeColor = System.Drawing.Color.Green;
                    lblMensajeAgregado.Text = "Producto agregado con èxito";
                }
                else
                {
                    lblMensajeAgregado.Text = "No se pudo agregar el producto";
                }
            }
           
        }


        private Productos cargarproducto()
        {
            Productos pro = new Productos();
            Marcas mar = new Marcas();

            pro.CodProducto_Pr1 = txtCodProd.Text;
            pro.Nombre_Pr1 = txtNombre.Text;
            pro.CodCategoria_Pr1.CodCategoria_Ca = ddlCategoriaProducto.SelectedValue.ToString();
            pro.CodMarcas_Pr1.CodMarca_Ma = ddlMarcas.SelectedValue.ToString();
            pro.PrecioUnitario_Pr1 = Convert.ToDecimal(txtPrecioUnitario.Text);
            pro.UrlImagen_Pr1 = "~/Imagenes/Productos/" + FileUploadImagenProd.PostedFile.FileName;
            pro.Descripcion_Pr1 = txtDescripcion.Text;

            return pro;
        }

        private CaracteristicasXproductoXcolores cargarCxPxC()
        {
            CaracteristicasXproductoXcolores cpc = new CaracteristicasXproductoXcolores();
            NegocioColores col = new NegocioColores();
            NegocioCaracteristica car = new NegocioCaracteristica();
            cpc.CodProductos_CXPXC1.CodProducto_Pr1 = txtCodProd.Text;
            cpc.CodCaracteristicas_CXPXC1.Cod_Caracteristica_Car1 = ddlCaracteristicas.SelectedItem.Value;
            cpc.CodColor_CXPXC1.Cod_Color_Co1 =ddlCaracteristicas.SelectedItem.Value;
            cpc.Stock_CXPXC1 = Convert.ToInt32(txtAgregarStock.Text);

            return cpc;
        }

        private void limpiarCampos()
        {
            txtCodProd.Text = "";
            txtNombre.Text = "";
            ddlCategoriaProducto.Text = "-- Seleccionar --";
            ddlMarcas.Text = "-- Seleccionar --";
            ddlCaracteristicas.Text = "-- Seleccionar --";
            ddlColorProducto.Text = "-- Seleccionar --";
            txtPrecioUnitario.Text = "";
            txtAgregarStock.Text = "";
            txtDescripcion.Text = "";
        }


        protected void grvProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Obtener la fila editada
            GridViewRow row = grvProductos.Rows[e.RowIndex];

            // Obtener los valores actualizados
            string codigoProducto = ((Label)row.FindControl("lbl_it_CodProd")).Text;
            string codMarca = ((DropDownList)row.FindControl("ei_ddl_Marca")).SelectedValue;
            string codCategoria = ((DropDownList)row.FindControl("ei_ddl_Categoria")).SelectedValue;
            string nombre = ((TextBox)row.FindControl("txtNombreEdit")).Text;
            string descripcion = ((TextBox)row.FindControl("txtDescripcionEdit")).Text;
            string precioUnitario = ((TextBox)row.FindControl("txtPrecioEdit")).Text;
            bool estado = ((CheckBox)row.FindControl("cbEstado")).Checked;

            // Crear el objeto Productos con los valores actualizados
            Productos productoActualizado = new Productos();
            productoActualizado.CodProducto_Pr1 = codigoProducto;
            productoActualizado.CodMarcas_Pr1.CodMarca_Ma = codMarca;
            productoActualizado.CodCategoria_Pr1.CodCategoria_Ca = codCategoria;
            productoActualizado.Nombre_Pr1 = nombre;
            productoActualizado.Descripcion_Pr1 = descripcion;
            productoActualizado.PrecioUnitario_Pr1 = decimal.Parse(precioUnitario);
            productoActualizado.Estado_Pr = estado;

            // Llamar al método np.actualizarProducto para guardar los datos actualizados en la base de datos
            np.actualizarProducto(productoActualizado);
            grvProductos.EditIndex = -1;
            // Volver a cargar la tabla de productos después de la actualización
            cargartablaProductos();
        }

        protected void grvProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvProductos.EditIndex = e.NewEditIndex;

            cargartablaProductos();

        }
        protected void grvProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvProductos.EditIndex = -1;
            cargartablaProductos();
        }


        protected void grvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            lblMensajeAgregado.Text = "";
            grvProductos.PageIndex = e.NewPageIndex;
            cargartablaProductos();
        }

        protected void lbCerrarSesión_Click(object sender, EventArgs e)
        {

        }

        protected void grvProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowState == DataControlRowState.Edit)
            {
                DropDownList ddlMa = (DropDownList)e.Row.FindControl("ei_ddl_Marca");
                DropDownList ddlCat = (DropDownList)e.Row.FindControl("ei_ddl_Categoria");
                DataTable tablaMarcas = NM.listarMarcas();
                ddlMa.DataSource = tablaMarcas;
                ddlMa.DataTextField = "CodMarca_Ma";
                ddlMa.DataValueField = "CodMarca_Ma";
                ddlMa.DataBind();

                DataTable tablaCategoria = NC.listarCategorias();
                ddlCat.DataSource = tablaCategoria;
                ddlCat.DataTextField = "CodCategoria_Cat";
                ddlCat.DataValueField = "CodCategoria_Cat";
                ddlCat.DataBind();
            }




        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            modal.Visible = true;
            modalAgregarProducto.Visible = false;
        }

        /*protected void grvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = grvProductos.SelectedRow;
            lblMensajeAgregado.Text = fila.Cells[6].Text;
            lblMensajeAgregado.Text = "index changed";
            //modalStock.Visible = true;
            //Label l1 = grvProductos.Rows[1].FindControl("lbl_it_Nombre") as Label;
            //lblMensajeAgregado.Text = l1.Text;
            //lblMensajeAgregado.Text = "aaaaaaaaaaaah";
        }*/


        protected void grvProductos_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            // *******************************************************************
            // OBTENER DATOS DE UNA CELDA DE GRID VIEW

            // OBTIENE INDICE DE FILA
            int rowIndex = Convert.ToInt32(e.CommandArgument);

             // OBTIENE OBJETO FILA SEGÚN ÍNDICE
            GridViewRow fila = grvProductos.Rows[rowIndex];    

            if (e.CommandName == "AgregarStock")
            {


                // HACE REFERENCIA AL CONTROL LABEL LLAMADO "lbl_it_Nombre" DENTRO DE LA FILA SELECCIONADA Y OBTIENE EL TEXTO DEL MISMO UBICADO EN LA CELDA DEL GRIDVIEW.
                string nombre = (fila.FindControl("lbl_it_Nombre") as Label).Text;  

                lblMuestraCod.Text = (fila.FindControl("lbl_it_CodProd") as Label).Text;
                lblMuestraCar.Text = NCar.nombreCaract((fila.FindControl("lbl_it_CodCaract") as Label).Text);
                lblMuestraColor.Text = (fila.FindControl("lbl_it_CodColor") as Label).Text;

                //********************************************************************

                lblAgrDescripcion.Text = nombre;

                modalStock.Visible = true;
            }

            if (e.CommandName == "Eliminar")
            {
                modalConfirmacionEliminar.Visible = true;
                lblMuestrCodEliminar.Text = (fila.FindControl("lbl_it_CodProd") as Label).Text;
                lblMuestraArtEliminar.Text = (fila.FindControl("lbl_it_Nombre") as Label).Text;
                lblMuestraCaractEliminar.Text = NCar.nombreCaract((fila.FindControl("lbl_it_CodCaract") as Label).Text);
                lblMuestraColorEliminar.Text = (fila.FindControl("lbl_it_CodColor") as Label).Text;
                ViewState["CodProdEliminar"] = lblMuestrCodEliminar.Text;
            }
        }

        protected void btnAgrStock_Click(object sender, EventArgs e)
        {
            // AGREGAR STOCK -------------------------------------------

            if (txtAgrStock.Text != "" && txtAgrStock.Text != "0")
            {
                bool agrego = nsCXPXC.agregarStock(lblMuestraCod.Text, NCar.codigoCaract(lblMuestraCar.Text), NCo.CodigoColor(lblMuestraColor.Text), Convert.ToInt32(txtAgrStock.Text));
                if (agrego)
                {
                    cargartablaProductos();
                    lblMensajeStock.ForeColor = System.Drawing.Color.Green;
                    lblMensajeStock.Text = "Stock agregado con éxito!";
                    txtAgrStock.Text = "";
                }
                else
                {
                    lblMensajeStock.ForeColor = System.Drawing.Color.Red;
                    lblMensajeStock.Text = "No se pudo agregar el stock";
                }
            }
            else
            {
                if (txtAgrStock.Text == "0")
                {
                    lblMensajeStock.ForeColor = System.Drawing.Color.Red;
                    lblMensajeStock.Text = "La cantidad debe ser distinta a 0";
                }
                else
                {
                    lblMensajeStock.ForeColor = System.Drawing.Color.Red;
                    lblMensajeStock.Text = "Debe ingresar una cantidad";
                }

            }


            // ---------------------------------------------------------
        }

        protected void grvProductos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            lblMensajeStock.Text = "";
            txtAgrStock.Text = "";
            modalStock.Visible = false;
        }

        protected void ImageButtonCerrar_Click1(object sender, ImageClickEventArgs e)
        {
            modal.Visible = false;
            modalAgregarProducto.Visible = true;
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            modalAgregarProducto.Visible = true;
        }

        protected void imgCerrarAgregarProducto_Click1(object sender, ImageClickEventArgs e)
        {
            modalAgregarProducto.Visible = false;
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            Productos pro = new Productos();

            pro.CodProducto_Pr1 = ViewState["CodProdEliminar"].ToString() ;
            np.eliminarProducto(pro);
            cargartablaProductos();
            modalConfirmacionEliminar.Visible = false;
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            modalConfirmacionEliminar.Visible = false;
        }

        protected void imgCerrarConfirmacion_Click1(object sender, ImageClickEventArgs e)
        {
            modalConfirmacionEliminar.Visible = false;
        }
    }
}


