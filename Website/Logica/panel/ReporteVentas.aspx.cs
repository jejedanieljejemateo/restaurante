using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_panel_ReporteVentas : System.Web.UI.Page
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
        PoblarReporte();
    }
    protected void PoblarReporte()
    {
        try
        {
            Reportes reporte = ObtenerInforme();
            CRS_Reporte1.ReportDocument.SetDataSource(reporte);
            CRV_Reporte1.ReportSource = CRS_Reporte1;
        }
        catch (Exception)
        {

            throw;
        }
    }

    protected Reportes ObtenerInforme()
    {
        DataRow fila;  //dr
        fila = null;
        DataTable personaInformacion = new DataTable(); //dt
        Reportes datos = new Reportes();

        personaInformacion = datos.Tables["ventas"];

        CoreUsuario core = new CoreUsuario();
        core.Core_Obtener_Informe_Ventas(fila, personaInformacion);

        return datos;
    }
}