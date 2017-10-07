using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_calificacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        CoreReserva core = new CoreReserva();
        object reserva = Session["reserva"];
        object reservaId = Session["reservaId"];
        string redirect = core.PageLoadCalificacion(reserva,reservaId);

        try
        {
            Response.Redirect(redirect);
        }
        catch { }

        DataTable data2 = core.PageLoadCalificacion2(reservaId);

        GV_Calificar.DataSource = data2;
        GV_Calificar.DataBind();

    }
    protected void BT_Calificar_Click(object sender, EventArgs e)
    {
        GridViewRow item = (GridViewRow)((LinkButton)sender).NamingContainer;

        Label lbl = (Label)item.FindControl("LB_id");

        int ddlCal = Convert.ToInt32(DDL_Cal.SelectedValue);
        int lblid = Convert.ToInt32(lbl.Text);

        CoreReserva core = new CoreReserva();
        core.Core_BT_Calificar(ddlCal,lblid);
        Response.Redirect("calificacion.aspx#abajo");
        
    }
    protected void BT_Terminar_Click(object sender, EventArgs e)
    {
        CoreReserva core = new CoreReserva();
        core.Core_BT_Terminar_Cal();
        Session["reserva"] = 1;
        Response.Redirect("perfil.aspx#abajo");
    }
}