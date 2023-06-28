using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class ProductoSeleccion : System.Web.UI.Page
    {
        NegocioProductos nPr = new NegocioProductos();
        Usuario Current = new Usuario();
        NegocioUsuario negU = new NegocioUsuario();
        NegocioCaracteristicasXproductosXcolores nCXPXC = new NegocioCaracteristicasXproductosXcolores();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!IsPostBack)
            {
                Current = (Usuario)HttpContext.Current.Session["Usuario"];
                CambiarNavegadores();
                cargarProductosporId(id);
                cargarCaracteristicas(id);
                cargarColores(id);
                cargarCantidad(id);
            }
        }
        protected void btnAbrirPopup_Click(object sender, EventArgs e)
        {
            MostrarPopup("PopupInicioSesion");
        }

        protected void btnCerrar_Click(object sender, ImageClickEventArgs e)
        {
            OcultarPopup("PopupInicioSesion");
        }

        protected void btnAbrirPopup2_Click(object sender, EventArgs e)
        {
            MostrarPopup("PopupRegistro");
        }
        protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }
        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = negU.CrearLog(txtUsuario.Text, txtContraseña.Text);
            if (Session["Usuario"] == null)
            {
                lblerror.Text = "Datos Incorrectos!";
                lblerror.Visible = true;
            }
            else
            {
                if (negU.esAdmin(txtUsuario.Text, txtContraseña.Text))
                    Response.Redirect("~/AdminReportes.aspx");
                else
                    Current = (Usuario)HttpContext.Current.Session["Usuario"];
                CambiarNavegadores();
            }


        }
        protected void btnCerrarSesion(object sender, EventArgs e)
        {
            Current = null;
            Session["Usuario"] = null;
            Response.Redirect("Inicio.aspx");
        }
        protected void CambiarNavegadores()
        {
            btnInicio.Text = "Inicio";
            if (Current != null)
            {
                btnAbrirPopup.Text = Current.Nombre_Us1;
                btnAbrirPopup.PostBackUrl = "DetallesUsuario.aspx";
            }
            else
            {
                btnAbrirPopup.Text = "Iniciar Sesión";
                btnAbrirPopup.OnClientClick = "btnAbrirPopup_Click";
            }
        }
        public void MostrarPopup(string popup)
        {
            string fadeInScript = @"<script>
        function fadeIn(element) {
            element.style.opacity = 0;
            element.style.visibility = 'visible';

            (function fade() {
                var val = parseFloat(element.style.opacity);
                if (!((val += 0.1) > 1)) {
                    element.style.opacity = val;
                    requestAnimationFrame(fade);
                }
            })();
        }
        fadeIn(document.getElementById('" + popup + @"'));
    </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "FadeInScript", fadeInScript);


        }
        public void OcultarPopup(string popup)
        {
            string fadeOutScript = @"<script>
        function fadeOut(element) {
            element.style.opacity = 1;
            element.style.visibility = 'visible';

            (function fade() {
                if ((element.style.opacity -= 0.1) < 0) {
                    element.style.display = 'none';
                    element.style.visibility = 'hidden';
                    element.style.opacity = '0';
                } else {
                    requestAnimationFrame(fade);
                }
            })();
        }
        fadeOut(document.getElementById('" + popup + @"'));
    </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "FadeOutScript", fadeOutScript);
        }

        protected void ddlCaracteristica_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            cargarColores(id);
            ddlCantidad.Items.Clear();
            cargarCantidad(id);
        }

        protected void ddlColor_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            ddlCantidad.Items.Clear();
            cargarCantidad(id);
        }
        public void cargarCaracteristicas(String id)
        {
            DataTable tablaCaracteristicas = nCXPXC.getTablaCaracteristicas(id);
            ddlcaracteristica.DataSource = tablaCaracteristicas;
            ddlcaracteristica.DataTextField = "Nombre_Car";
            ddlcaracteristica.DataValueField = "CodCaracteristicas_CXPXC";
            ddlcaracteristica.DataBind();
        }

        public void cargarColores(String id)
        {
            DataTable tablaColores = nCXPXC.getTablaColores(id, ddlcaracteristica.SelectedValue);
            ddlColor.DataSource = tablaColores;
            ddlColor.DataTextField = "Descripcion_Co";
            ddlColor.DataValueField = "CodColor_CXPXC";
            ddlColor.DataBind();
        }

        public void cargarCantidad(String id)
        {
            int cantidad = nCXPXC.getCantidad(id, ddlcaracteristica.SelectedValue, ddlColor.SelectedValue);

            if (cantidad == 0)
            {
                ddlCantidad.Items.Add("Sin Stock");
            }
            else
            {
                for (int i = 1; i <= cantidad; i++)
                {
                    ddlCantidad.Items.Insert(i - 1, new ListItem { Value = i.ToString(), Text = i.ToString() });
                }
            }
        }
        void cargarProductosporId(String id)
        {
            lvProductoMas.DataSource = nPr.getTablaProductosSeleccionados(id);
            lvProductoMas.DataBind();
        }
        protected void btnAgregar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoAgregar")
            {
                TablaCarrito tb = new TablaCarrito();

                String[] argumentos = e.CommandArgument.ToString().Split('-');

                String nombre = argumentos[0];
                String precioUnitario = argumentos[1];


                if (Session["usuario"] != null)
                {
                    string id = Request.QueryString["id"];
                    if (Session["carrito"] == null) Session["carrito"] = tb.crearTabla();

                    if (!tb.noRepetir(id, Convert.ToString(ddlColor.SelectedItem), ddlcaracteristica.SelectedValue, (DataTable)Session["carrito"]))
                    {
                        if (Convert.ToString(ddlCantidad.SelectedItem) != "Sin Stock")
                        {
                            tb.agregarFila((DataTable)Session["carrito"], id, nombre, Convert.ToString(ddlcaracteristica.SelectedItem), Convert.ToString(ddlColor.SelectedItem), Convert.ToString(ddlCantidad.SelectedValue), precioUnitario);
                            lblMensaje.Text = "Producto agregado al carrito!";
                            lblMensaje.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMensaje.Text = "Este producto no tiene Stock!";
                            lblMensaje.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblMensaje.Text = "Este producto ya está en el carrito!";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMensaje.Text = "No ha iniciado sesión!";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

    }
}