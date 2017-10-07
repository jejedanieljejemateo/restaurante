<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/panel/MasterPage2.master" AutoEventWireup="true" CodeFile="~/Logica/panel/plato.aspx.cs" Inherits="Presentacion_panel_plato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">

    <!-- page start-->

              <section class="panel">
                  
                  <header class="panel-heading">
                      Agregar Ingredientes a <%:Session["platoNombre"]%>
                  </header>
                  <div class="panel-body">
                      <div class="adv-table editable-table ">
                          <div class="clearfix">
                          </div>
                          <div class="space15"></div>
                          <br>

                          <div class="table-responsive">

                     <table>
                        <tr>
                            <td>
                                <asp:DropDownList ID="FDDL2_Ingrediente" runat="server" CssClass="btn btn-primary dropdown-toggle btn-sm"></asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator112" ControlToValidate="FTB2_Cantidad" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox Width="180" ID="FTB2_Cantidad" runat="server" MaxLength="10" CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator122" ControlToValidate="FTB2_Cantidad" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="[0-9]*\,?[0-9]*"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:LinkButton ID="BT_Insertar" runat="server" ValidationGroup="VG_Footer2" CssClass="btn btn-shadow btn-success" OnClick="BT_Insertar_Click"><i class="fa fa-plus"></i>&nbsp;Insertar</asp:LinkButton>
                            </td>
                        </tr>
                     </table>
                          
            <asp:GridView ID="GV_Plato" runat="server" class="table table-striped table-hover table-bordered" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True">
                
                <Columns>
                <asp:TemplateField HeaderText="ID" ItemStyle-Width="30px">
                    
                    <ItemTemplate>
                        <asp:Label ID="LB_id" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ingrediente" ItemStyle-Width="150px">
                    
                    <ItemTemplate>
                        <asp:Label ID="LB_Ingrediente" runat="server" Text='<%# Bind("nombre_plato") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad" ItemStyle-Width="150px">
                  
                    <ItemTemplate>
                        <asp:Label ID="LB_Cantidad" runat="server" Text='<%# Eval("cantidad") + " " + Eval("unidad")%>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Center">
                    
                    <ItemTemplate>
                        
                        <asp:LinkButton ID="BT_Borrar" runat="server" CssClass="btn btn-shadow btn-danger" OnClick="BT_Borrar_Click"><i class="fa fa-times-circle"></i>&nbsp;Borrar</asp:LinkButton>
                    
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

                          </div>
                      </div>
                  </div>
                  
                  </section>
              
              <!-- page end-->

    </form>
</asp:Content>

