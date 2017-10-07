using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Logica;

public partial class Presentacion_ReporteReserva : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        CoreUsuario core = new CoreUsuario();
        object user = Session["user"];
        string redirect = core.PageloadAutenticar(user);
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

        personaInformacion = datos.Tables["reserva"];

        CoreReserva core = new CoreReserva();
        core.Core_Obtener_Informe_Reserva(fila,personaInformacion);

        return datos;
    }
}