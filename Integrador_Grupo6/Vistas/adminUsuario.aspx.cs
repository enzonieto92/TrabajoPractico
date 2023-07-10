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
    public partial class adminUsuario : System.Web.UI.Page
    {
        NegocioUsuario nSU = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarTablaUsuario();
                modalConfirmacionEliminar.Visible = false;
            }
        }
        void cargarTablaUsuario()
        {
            DataTable tablaUsuarios = nSU.getTabla();
            grvUsuarios.DataSource = tablaUsuarios;
            grvUsuarios.DataBind();
        }

        protected void lbCerrarSesión_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Response.Redirect("~/Inicio.aspx");
        }
        public void limpiarCampos()
        {
            txtFiltro.Text = "";
        }

        protected void grvUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvUsuarios.EditIndex = -1;
            cargarTablaUsuario();
            limpiarCampos();
        }



        protected void grvUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvUsuarios.EditIndex = e.NewEditIndex;
            cargarTablaUsuario();
            limpiarCampos();
        }

        protected void grvUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string s_DNI = ((Label)grvUsuarios.Rows[e.RowIndex].FindControl("eit_lbl_DNI")).Text;
            string s_Email = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtMail")).Text;
            string s_Nombre = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtNombre")).Text;
            string s_Apellido = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtApellido")).Text;
            string s_FechaNacimiento = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtFechaNac")).Text;
            string s_Telefono = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtTelefono")).Text;
            string s_Usuario = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtUsuario")).Text;
            string s_Contraseña = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtContraseña")).Text;
            string s_Tipo = ((DropDownList)grvUsuarios.Rows[e.RowIndex].FindControl("eit_ddl_Tipo")).SelectedValue;
            bool s_Estado = ((CheckBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_chk_Estado")).Checked;


            try
            {
                Usuario Us = new Usuario();
                Us.DNI_Us1 = s_DNI;
                Us.Email_Us1 = s_Email;
                Us.Nombre_Us1 = s_Nombre;
                Us.Apellido_Us1 = s_Apellido;
                Us.Telefono_Us1 = s_Telefono;
                Us.Usuario_Us1 = s_Usuario;
                Us.Tipo_Us1 = Convert.ToInt32(s_Tipo);
                Us.Estado_Us1 = Convert.ToBoolean(s_Estado);
                Us.Contraseña_Us1 = s_Contraseña;

                if (s_FechaNacimiento != "")
                    Us.FechaNacimineto_Us1 = DateTime.Parse(s_FechaNacimiento);
                /* Validaciones para que solo se puedan ingresar un email correctamente, solo numeros o solo letras*/
                Regex exp = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
                Regex soloNumeros = new Regex(@"^[0-9]+$");
                Regex soloLetras = new Regex(@"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$");

                /* en esta parte se chequea que se completen los campos si estan vacios o si hay algo que se este ingresando incorrectamente*/
                if (s_Email == "" || s_Nombre == "" || s_Apellido == "" || s_FechaNacimiento == "" || s_Telefono == "" || s_Usuario == "")
                    throw new Exception("Completar Campos");
                if (!exp.IsMatch(s_Email))
                    throw new Exception("Mail Inválido");
                if (!soloLetras.IsMatch(s_Nombre))
                    throw new Exception("Nombre Inválido");
                if (!soloLetras.IsMatch(s_Apellido))
                    throw new Exception("Apellido Inválido");
                if (!soloNumeros.IsMatch(s_Telefono))
                    throw new Exception("Teléfono Inválido");
                if (nSU.existeUsuario(Us))
                    throw new Exception("Este usuario ya existe");
                if (nSU.existeMail(Us))
                    throw new Exception("Este Email ya existe");

                if (s_Estado == true)
                {
                    Us.Estado_Us1 = s_Estado;
                }
                else
                {
                    throw new Exception("No se puede editar el estado del usuario");
                }

                /* ya aca se usa la funcion y se determina que mensaje se mostrara en la ejecución*/
                bool edito = nSU.ActualizarUsuario(Us);

                if (edito == true)
                {
                    lblLeyenda.ForeColor = System.Drawing.Color.Green;
                    lblLeyenda.Text = "Edición realizada con éxito!";
                }
                else
                {
                    lblLeyenda.ForeColor = System.Drawing.Color.Red;
                    lblLeyenda.Text = "No se pudo editar el usuario";
                }

                grvUsuarios.EditIndex = -1;

                cargarTablaUsuario();

            }
            catch (Exception ex)
            {
                lblLeyenda.ForeColor = System.Drawing.Color.Red;
                lblLeyenda.Text = ex.Message;
            }
        }
        protected void grvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            lblLeyenda.Text = "";
            grvUsuarios.PageIndex = e.NewPageIndex;
            cargarTablaUsuario();
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string tipo = ddlFiltro.SelectedValue;
            DataTable tablaProductos = nSU.filtrarUsuario(tipo,txtFiltro.Text);
            grvUsuarios.DataSource = tablaProductos;
            grvUsuarios.DataBind();
            limpiarCampos();
        }
        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
            cargarTablaUsuario();
            limpiarCampos();
        }
        protected void grvUsuariosRowCommand1(object sender, GridViewCommandEventArgs e)
        {
            // *******************************************************************
            // OBTENER DATOS DE UNA CELDA DE GRID VIEW

            // OBTIENE INDICE DE FILA
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            // OBTIENE OBJETO FILA SEGÚN ÍNDICE

            if (e.CommandName == "Eliminar")
            {
                modalConfirmacionEliminar.Visible = true;
                lblMuestrDNIeliminar.Text = ((Label)grvUsuarios.Rows[rowIndex].FindControl("it_lbl_DNI")).Text;
                ViewState["DNIeliminar"] = lblMuestrDNIeliminar.Text;
            }
        }
        protected void btnSi_Click(object sender, EventArgs e)
        {
            Usuario us = new Usuario();

            us.DNI_Us1 = ViewState["DNIeliminar"].ToString();
            nSU.EliminarUsuario(us);
            cargarTablaUsuario();
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