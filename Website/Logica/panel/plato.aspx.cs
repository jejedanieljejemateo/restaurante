using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using AjaxControlToolkit;
using Logica;

public partial class Presentacion_panel_plato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        CorePlatos core = new CorePlatos();
        object user = Session["user"];
        object rolId = Session["rolId"];
        object platoIngre = Session["platoIngre"];
        string redirect = core.PageLoadPanelPlato(user,rolId,platoIngre);

        try
        {
            Response.Redirect(redirect);
        }
        catch { }

        DataTable data = core.PageLoadPanelPlato2(platoIngre);

        GV_Plato.DataSource = data;
        GV_Plato.DataBind();
    }

    protected void BT_Insertar_Click(object sender, EventArgs e)
    {
        TextBox txtCant = (TextBox)Page.Master.FindControl("ContentPlaceHolder1").FindControl("FTB2_Cantidad");
        DropDownList txtIngre = (DropDownList)Page.Master.FindControl("ContentPlaceHolder1").FindControl("FDDL2_Ingrediente");

        string tCant = txtCant.Text;
        double tbCant = double.Parse(tCant);
        string tbIngre = txtIngre.Text;

        CorePlatos core = new CorePlatos();
        core.Core_BT_Insertar_Ingre_Plato(tbCant,tbIngre);
    }

    protected void BT_Borrar_Click(object sender, EventArgs e)
    {
        var btn = (Control)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        Label lblValue = (Label)row.FindControl("LB_id");
        int lbId = Convert.ToInt32(lblValue.Text);

        CorePlatos core = new CorePlatos();
        core.Core_BT_Borrar_Ingre_Plato(lbId);
    }

}