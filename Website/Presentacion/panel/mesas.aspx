<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/panel/MasterPage2.master" AutoEventWireup="true" CodeFile="~/Logica/panel/mesas.aspx.cs" Inherits="Presentacion_panel_mesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">

    <!-- page start-->

              <section class="panel">
                  
                  <header class="panel-heading">
                      Mesas
                  </header>
                  <div class="panel-body">
                      <div class="adv-table editable-table ">
                          <div class="clearfix">
                          </div>
                          <div class="space15"></div>
                          <br>
                          
                          <div class="table-responsive">
                              
            <asp:GridView ID="GV_Mesas" runat="server" DataSourceID="ObjectDataSource1" class="table table-striped table-hover table-bordered" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True" ShowFooter="True">
                <EmptyDataTemplate>
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="FTB_Sillas" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="FTB_Sillas" runat="server" MaxLength="10" CssClass="form-control small"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="FTB_Sillas" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                </td>
                <td>
                    
                </td>
                <td>
                    <br />
                    <div style="margin-left: auto; margin-right: auto; text-align: center;">
                    <asp:LinkButton ID="BT_Insertar" runat="server" OnClick="BT_Insertar_Click" ValidationGroup="VG_Footer1" CssClass="btn btn-shadow btn-success"><i class="fa fa-plus"></i>&nbsp;Insertar</asp:LinkButton>
                    </div>
                </td>
            </tr>
        </EmptyDataTemplate>
                <Columns>
                <asp:TemplateField HeaderText="ID" ItemStyle-Width="30px">
                    <EditItemTemplate>
                        <asp:Label ID="ELB_id" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_id" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sillas" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="ETB_Sillas" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Sillas" runat="server" Text='<%# Bind("sillas") %>' MaxLength="10" CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator19" ControlToValidate="ETB_Sillas" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="FTB_Sillas" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="FTB_Sillas" runat="server" MaxLength="10" CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" ControlToValidate="FTB_Sillas" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Sillas" runat="server" Text='<%# Bind("sillas") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado Mesa" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:Label ID="LB_Estado" runat="server" Text='<%# Bind("estado_mesa") %>' ></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Estado" runat="server" Text='<%# Bind("estado_mesa") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="230px" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:LinkButton ID="BT_Editar" runat="server" ValidationGroup="VG_Editar" CssClass="btn btn-shadow btn-success" OnClick="BT_Editar_Click"><i class="fa fa-check"></i>&nbsp;Aceptar</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="BT_Cancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-shadow btn-danger"><i class="fa fa-times"></i>&nbsp;Cancelar</asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <br />
                        <div style="margin-left: auto; margin-right: auto; text-align: center;">
                        <asp:LinkButton ID="BT_Insertar" runat="server" ValidationGroup="VG_Footer2" CssClass="btn btn-shadow btn-success" OnClick="BT_Insertar_Click"><i class="fa fa-plus"></i>&nbsp;Insertar</asp:LinkButton>
                        </div>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="BT_Editar1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-shadow btn-info"><i class="fa fa-pencil"></i>&nbsp;Editar</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="BT_Borrar" runat="server" CssClass="btn btn-shadow btn-danger" OnClick="BT_Borrar_Click"><i class="fa fa-times-circle"></i>&nbsp;Borrar</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

              <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrarMesas" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>


                          </div>
                      </div>
                  </div>
                  
                  </section>
              
              <!-- page end-->

    </form>
</asp:Content>

