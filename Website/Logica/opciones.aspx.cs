using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_opciones : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        CoreReserva core = new CoreReserva();
        object userId = Session["userId"];
        object reserva = Session["reserva"];
        object reservaId = Session["reservaId"];
        string redirect = core.PageLoadOpciones(userId, reserva);

        try
        {
            Response.Redirect(redirect);
        }
        catch { }

        core.PageLoadOpciones2(userId);
        core.PageLoadOpciones3(reservaId);
    }
    protected void BT_Eliminar_Reserva_Click(object sender, EventArgs e)
    {
        CoreReserva core = new CoreReserva();
        core.Core_BT_Eliminar_Reserva();
    }
    protected void BT_Eliminar_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (RepeaterItem)((LinkButton)sender).NamingContainer;

        Label lbl = (Label)item.FindControl("LB_id");

        int id = Convert.ToInt32(lbl.Text);

        CoreReserva core = new CoreReserva();
        core.Core_BT_Eliminar_Plato_Reserva(id);
    }
}