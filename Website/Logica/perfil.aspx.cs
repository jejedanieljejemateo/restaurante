using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;
public partial class Presentacion_perfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        CoreUsuario core = new CoreUsuario();
        object user = Session["user"];
        string redirect = core.PageloadAutenticar(user);
        Label1.Text = Session["asd"].ToString();
        Label2.Text = Session["qwe"].ToString();
        try
        {
            Response.Redirect(redirect);
        }
        catch { }

    }
}