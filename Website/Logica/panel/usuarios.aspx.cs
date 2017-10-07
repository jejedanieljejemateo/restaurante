using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_panel_usuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        CoreUsuario core = new CoreUsuario();
        object user = Session["user"];
        object rolId = Session["rolId"];
        string redirect = core.PageLoadAutenticarPanel2(user, rolId);

        try
        {
            Response.Redirect(redirect);
        }
        catch { }
    }
    protected void BT_Desbloquear_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
        Label txtNombre = row.FindControl("LB_id") as Label;

        string nombre = txtNombre.Text;

        CoreUsuario core = new CoreUsuario();
        core.Core_BT_Desbloquear_Usuario(nombre);
        Response.Redirect("usuarios.aspx");
    }
}