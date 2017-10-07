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
using Utilitarios;

public partial class Presentacion_plato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        EPlato plato = new EPlato();
        plato.IdPlato = int.Parse(Session["platoId"].ToString());
        plato.Precio = int.Parse(Session["platoPrec"].ToString());
        plato.Descrip = Session["platoDesc"].ToString();
        plato.ImagenUrl = Session["platoImg"].ToString();
        plato.Rating = lblRating.Text;

        CorePlatos core = new CorePlatos();
        core.PageLoadPlato(plato,Rating1);
    }
    protected void BT_Calificar_Click(object sender, EventArgs e)
    {
        //Rating rtn = (Rating)Page.Master.FindControl("ContentPlaceHolder1").FindControl("Rating1");
        string rating = Rating1.CurrentRating.ToString();

        //Session["prueba"] = rating;
        prueba.Text = rating;
        //Response.Redirect("plato.aspx");
    }
    protected void BT_Agregar_Click(object sender, EventArgs e)
    {
        TextBox cantidad = (TextBox)Page.Master.FindControl("ContentPlaceHolder1").FindControl("TB_Cantidad");
        Label idplato2 = (Label)Page.Master.FindControl("ContentPlaceHolder1").FindControl("LB_id");
        Label precio = (Label)Page.Master.FindControl("ContentPlaceHolder1").FindControl("LB_Precio");

        int idplato = Convert.ToInt32(idplato2.Text);
        int cant = Convert.ToInt32(cantidad.Text);
        int prec = Convert.ToInt32(precio.Text);

        CorePlatos core = new CorePlatos();
        core.Core_BT_Agregar_Plato(idplato,cant,prec);
    }
}