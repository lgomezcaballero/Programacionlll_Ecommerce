﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aplicacion_Web_Ecommerce.Pages
{
    public partial class ModificarArticulo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["ID"] !=null && Request.QueryString["Type"] != null)
            {
                string type = Request.QueryString["Type"];
                long id = long.Parse(Request.QueryString["ID"]);
                if(type == "e")
                {
                    
                }
            }

        }
    }
}