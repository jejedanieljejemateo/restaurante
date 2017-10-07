using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;
using Utilitarios;

public partial class Presentacion_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CoreUsuario core = new CoreUsuario();
        object user = Session["user"];
        string[] retorno = null;
        retorno=core.PageLoadMaster(LB_Iniciar,LB_Cerrar,LB_Perfil,user);
        Session["nombreRest"] = retorno[0];
        Session["mision"] = retorno[1];
        Session["vision"] = retorno[2];
        Session["quienes"] = retorno[3];
        Session["eslogan"] = retorno[4];
        Session["titulo1"] = retorno[5];
        Session["texto1"] = retorno[6];
        Session["titulo2"] = retorno[7];
        Session["texto2"] = retorno[8];
        Session["titulo3"] = retorno[9];
        Session["texto3"] = retorno[10];
        Session["info_ubicacion"] = retorno[11];
        Session["ciudad"] = retorno[12];
        Session["direccion"] = retorno[13];
        Session["mapa"] = retorno[14];
        Session["email"] = retorno[15];
    }

    protected void LB_Cerrar_Click(object sender, EventArgs e)
    {
        Data.DAOUsuario a = new Data.DAOUsuario();
        int s = 0;
        s = int.Parse(Session["userId"].ToString());
        a.cerrar_sesion(s);
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
        /*EPlato plato = new EPlato();
        plato.IdPlato = int.Parse(Session["userId"].ToString());*/    
        Response.Redirect("inicio.aspx");

    }
}
