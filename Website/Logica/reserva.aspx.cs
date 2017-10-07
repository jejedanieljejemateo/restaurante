using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_reserva : System.Web.UI.Page
{
    public string _fechas = "''";
    public string Fechas { get { return this._fechas; } }

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        CoreReserva core = new CoreReserva();
        core.PageLoadReserva(DDL_Personas,DDL_Hora,_fechas,LB_Iniciar,LB_Cerrar,LB_Perfil);
    }

    protected void LB_Cerrar_Click(object sender, EventArgs e)
    {

        Session["userId"] = null;
        Session["user"] = null;
        Session["rolId"] = null;
        Session["reserva"] = null;
        Session["fechaReserva"] = null;
        Session["horaReserva"] = null;
        Session["reservaId"] = null;
        LB_Iniciar.Visible = true;
        LB_Cerrar.Visible = false;
        LB_Perfil.Visible = false;
        Response.Redirect("inicio.aspx");

    }

    protected void BT_Reserva_Click(object sender, EventArgs e)
    {
        CoreReserva core = new CoreReserva();
        core.Core_BT_Reserva(Request.Form["DDL_Personas"], Request.Form["DDL_Hora"], Request.Form["TB_Fecha"]);

    }
}