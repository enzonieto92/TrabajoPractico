using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace principalForm
{
    
    public partial class formEjercicio1 : System.Web.UI.Page
    {
        Metodos cargarGrid = new Metodos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                cargarGridView();
            }
        }
        private void cargarGridView()
        {
            GridView1.DataSource = cargarGrid.cargarTabla();
            GridView1.DataBind();
        }
    }
}