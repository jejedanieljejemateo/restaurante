<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Presentacion/panel/MasterPage2.master" AutoEventWireup="true" CodeFile="~/Logica/panel/menu.aspx.cs" Inherits="Presentacion_panel_menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">

    <style type="text/css">
        .file-upload {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            box-shadow: 0 4px #e27709;
        }

        .file-upload:hover {
            color: #fff;
            background-color: #f18500;
        }

        /* The button size */
        .file-upload {
            width: 150px;
            height: 35px;
            background-color: #ef8f19;
            color: #fff;
        }

        .file-upload, .file-upload span {
            display: inline-block;
            font-family: FontAwesome;
            font-style: normal;
            font-weight: normal;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
        }

        .file-upload input {
                    top: 0;
                    left: 0;
                    margin: 0;
                    font-size: 11px;
                    font-weight: bold;
                    /* Loses tab index in webkit if width is set to 0 */
                    opacity: 0;
                    filter: alpha(opacity=0);
        }

        .file-upload strong {
                    display: inline-block;
            font-family: Arial;
            font-style: normal;
            font-weight: normal;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
        }

        .file-upload span {
                    top: 0;
                    left: 0;
                    display: inline-block;
                    /* Adjust button text vertical alignment */
                    padding-top: 5px;
        }
     </style>

    <!-- page start-->

        <script>
            function checkTextAreaMaxLength(textBox, e, length) {

                var mLen = textBox["MaxLength"];
                if (null == mLen)
                    mLen = length;

                var maxLength = parseInt(mLen);
                if (!checkSpecialKeys(e)) {
                    if (textBox.value.length > maxLength - 1) {
                        if (window.event)//IE
                            e.returnValue = false;
                        else//Firefox
                            e.preventDefault();
                    }
                }
            }
            function checkSpecialKeys(e) {
                if (e.keyCode != 8 && e.keyCode != 46 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40)
                    return false;
                else
                    return true;
            }
    </script>

              <section class="panel">
                  
                  <header class="panel-heading">
                      Menú
                  </header>
                  <div class="panel-body">
                      <div class="adv-table editable-table ">
                          <div class="clearfix">
                          </div>
                          <div class="space15"></div>
                          <br>
                          
                          <div class="table-responsive">
                              
            <asp:GridView ID="GV_Platos" runat="server" DataSourceID="ObjectDataSource1" class="table table-striped table-hover table-bordered" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True" ShowFooter="True">
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="FTB_Precio" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="FTB_Precio" runat="server" MaxLength="6" CssClass="form-control small"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="FTB_Precio" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="FTB_Descripcion" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="FTB_Descripcion" onpaste="return false" onkeyDown="checkTextAreaMaxLength(this,event,'499');" TextMode="MultiLine" runat="server" MaxLength="300" CssClass="form-control small"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="FU_Imagen" ValidationGroup="VG_Footer1" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:FileUpload ID="FU_Imagen" runat="server"/>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="ETB_Nombre" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Nombre" runat="server" MaxLength="30" Text='<%# Bind("nombre") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="ETB_Nombre" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Solo letras permitidas." ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FTB_Nombre" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="FTB_Nombre" runat="server" MaxLength="30" CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="FTB_Nombre" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Solo letras permitidas." ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Nombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Precio" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="ETB_Precio" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Precio" runat="server" MaxLength="6" Text='<%# Bind("precio") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ControlToValidate="ETB_Precio" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="FTB_Precio" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="FTB_Precio" runat="server" MaxLength="6" CssClass="form-control small"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="FTB_Precio" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <i class="fa fa-usd"></i>&nbsp;<asp:Label ID="LB_Precio" runat="server" Text='<%# Bind("precio") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descripción" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="ETB_Descripcion" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Descripcion" onpaste="return false" onkeyDown="checkTextAreaMaxLength(this,event,'499');" TextMode="MultiLine" runat="server" MaxLength="300" Text='<%# Bind("descripcion") %>' CssClass="form-control small"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="FTB_Descripcion" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="FTB_Descripcion" onpaste="return false" onkeyDown="checkTextAreaMaxLength(this,event,'499');" TextMode="MultiLine" runat="server" MaxLength="300" CssClass="form-control small"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Descripcion" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Imagen" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:Label ID="ELB_Imagen" runat="server" Text='<%# Bind("url_imagen") %>' Visible="false"></asp:Label>
                        <br />
                            <label class="file-upload">
                                <i class="fa fa-camera"></i>
                                <span><strong>&nbsp;Cargar Imagen</strong></span>
                        <asp:FileUpload ID="EFU_Imagen" runat="server"/>
                                <br />
                            </label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <div style="margin-left: auto; margin-right: auto; text-align: center;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="FU_Imagen" ValidationGroup="VG_Footer2" runat="server" ErrorMessage="No ha cargado la imagen." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                            <label class="file-upload">
                                <i class="fa fa-camera"></i>
                                <span><strong>&nbsp;Cargar Imagen</strong></span>
                        <asp:FileUpload ID="FU_Imagen" runat="server"/>
                                <br />
                            </label>
                        </div>
                    </FooterTemplate>
                    <ItemTemplate>
                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                              <asp:Image ID="Image1" runat="server" ImageUrl=<%# string.Format("~/Presentacion/images/platos/{0}",Eval("url_imagen"))%> />
                        <asp:Label ID="LB_Imagen" runat="server" Text='<%# Bind("url_imagen") %>' ></asp:Label>
                        </div>
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
                        <br />
                        <br />
                        <asp:LinkButton ID="BT_Ingredientes" runat="server" CssClass="btn btn-shadow btn-warning" OnClick="BT_Ingredientes_Click"><i class="fa fa-glass"></i>&nbsp;Añadir Ingredientes</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

              <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrarPlatos" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>


                          </div>
                      </div>
                  </div>
                  
                  </section>
              
              <!-- page end-->

    </form>

</asp:Content>

