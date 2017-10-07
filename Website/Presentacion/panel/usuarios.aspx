<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/panel/MasterPage3.master" AutoEventWireup="true" CodeFile="~/Logica/panel/usuarios.aspx.cs" Inherits="Presentacion_panel_usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">

    <!-- page start-->

              <section class="panel">
                  
                  <header class="panel-heading">
                      Usuarios Bloqueados
                  </header>
                  <div class="panel-body">
                      <div class="adv-table editable-table ">
                          <div class="clearfix">
                          </div>
                          <div class="space15"></div>
                          <br>
                          
                          <div class="table-responsive">
                              
            <asp:GridView ID="GV_Usuarios" runat="server" DataSourceID="ObjectDataSource1" class="table table-striped table-hover table-bordered" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True">
                
                <Columns>
                <asp:TemplateField HeaderText="ID" ItemStyle-Width="30px">
                    <ItemTemplate>
                        <asp:Label ID="LB_id" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="LB_Nombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="230px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="BT_Desbloquear" OnClick="BT_Desbloquear_Click" runat="server" CssClass="btn btn-shadow btn-info">Desbloquear Usuario</asp:LinkButton>
                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

              <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrarUsuarios" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>


                          </div>
                      </div>
                  </div>
                  
                  </section>
              
              <!-- page end-->

    </form>
</asp:Content>

