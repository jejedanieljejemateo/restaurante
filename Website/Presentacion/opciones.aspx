<%@ Page Title="Opciones Reserva | Restaurante" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica/opciones.aspx.cs" Inherits="Presentacion_opciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <style type="text/css">
                * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        body {
          font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
          color: #333;
        }

        table {
          text-align: left;
          line-height: 40px;
          border-collapse: separate;
          border-spacing: 0;
          border: 2px solid #efa52c;
          margin: 50px auto;
          border-radius: .25rem;
        }

        thead tr:first-child {
          background: #efa52c;
          color: #fff;
          border: none;
        }

        th:first-child,
        td:first-child {
          padding: 0 15px 0 20px;
        }

        thead tr:last-child th {
          border-bottom: 3px solid #ddd;
        }

        tbody tr:hover {
          background-color: rgba(80, 80, 80, .1);
          cursor: default;
        }

        tbody tr:last-child td {
          border: none;
        }

        tbody td {
          border-bottom: 1px solid #ddd;
        }

        td:last-child {
          text-align: right;
          padding-right: 10px;
        }

        .button {
          color: #aaa;
          cursor: pointer;
          vertical-align: middle;
        }

        .edit:hover {
          color: #0a79df;
        }

        .delete:hover {
          color: #dc2a2a;
        }
    </style>

    <div id="abajo">
        <div class="service" id="services">
        <div class="container">
		    <h3 class="tittle">Opciones</h3>
			<div class="arrows-serve"><img src="images/border.png" alt="border"></div>

         <asp:Repeater ID="Repeater1" runat="server">
          <HeaderTemplate>
              <asp:Label ID="LB_id" runat="server" Text='<%# Bind("user_id") %>' Visible="false"></asp:Label>
              <table>
              <thead>
            <tr>
              <th colspan="5">Reserva</th>
            </tr>
            <tr>
              <th>N° Personas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
              <th>Fecha&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
              <th>Hora&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
              <th>Precio Total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
          </HeaderTemplate>

          <ItemTemplate>
          <tr>
              <td><asp:Label ID="LB_Cantidad" runat="server" Text='<%# Bind("cant_personas") %>'></asp:Label></td>
              <td><asp:Label ID="LB_Fecha" runat="server" Text='<%# Bind("fecha", "{0:dd/MM/yyyy}") %>'></asp:Label></td>
              <td><asp:Label ID="LB_Hora" runat="server" Text='<%# Bind("h_ini", "{0:t}") %>'></asp:Label></td>
              <td>$&nbsp;<asp:Label ID="LB_Precio" runat="server" Text='<%# Bind("precio_total") %>' ></asp:Label></td>
              <td>
                <!--<i class="material-icons button edit">edit</i>
                <i class="material-icons button delete">delete</i>-->
                <asp:LinkButton ID="BT_Imprimir" runat="server" CssClass="material-icons button edit" PostBackUrl="~/Presentacion/ReporteReserva.aspx" Text="Imprimir" ></asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="BT_Eliminar_Reserva" runat="server" OnClick="BT_Eliminar_Reserva_Click" CssClass="material-icons button delete" Text="Eliminar" ></asp:LinkButton>
              </td>
            </tr>
          </ItemTemplate>

          <AlternatingItemTemplate>
          </AlternatingItemTemplate>

          <FooterTemplate>
              </tbody>
              </table>
          </FooterTemplate>
      </asp:Repeater>

            <asp:Repeater ID="Repeater2" runat="server">
          <HeaderTemplate>
              
              <table>
              <thead>
            <tr>
              <th colspan="5">Platos</th>
            </tr>
            <tr>
              <th>Nombre del Plato&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
              <th>Precio Unitario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
              <th>Cantidad&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
              <th>Precio Total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
          </HeaderTemplate>

          <ItemTemplate>
          <tr>
              <td>
                  <asp:Label ID="LB_id" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                  <asp:Label ID="LB_Nombre" runat="server" Text='<%# Eval("nombre_plato") %>'></asp:Label>
              </td>
              <td>$&nbsp;<asp:Label ID="LB_precio_unit" runat="server" Text='<%# Eval("precio_unit") %>'></asp:Label></td>
              <td><asp:Label ID="LB_Cantidad" runat="server" Text='<%# Eval("cantidad") %>'></asp:Label></td>
              <td>$&nbsp;<asp:Label ID="LB_precio_total" runat="server" Text='<%# Eval("precio_total") %>' ></asp:Label></td>
              <td>
                <asp:LinkButton ID="BT_Eliminar" runat="server" OnClick="BT_Eliminar_Click" CssClass="material-icons button delete" Text="Eliminar" ></asp:LinkButton>
                  &nbsp;&nbsp;&nbsp;&nbsp;
              </td>
            </tr>
          </ItemTemplate>

          <AlternatingItemTemplate>
              <tr>
              <td>
                  <asp:Label ID="LB_id" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                  <asp:Label ID="LB_Nombre" runat="server" Text='<%# Eval("nombre_plato") %>'></asp:Label>
              </td>
              <td>$&nbsp;<asp:Label ID="LB_precio_unit" runat="server" Text='<%# Eval("precio_unit") %>'></asp:Label></td>
              <td><asp:Label ID="LB_Cantidad" runat="server" Text='<%# Eval("cantidad") %>'></asp:Label></td>
              <td>$&nbsp;<asp:Label ID="LB_precio_total" runat="server" Text='<%# Eval("precio_total") %>' ></asp:Label></td>
              <td>
                <asp:LinkButton ID="BT_Eliminar" runat="server" OnClick="BT_Eliminar_Click" CssClass="material-icons button delete" Text="Eliminar" ></asp:LinkButton>
                  &nbsp;&nbsp;&nbsp;&nbsp;
              </td>
            </tr>
          </AlternatingItemTemplate>

          <FooterTemplate>
              </tbody>
              </table>
          </FooterTemplate>
      </asp:Repeater>

            <div class="start wow flipInX"  data-wow-duration="1s" data-wow-delay=".3s">
				<a href="menu.aspx#abajo" class="hvr-bounce-to-bottom">Agregar Platos</a>
			</div>

            </div></div>
        </div>
</asp:Content>

