using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace TP7_Grupo_Nro_06
{
    public partial class SeleccionarSucursales : System.Web.UI.Page
    {
        static string consulta;
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

        protected void btnProvincias_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName == "comandoBoton")
            {
                SqlDataSource1.FilterExpression = "Id_ProvinciaSucursal = " + e.CommandArgument;
                lvSucursales.DataBind();
            }
        }

        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            Metodos tabla = new Metodos();
            if (e.CommandName == "eventoSeleccionar")
            {
                string[] argumentos = e.CommandArgument.ToString().Split(new char[] { ',' });

                string Id_Sucursal = argumentos[0];
                string NombreSucursal = argumentos[1];
                string DescripcionSucursal = argumentos[2];

                if (Session["SucursalesSeleccionadas"] == null)
                {
                    Session["SucursalesSeleccionadas"] = tabla.CrearTabla();
                }
                else
                {
                   tabla.AgregarFila((DataTable)Session["SucursalesSeleccionadas"], Id_Sucursal, NombreSucursal, DescripcionSucursal);
                }

                
            }

        }
    }
}