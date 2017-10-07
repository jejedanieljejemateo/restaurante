using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

public partial class Presentacion_menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        
    }

    protected void BT_Agregar_Click(object sender, EventArgs e)
    {
        Button btn = (Button) sender;
        DataListItem item = (DataListItem) btn.NamingContainer;
        Label lblId = (Label)item.FindControl("LB_id");
        Label lblName = (Label)item.FindControl("LB_Nombre");
        Label lblDesc = (Label)item.FindControl("LB_Descripcion");
        Label lblPrec = (Label)item.FindControl("LB_Precio");
        Image imagen = (Image)item.FindControl("Imagen");

        string stringID = lblId.Text;
        string nombre = lblName.Text;
        string desc = lblDesc.Text;
        string prec = lblPrec.Text;
        string img = imagen.ImageUrl;

        int id = Convert.ToInt32(stringID);

        Session["platoId"] = id;
        Session["platoNombre"] = nombre;
        Session["platoDesc"] = desc;
        Session["platoPrec"] = prec;
        Session["platoImg"] = img;

        string str = id.ToString();
        Response.Redirect("plato.aspx?PlatoID="+str+"#abajo");
        

    }


 }