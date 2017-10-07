using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_panel_mesas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        CoreUsuario core = new CoreUsuario();
        object user = Session["user"];
        object rolId = Session["rolId"];
        string redirect = core.PageLoadAutenticarPanel(user, rolId);

        try
        {
            Response.Redirect(redirect);
        }
        catch { }
    }

    protected void BT_Editar_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
        Label txtId = row.FindControl("ELB_id") as Label;
        TextBox txtSillas = row.FindControl("ETB_Sillas") as TextBox;

        int tbId = Convert.ToInt32(txtId.Text);
        int tbSillas = Convert.ToInt32(txtSillas.Text);

        CorePublico core = new CorePublico();
        core.Core_BT_Editar_Mesas(tbId,tbSillas);
        Response.Redirect("mesas.aspx");
    }

    protected void BT_Insertar_Click(object sender, EventArgs e)
    {

        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;

        TextBox txtSillas = row.FindControl("FTB_Sillas") as TextBox;

        int tbSillas = Convert.ToInt32(txtSillas.Text);

        CorePublico core = new CorePublico();
        core.Core_BT_Insertar_Mesas(tbSillas);
        Response.Redirect("mesas.aspx");
    }

    protected void BT_Borrar_Click(object sender, EventArgs e)
    {
        var btn = (Control)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        Label lblValue = (Label)row.FindControl("LB_id");
        int lbId = Convert.ToInt32(lblValue.Text);

        CorePublico core = new CorePublico();
        core.Core_BT_Borrar_Mesas(lbId);
        Response.Redirect("mesas.aspx");
    }

}