<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Presentacion/panel/MasterPage2.master" AutoEventWireup="true" CodeFile="~/Logica/panel/ingredientes.aspx.cs" Inherits="Presentacion_panel_ingredientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">

    <!-- page start-->

              <section class="panel">
                  
                  <header class="panel-heading">
                      Ingredientes
                  </header>
                  <div class="panel-body">
                      <div class="adv-table editable-table ">
                          <div class="clearfix">
                          </div>
                          <div class="space15"></div>
                          <br>
            
            <asp:DataList ID="DataList1" DataSourceID="ObjectDataSource2" runat="server" RepeatDirection="Vertical"  CssClass="container" RepeatColumns="1">
                <ItemTemplate>
                    <div class="alert alert-block alert-danger fade in" style="width:800px;">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="fa fa-times"></i>
                                  </button>
                                  <strong>Alerta de Inventario!</strong>
                                  <asp:Label ID="LB_Alerta" runat="server" Text='<%#String.Format("La cantidad actual de {0} ({1} {2}) es menor a la cantidad mínima ({3} {2}).",Eval("nombre"),Eval("cantidad"),Eval("unidad"),Eval("minimo")) %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="mostrarAlerta" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>

                          <div class="table-responsive">
                              
            <asp:GridView ID="GV_Ingredientes" runat="server" DataSourceID="ObjectDataSource1" class="table table-striped table-hover table-bordered" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True" ShowFooter="True">
                <EmptyDataTemplate>
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FTB_Nombre" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="FTB_Nombre" runat="server" MaxLength="30" CssClass="form-control small"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="FTB_Nombre" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Solo letras permitidas." ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="FTB_Descripcion" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="FTB_Descripcion" runat="server" MaxLength="300" CssClass="form-control small"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="FTB_Cantidad" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="FTB_Cantidad" runat="server" MaxLength="10" CssClass="form-control small"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="FTB_Cantidad" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="[0-9]*\,?[0-9]*"></asp:RegularExpressionValidator>
                    <asp:DropDownList ID="FDDL_Unidad" runat="server" CssClass="btn btn-primary dropdown-toggle btn-sm">
                            <asp:ListItem Value="libras">libras</asp:ListItem>
                            <asp:ListItem Value="litros">litros</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="FTB_Minimo" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="FTB_Minimo" runat="server" MaxLength="10" CssClass="form-control small"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="FTB_Minimo" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="[0-9]*\,?[0-9]*"></asp:RegularExpressionValidator>
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
                <asp:TemplateField HeaderText="Nombre" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="ETB_Nombre" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Nombre" runat="server" Text='<%# Bind("nombre") %>' MaxLength="30" CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator16" ControlToValidate="ETB_Nombre" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Solo letras permitidas." ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="FTB_Nombre" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="FTB_Nombre" runat="server" MaxLength="30" CssClass="form-control small"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="FTB_Nombre" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Solo letras permitidas." ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Nombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripción" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="ETB_Descripcion" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="ETB_Descripcion" runat="server" Text='<%# Bind("descripcion") %>' MaxLength="300" CssClass="form-control small"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="FTB_Descripcion" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="FTB_Descripcion" runat="server" MaxLength="300" CssClass="form-control small"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Descripcion" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="ETB_Cantidad" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Cantidad" runat="server" Text='<%# Bind("cantidad") %>' MaxLength="10" CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator19" ControlToValidate="ETB_Cantidad" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="[0-9]*\,?[0-9]*"></asp:RegularExpressionValidator>
                        <asp:DropDownList ID="DDL_Unidad" runat="server" CssClass="btn btn-primary dropdown-toggle btn-sm">
                            <asp:ListItem Value="libras">libras</asp:ListItem>
                            <asp:ListItem Value="litros">litros</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="FTB_Cantidad" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="FTB_Cantidad" runat="server" MaxLength="10" CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" ControlToValidate="FTB_Cantidad" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="[0-9]*\,?[0-9]*"></asp:RegularExpressionValidator>
                        <asp:DropDownList ID="FDDL_Unidad" runat="server" CssClass="btn btn-primary dropdown-toggle btn-sm">
                                <asp:ListItem Value="libras">libras</asp:ListItem>
                                <asp:ListItem Value="litros">litros</asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Cantidad" runat="server" Text='<%# Eval("cantidad") + " " + Eval("unidad")%>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mínimo" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="ETB_Minimo" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Minimo" runat="server" Text='<%# Bind("minimo") %>' CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator21" ControlToValidate="ETB_Minimo" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="[0-9]*\,?[0-9]*"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="FTB_Minimo" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="FTB_Minimo" runat="server" MaxLength="10" CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator14" ControlToValidate="FTB_Minimo" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="[0-9]*\,?[0-9]*"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Minimo" runat="server" Text='<%# Eval("minimo") + " " + Eval("unidad")%>' ></asp:Label>
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

              <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrarIngredientes" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>


                          </div>
                      </div>
                  </div>
                  
                  </section>
              
              <!-- page end-->

    </form>
</asp:Content>

