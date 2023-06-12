﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panelpopup.Visible = false;
            Panelpopup2.Visible = false;
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
    }
}