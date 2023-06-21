using System;
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


        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string tipo = ddlFiltro.SelectedValue;

            switch (tipo)
            {
                case "CodMarca_Pr": tipo = "Descripcion_Ma";
                break;
                case "CodCategoria_Pr": tipo = "Descripcion_Cat";
                break;
            }

            grvProductos.DataSource = np.filtrarProductos(tipo , txtFiltro.Text);
            grvProductos.DataBind();

            if(np.filtrarProductos(tipo, txtFiltro.Text).Rows.Count == 0)
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

            pro = cargarproducto();

            if (np.agregarProducto(pro))
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

        protected void btnIngresarStock_Click(object sender, EventArgs e)
        {

        }

        protected void grvProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowState==DataControlRowState.Edit)
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
    }
}



