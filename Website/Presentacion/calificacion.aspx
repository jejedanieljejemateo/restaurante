<%@ Page Title="Calificación | Restaurante" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica/calificacion.aspx.cs" Inherits="Presentacion_calificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="abajo">
        <div class="service" id="services">
        <div class="container">
		    <h3 class="tittle">Calificación</h3>
			<div class="arrows-serve"><img src="images/border.png" alt="border"></div>


            <style type="text/css">
            table {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
                      line-height: 40px;
                      border-collapse: separate;
                      border-spacing: 0;
                      border: 2px solid #efa52c;
                      margin: 50px auto;
                      border-radius: .25rem;
            }
            th {                              
            text-align: center;                
            padding: 1em;
            background-color: #EFA52C;       
            color: white;       }                
 
            </style>
            <br /><br /><br />
            <div class="col-md-4 form-left"></div>
            <div class="col-md-4 form-right">
            <asp:DropDownList ID="DDL_Cal" runat="server" CssClass="form-control" EnableViewState="true" AutoPostBack="true">
                            <asp:ListItem Value="5">5 Estrellas</asp:ListItem>
                            <asp:ListItem Value="4">4 Estrellas</asp:ListItem>
                            <asp:ListItem Value="3">3 Estrellas</asp:ListItem>
                            <asp:ListItem Value="2">2 Estrellas</asp:ListItem>
                            <asp:ListItem Value="1">1 Estrella</asp:ListItem>
            </asp:DropDownList></div>

            <asp:GridView ID="GV_Calificar" runat="server" CssClass="EU_DataTable" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True">
                
                <EmptyDataTemplate>
                   ¡ Gracias por Calificar !
                    <br />
                    <asp:LinkButton ID="BT_Terminar" runat="server" OnClick="BT_Terminar_Click" Text="Terminar Calificación" ForeColor="Green" CssClass="btn-link" ></asp:LinkButton>
                </EmptyDataTemplate>
                <Columns>
                <asp:TemplateField HeaderText="Nombre del Plato" ItemStyle-Width="200px">
                    <EditItemTemplate>
                      
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_id" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                        <asp:Label ID="LB_Nombre" runat="server" Text='<%# Eval("nombre_plato") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="BT_Calificar" runat="server" OnClick="BT_Calificar_Click" Text="Calificar" ForeColor="Green" CssClass="btn-link" ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

            </div></div>
    </div>
</asp:Content>

