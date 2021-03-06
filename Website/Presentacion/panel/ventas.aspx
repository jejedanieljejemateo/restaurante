﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/panel/MasterPage3.master" AutoEventWireup="true" CodeFile="~/Logica/panel/ventas.aspx.cs" Inherits="Presentacion_panel_ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">

    <!-- page start-->

              <section class="panel">
                  
                  <header class="panel-heading">
                      Ventas
                  </header>
                  <div class="panel-body">
                      <div class="adv-table editable-table ">
                          <div class="clearfix">
                          </div>
                          <div class="space15"></div>
                          <br>
                          
                          <div class="table-responsive">
                              
            <asp:GridView ID="GV_Reservas" runat="server" DataSourceID="ObjectDataSource1" class="table table-striped table-hover table-bordered" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True">
                
                <Columns>
                <asp:TemplateField HeaderText="Nombre" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="LB_Nombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:Label ID="LB_Estado" runat="server" Text='<%# Bind("nombre_estado") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tipo" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:Label ID="LB_Tipo" runat="server" Text='<%# Bind("tipo1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="LB_Fecha" runat="server" Text='<%# Bind("fecha_final", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hora Inicio" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:Label ID="LB_Hora_Ini" runat="server" Text='<%# Bind("fecha_inicial", "{0:t}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hora Salida" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:Label ID="LB_Hora_Fin" runat="server" Text='<%# Eval("fecha_salida", "{0:t}")%>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Número de Personas" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:Label ID="LB_Personas" runat="server" Text='<%# Eval("numero_de_personas") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Precio Total" ItemStyle-Width="100px">
                    <ItemTemplate>
                        <asp:Label ID="LB_Precio" runat="server" Text='<%# Eval("precio_total")%>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="230px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="BT_Si_Asistio" OnClick="BT_Si_Asistio_Click" runat="server" CssClass="btn btn-shadow btn-info">Si Asistió</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="BT_No_Asistio" OnClick="BT_No_Asistio_Click" runat="server" CssClass="btn btn-shadow btn-danger">No Asistió</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

              <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrarReservas2" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>


                          </div>
                      </div>
                  </div>
                  
                  </section>
              
              <!-- page end-->

    </form>
</asp:Content>

