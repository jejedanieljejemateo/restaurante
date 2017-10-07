<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/panel/MasterPage2.master" AutoEventWireup="true" CodeFile="~/Logica/panel/ReporteVentas.aspx.cs" Inherits="Presentacion_panel_ReporteVentas" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <div class="service" id="services">
        <div class="container">
    <div>
        <br />
        <CR:CrystalReportViewer ID="CRV_Reporte1" runat="server" AutoDataBind="true" ReportSourceID="CRS_Reporte1" HasRefreshButton="True" ToolPanelView="None" />
    
    </div>
        <CR:CrystalReportSource ID="CRS_Reporte1" runat="server">
            <Report FileName="~/Reportes/ReporteVentas.rpt">
            </Report>
        </CR:CrystalReportSource>
            </div></div>
    </form>
</asp:Content>

