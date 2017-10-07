using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_contacto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
    }

    protected void BT_Enviar_Click(object sender, EventArgs e)
    {

        TextBox txtNombre = (TextBox)Page.Master.FindControl("ContentPlaceHolder1").FindControl("TB_Nombre");
        TextBox txtEmail = (TextBox)Page.Master.FindControl("ContentPlaceHolder1").FindControl("TB_Email");
        TextBox txtTel = (TextBox)Page.Master.FindControl("ContentPlaceHolder1").FindControl("TB_Telefono");
        TextBox txtMsj = (TextBox)Page.Master.FindControl("ContentPlaceHolder1").FindControl("TB_Mensaje");

        string nombre = txtNombre.Text;
        string email = txtEmail.Text;
        string tel = txtTel.Text;
        string msj = txtMsj.Text;

        CoreUsuario core = new CoreUsuario();
        core.Core_BT_Contacto_Enviar(nombre, email, tel, msj);

    }

}