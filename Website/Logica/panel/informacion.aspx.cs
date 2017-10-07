using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_panel_informacion : System.Web.UI.Page
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
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
        TextBox txtNombre = row.FindControl("ETB_Nombre") as TextBox;
        TextBox txtMision = row.FindControl("ETB_Mision") as TextBox;
        TextBox txtVision = row.FindControl("ETB_Vision") as TextBox;
        TextBox txtQuienes = row.FindControl("ETB_Quienes") as TextBox;
        TextBox txtEslogan = row.FindControl("ETB_Eslogan") as TextBox;
        TextBox txtTitulo1 = row.FindControl("ETB_Titulo1") as TextBox;
        TextBox txtTexto1 = row.FindControl("ETB_Texto1") as TextBox;
        TextBox txtTitulo2 = row.FindControl("ETB_Titulo2") as TextBox;
        TextBox txtTexto2 = row.FindControl("ETB_Texto2") as TextBox;
        TextBox txtTitulo3 = row.FindControl("ETB_Titulo3") as TextBox;
        TextBox txtTexto3 = row.FindControl("ETB_Texto3") as TextBox;
        TextBox txtInfo = row.FindControl("ETB_Info") as TextBox;
        TextBox txtCiudad = row.FindControl("ETB_Ciudad") as TextBox;
        TextBox txtDire = row.FindControl("ETB_Direccion") as TextBox;
        TextBox txtMapa = row.FindControl("ETB_Mapa") as TextBox;
        TextBox txtEmail = row.FindControl("ETB_Email") as TextBox;

        string tbNombre = txtNombre.Text;
        string tbMision = txtMision.Text;
        string tbVision = txtVision.Text;
        string tbQuienes = txtQuienes.Text;
        string tbEslogan = txtEslogan.Text;
        string tbTitulo1 = txtTitulo1.Text;
        string tbTitulo2 = txtTitulo2.Text;
        string tbTitulo3 = txtTitulo3.Text;
        string tbTexto1 = txtTexto1.Text;
        string tbTexto2 = txtTexto2.Text;
        string tbTexto3 = txtTexto3.Text;
        string tbInfo = txtInfo.Text;
        string tbCiudad = txtCiudad.Text;
        string tbDire = txtDire.Text;
        string tbMapa = txtMapa.Text;
        string tbEmail = txtEmail.Text;

        CoreUsuario core = new CoreUsuario();
        core.Core_BT_Editar_Info(tbNombre,tbMision,tbVision,tbQuienes,tbEslogan,tbTitulo1,tbTitulo2,tbTitulo3,
            tbTexto1,tbTexto2,tbTexto3,tbInfo,tbCiudad,tbDire,tbMapa,tbEmail);

        Response.Redirect("informacion.aspx");
    }
    protected void BT_Editar_tipo_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)((LinkButton)sender).NamingContainer;
        Label txtNombre = row.FindControl("ELB_Tipo") as Label;
        TextBox txtPrecio = row.FindControl("ETB_Precio") as TextBox;

        string tbNombre = txtNombre.Text;
        int tbPrecio = Convert.ToInt32(txtPrecio.Text);

        CoreUsuario core = new CoreUsuario();
        core.Core_BT_Editar_tipo_Info(tbNombre,tbPrecio);
        Response.Redirect("informacion.aspx");
    }
}