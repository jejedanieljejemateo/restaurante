using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        CoreUsuario core = new CoreUsuario();
        object user = Session["user"];
        string redirec = core.PageLoadLogin(user);
        try
        {
            Response.Redirect(redirec);
        }
        catch {
        
        }
        
    }
    protected void Login1_Authenticate(object sender, EventArgs e)
    {
        CoreUsuario core = new CoreUsuario();
        //Utilitarios.EUsuaurio user = new Utilitarios.EUsuaurio();
        String us = Login1.UserName.ToString();
        String cl = Login1.Password.ToString();
        object rolid = Session["rolId"];
        string[] perfil=null;
        perfil = core.autenticate(us, cl);
        Session["ip"]=perfil[0];
        Session["mac"]=perfil[1];
        Session["userId"]=perfil[2];
        Session["user"]=perfil[3];
        Session["rolId"]=perfil[4];
        Session["reserva"]=perfil[5];
        Session["estado_user"]=perfil[6];
        Session["fechaReserva"]=perfil[7];
        Session["horaReserva"]=perfil[8];
        Session["reservaId"] = perfil[9];
        string mensaje = perfil[11];
        
          try
        {
            anuncio.Text = mensaje.ToString();
            Response.Redirect(perfil[10].ToString());
        }
        catch {
        
        }
   
    }

    protected void BT_Registro_Click(object sender, EventArgs e)
    {
        string tbUser = ((TextBox)Login1.FindControl("TB_User")).Text;
        string tbNombre = ((TextBox)Login1.FindControl("TB_Nombre")).Text;
        string tbCorreo = ((TextBox)Login1.FindControl("TB_Email")).Text;
        string tbPass = ((TextBox)Login1.FindControl("TB_Pass")).Text;
        string tbTel = ((TextBox)Login1.FindControl("TB_Telefono")).Text;
        
        TextBox txtCedula = Login1.FindControl("TB_Cedula") as TextBox;
        int tbCedula = Convert.ToInt32(txtCedula.Text);
        object rolId = Session["rolId"];

        CoreUsuario core = new CoreUsuario();
       string a = core.Core_BT_Registro(tbUser, tbNombre, tbCorreo, tbPass, tbTel, tbCedula,rolId);

       try {
           Response.Write(a);
       }
       catch { }

    }
}