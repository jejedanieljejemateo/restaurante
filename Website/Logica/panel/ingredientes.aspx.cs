using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_panel_ingredientes : System.Web.UI.Page
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
        catch { }
    }
    protected void BT_Editar_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
        Label txtId = row.FindControl("ELB_id") as Label;
        TextBox txtNombre = row.FindControl("ETB_Nombre") as TextBox;
        TextBox txtDesc = row.FindControl("ETB_Descripcion") as TextBox;
        TextBox txtCant = row.FindControl("ETB_Cantidad") as TextBox;
        TextBox txtMin = row.FindControl("ETB_Minimo") as TextBox;
        DropDownList txtUni = row.FindControl("DDL_Unidad") as DropDownList;

        int tbId = Convert.ToInt32(txtId.Text);
        string tCant = txtCant.Text;
        string tMin = txtMin.Text;
        double tbCant = double.Parse(tCant);
        double tbMin = double.Parse(tMin);
        string tbNombre = txtNombre.Text;
        string tbDesc = txtDesc.Text;
        string tbUni = txtUni.Text;

        CorePlatos core = new CorePlatos();
        core.Core_BT_Editar_Ingre(tbId,tbCant,tbMin,tbNombre,tbDesc,tbUni);
        Response.Redirect("ingredientes.aspx");
    }

    protected void BT_Insertar_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;

        TextBox txtNombre = row.FindControl("FTB_Nombre") as TextBox;
        TextBox txtDesc = row.FindControl("FTB_Descripcion") as TextBox;
        TextBox txtCant = row.FindControl("FTB_Cantidad") as TextBox;
        TextBox txtMin = row.FindControl("FTB_Minimo") as TextBox;
        DropDownList txtUni = row.FindControl("FDDL_Unidad") as DropDownList;

        string tCant = txtCant.Text;
        string tMin = txtMin.Text;
        double tbCant = double.Parse(tCant);
        double tbMin = double.Parse(tMin);
        string tbNombre = txtNombre.Text;
        string tbDesc = txtDesc.Text;
        string tbUni = txtUni.Text;

        CorePlatos core = new CorePlatos();
        core.Core_BT_Insertar_Ingre(tbCant, tbMin, tbNombre, tbDesc, tbUni);
        Response.Redirect("ingredientes.aspx");
    }

    protected void BT_Borrar_Click(object sender, EventArgs e)
    {
        var btn = (Control)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        Label lblValue = (Label)row.FindControl("LB_id");
        int lbId = Convert.ToInt32(lblValue.Text);

        CorePlatos core = new CorePlatos();
        core.Core_BT_Borrar_Ingre(lbId);
        Response.Redirect("ingredientes.aspx");
    }
}