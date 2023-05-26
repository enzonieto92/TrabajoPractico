using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace TP7_Grupo_Nro_06
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lvSucursales_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click1(object sender, EventArgs e)
        {
            string texto = txtboxBusqueda.Text;

            SqlDataSource1.FilterExpression = "NombreSucursal LIKE '%" + texto + "%'";
            lvSucursales.DataBind();
        }
    }
}