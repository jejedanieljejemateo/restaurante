using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Presentacion_admin_MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LB_Cerrar_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Session["rolId"] = null;
        Response.Redirect("inicio.aspx");
    }
}
