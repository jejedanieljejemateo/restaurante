using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_panel_ventas : System.Web.UI.Page
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
    protected void BT_Si_Asistio_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
        Label txtNombre = row.FindControl("LB_Nombre") as Label;

        string nombre = txtNombre.Text;

        CoreReserva core = new CoreReserva();
        core.Core_BT_Si_Asistio(nombre);
        Session["reserva"] = 3;
        Response.Redirect("ventas.aspx");
    }
    protected void BT_No_Asistio_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
        Label txtNombre = row.FindControl("LB_Nombre") as Label;

        string nombre = txtNombre.Text;

        CoreReserva core = new CoreReserva();
        core.Core_BT_No_Asistio(nombre);
        Response.Redirect("ventas.aspx");
    }
}