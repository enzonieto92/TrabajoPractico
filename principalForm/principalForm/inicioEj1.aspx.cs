using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace principalForm
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkEjercicio1_Click(object sender, EventArgs e)
        {
            Response.Redirect("formEjercicio1.aspx");
        }

        protected void lnkEjercicio2_Click(object sender, EventArgs e)
        {
            Response.Redirect("formEjercicio2.aspx");
        }
    }
}