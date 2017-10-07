using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.IO;
using Logica;
public partial class Presentacion_panel_menu : System.Web.UI.Page
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
        catch {}
    }

    protected void BT_Editar_Click(object sender, EventArgs e)
    {
        GridViewRow row3 = (GridViewRow)((LinkButton)sender).NamingContainer;
        FileUpload fu = (FileUpload)(row3.FindControl("EFU_Imagen"));
        GridViewRow row2 = (GridViewRow)((LinkButton)sender).NamingContainer;
        Label lbImagen = row2.FindControl("ELB_Imagen") as Label;
        string tbImagen = lbImagen.Text;

        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
        Label txtId = row.FindControl("ELB_id") as Label;
        TextBox txtNombre = row.FindControl("ETB_Nombre") as TextBox;
        TextBox txtPrecio = row.FindControl("ETB_Precio") as TextBox;
        TextBox txtDesc = row.FindControl("ETB_Descripcion") as TextBox;

        int tbId = Convert.ToInt32(txtId.Text);
        int tbPrecio = Convert.ToInt32(txtPrecio.Text);
        string tbNombre = txtNombre.Text;
        string tbDesc = txtDesc.Text;

        ClientScriptManager cm = this.ClientScript;

        HttpServerUtility Server = null;

        CorePublico core = new CorePublico();
        core.Core_BT_Editar_Menu(fu, tbImagen, tbId, tbPrecio, tbNombre, tbDesc, cm, Server);
        Response.Redirect("menu.aspx");

    }

    protected void BT_Insertar_Click(object sender, EventArgs e)
    {
        GridViewRow row3 = (GridViewRow)((LinkButton)sender).NamingContainer;
        FileUpload fu = (FileUpload)(row3.FindControl("FU_Imagen"));

        ClientScriptManager cm = this.ClientScript;

        HttpServerUtility Server = null;

        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;

        TextBox txtNombre = row.FindControl("FTB_Nombre") as TextBox;
        TextBox txtPrecio = row.FindControl("FTB_Precio") as TextBox;
        TextBox txtDescripcion = row.FindControl("FTB_Descripcion") as TextBox;

        string tbNombre = txtNombre.Text;
        string tbDescripcion = txtDescripcion.Text;
        int tbPrecio = Convert.ToInt32(txtPrecio.Text);

        CorePublico core = new CorePublico();
        core.Core_BT_Insertar_Menu(GV_Platos, fu, tbPrecio, tbNombre, tbDescripcion, cm, Server);
        Response.Redirect("menu.aspx");
    }

    protected void BT_Borrar_Click(object sender, EventArgs e)
    {
        var btn = (Control)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        Label lblValue = (Label)row.FindControl("LB_id");
        int lbId = Convert.ToInt32(lblValue.Text);

        CorePublico core = new CorePublico();
        core.Core_BT_Borrar_Menu(GV_Platos, lbId);
        Response.Redirect("menu.aspx");
    }

    protected void BT_Ingredientes_Click(object sender, EventArgs e)
    {
        
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
        Label lblId = (Label)row.FindControl("LB_id");
        Label lblNombre = (Label)row.FindControl("LB_Nombre");
        string stringID = lblId.Text;
        string name = lblNombre.Text;
        int id = Convert.ToInt32(stringID);
        Session["platoIngre"] = id;
        Session["platoNombre"] = name;
        string str = id.ToString();
        Response.Redirect("plato.aspx?PlatoID=" + str);


    }

}