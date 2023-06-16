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

namespace Vistas
{
    public partial class adminUsuario : System.Web.UI.Page
    {
        NegocioUsuario nSU = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarTablaUsuario("Select * from Usuario");
            }
        }
        void cargarTablaUsuario(string consulta)
        {
            DataTable tablaUsuarios = nSU.getTabla(consulta);
            grvUsuarios.DataSource = tablaUsuarios;
            grvUsuarios.DataBind();
        }

        protected void lbCerrarSesión_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect("~/Inicio.aspx");
        }
        public void limpiarCampos()
        {
            txtFiltro.Text = "";
        }

        protected void grvUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvUsuarios.EditIndex = -1;
            cargarTablaUsuario("SELECT * FROM Usuario");
            limpiarCampos();
        }

        protected void grvUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string DNI_Us = ((Label)grvUsuarios.Rows[e.RowIndex].FindControl("it_lbl_DNI")).Text;
            Usuario Us = new Usuario();
            Us.DNI_Us1 = DNI_Us;
            NegocioUsuario NU = new NegocioUsuario();
            bool elimino = NU.EliminarUsuario(Us);

            cargarTablaUsuario("SELECT * FROM Usuario");

            if (elimino)
            {
                lblLeyenda.ForeColor = System.Drawing.Color.Green;
                lblLeyenda.Text = "Usuario eliminado con éxito!";
            }
            else
            {
                lblLeyenda.ForeColor = System.Drawing.Color.Red;
                lblLeyenda.Text = "No se pudo eliminar el usuario";
            }
        }

        protected void grvUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grvUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}