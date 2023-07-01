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
    public partial class Carrito : System.Web.UI.Page
    {
        NegocioFactura nF = new NegocioFactura();
        NegocioDetalleFactura nDF = new NegocioDetalleFactura();
        NegocioEnvio Nen = new NegocioEnvio();
        NegocioPago Npa = new NegocioPago();
        Usuario Current = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Current = (Usuario)HttpContext.Current.Session["Usuario"];
                CambiarNavegadores();
                PanelFormaEnvio.Visible = false;
                PanelEfectivo.Visible = false;
                PanelTarjeta.Visible = false;
                //cargarEnvio();

                if (Session["carrito"] != null)
                {
                    lbl_Nombre.Text = ((Usuario)Session["usuario"]).Nombre_Us1;
                    lbl_Apellido.Text = ((Usuario)Session["usuario"]).Apellido_Us1;
                    lbl_DNI.Text = ((Usuario)Session["usuario"]).DNI_Us1;

                    grdCarrito.DataSource = Session["carrito"];
                    grdCarrito.DataBind();
                    decimal acumTotal = 0;

                    foreach (DataRow dr in ((DataTable)Session["carrito"]).Rows)
                    {
                        acumTotal += Convert.ToInt32(dr["Cantidad"]) * Convert.ToDecimal(dr["Precio Unitario"]);
                    }

                    lblTotal.Text = Convert.ToString(acumTotal);
                }
                else
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "Carrito vacio!";
                }
            }
        }

        protected void btnAbrirPopup_Click(object sender, EventArgs e)
        {
            Panelpopup.Visible = true;
        }

        protected void btnCerrar_Click(object sender, ImageClickEventArgs e)
        {
            Panelpopup.Visible = false;
        }

        protected void btnAbrirPopup2_Click(object sender, EventArgs e)
        {
                Current = null;
                Session["Usuario"] = null;
                Response.Redirect("Inicio.aspx");
        }

        protected void btnCerrar2_Click(object sender, ImageClickEventArgs e)
        {
            Panelpopup2.Visible = false;
        }

        protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }

        private decimal SumaTotal()
        {
            decimal total = 0;
            int rowCount = gvProductosCarrito.Rows.Count;

            for (int i = 0; i < rowCount && i < 4; i++)
            {
                decimal cellValue;
                if (decimal.TryParse(gvProductosCarrito.Rows[i].Cells[4].Text, out cellValue))
                {
                    total += cellValue;
                }
                else
                {
                    // Manejar el caso en el que el valor en la celda no se pueda convertir a decimal.
                    // Puedes mostrar un mensaje de error, omitir el valor o realizar alguna otra acción.
                }
            }

            return total;
        }

        protected void btnTarjeta_Click(object sender, EventArgs e)
        {
            PanelTarjeta.Visible = true;
            PanelEfectivo.Visible = false;
        }

        protected void btnEfectivo_Click(object sender, EventArgs e)
        {
            PanelEfectivo.Visible = true;
            PanelTarjeta.Visible = false;
        }

        protected void btn_PagarTarj_Click(object sender, EventArgs e)
        {
            if (Session["carrito"] != null)
            {
                String metodoPago = "2";
                bool agrego = agregarFactura(metodoPago);

                if (agrego)
                {
                    bool agregoDetalles = agregarDetalles();

                    if (agregoDetalles)
                    {
                        lblMensaje.Text = "Se realizó la compra con éxito!";
                        lblMensaje.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMensaje.Text = "No se pudo realizar la compra";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMensaje.Text = "No se pudo realizar la compra";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }

                Session["carrito"] = null;
            }
            else
            {
                lblMensaje.Text = "Ya se realizó esta compra!";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btn_PagarEfec_Click(object sender, EventArgs e)
        {
            if (Session["carrito"] != null)
            {
                String metodoPago = "1";
                bool agrego = agregarFactura(metodoPago);

                if (agrego)
                {
                    bool agregoDetalles = agregarDetalles();

                    if (agregoDetalles)
                    {
                        lblMensaje.Text = "Se realizó la compra con éxito!";
                        lblMensaje.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMensaje.Text = "No se pudo realizar la compra";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMensaje.Text = "No se pudo realizar la compra";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }

                Session["carrito"] = null;
            }
            else
            {
                lblMensaje.Text = "Ya se realizó esta compra!";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }


        protected void ddl_FormasEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_FormasEnvio.SelectedValue == "0")
            {
                PanelFormaEnvio.Visible = false;
            }
            else if(ddl_FormasEnvio.SelectedValue == "2")
            {
                PanelFormaEnvio.Visible = true;
                btnEfectivo.ValidationGroup = "Grupo1";
                btnTarjeta.ValidationGroup = "Grupo1";
            }
            else
            {
                PanelFormaEnvio.Visible = false;
                btnEfectivo.ValidationGroup = "Grupo0";
                btnTarjeta.ValidationGroup = "Grupo0";
            }
        }

        public bool agregarFactura(String metodoPago)
        {
            String dni = ((Usuario)Session["usuario"]).DNI_Us1;
            String metodoEnvio = ddl_FormasEnvio.SelectedValue;
            String direccionEntrega;
            if (txtDireccionEntrega.Text != "" && metodoEnvio == "2")
                direccionEntrega = txtDireccionEntrega.Text;
            else
                direccionEntrega = "Retiro en sucursal";

            return nF.agregarFactura(dni, metodoPago, metodoEnvio, direccionEntrega);
        }

        public bool agregarDetalles()
        {
            bool agrego = true;
            foreach (DataRow dr in ((DataTable)Session["carrito"]).Rows)
            {
                String codProducto = Convert.ToString(dr["Id Producto"]);
                String codCaracteristica = Convert.ToString(dr["Caracteristica"]);
                String color = Convert.ToString(dr["Color"]);
                int cantitad = Convert.ToInt32(dr["Cantidad"]);
                decimal precioUn = Convert.ToDecimal(dr["Precio Unitario"]);
                String precioUnConPunto = Convert.ToString(precioUn).Replace(',', '.');

                if (nDF.insertarDetalles(codProducto, codCaracteristica, color, precioUnConPunto, cantitad) == true && agrego != false)
                {
                    agrego = true;
                }
                else
                {
                    agrego = false;
                }
            }
            return agrego;
        }
        protected void CambiarNavegadores()
        {
            if (Current != null)
            {
                btnRegistrarse.Text = "Cerrar Sesión";
                btnAbrirPopup.Text = Current.Nombre_Us1;
                btnAbrirPopup.PostBackUrl = "DetallesUsuario.aspx";
            }
            else
            {
                btnRegistrarse.Text = "Registrarse";
                btnAbrirPopup.Text = "Iniciar Sesión";
            }
        }

        //void cargarEnvio()
        //{
        //    DataTable tabla;
        //    tabla = Nen.tablaEnvio();
        //    ddl_FormasEnvio.DataSource = tabla;
        //    ddl_FormasEnvio.DataTextField = "Descripcion_Me";
        //    ddl_FormasEnvio.DataValueField = "CodMetodoEnvio_Me";
        //    ddl_FormasEnvio.DataBind();
        //}

    }
}