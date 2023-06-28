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
        protected void Page_Load(object sender, EventArgs e)
        {
            Panelpopup.Visible = false;
            Panelpopup2.Visible = false;
            if (!IsPostBack)
            {
                if (Session["carrito"] != null)
                {
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
            Panelpopup2.Visible = true;
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

        }

        protected void btnEfectivo_Click(object sender, EventArgs e)
        {

        }

        protected void btn_PagarTarj_Click(object sender, EventArgs e)
        {

        }

        protected void btn_PagarEfec_Click(object sender, EventArgs e)
        {

        }
    }
}