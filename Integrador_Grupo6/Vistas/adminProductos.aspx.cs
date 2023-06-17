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
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cargartablaProductos();
            }

        }
        void cargartablaProductos()
        {
            DataTable tablaProductos = np.getTabla("SELECT * FROM Productos");
            grvProductos.DataSource = tablaProductos;
            grvProductos.DataBind();
        }

    }
}



