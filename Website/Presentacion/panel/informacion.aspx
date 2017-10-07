<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Presentacion/panel/MasterPage2.master" AutoEventWireup="true" CodeFile="~/Logica/panel/informacion.aspx.cs" Inherits="Presentacion_panel_informacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">

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
                      Información del Restaurante
                  </header>
                  <div class="panel-body">
                      <div class="adv-table editable-table ">
                          <div class="clearfix">
                              
                          </div>
                          <div class="space15"></div>
                          <br>
                          
                          <div class="table-responsive">
                              
            <asp:GridView ID="GV_Info" runat="server" DataSourceID="ObjectDataSource1" class="table table-striped table-hover table-bordered" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True">
                <Columns>
                <asp:TemplateField HeaderText="Nombre y Eslogan" ItemStyle-Width="100px">
                    <EditItemTemplate>
                        <b>Nombre:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ETB_Nombre" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Nombre" runat="server" MaxLength="30" Text='<%# Bind("nombre_restaurante") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Eslogan:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ETB_Eslogan" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Eslogan" runat="server" MaxLength="30" Text='<%# Bind("eslogan") %>' CssClass="form-control small"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <b>Nombre:</b><br />
                        <asp:Label ID="LB_Nombre" runat="server" Text='<%# Bind("nombre_restaurante") %>'></asp:Label>
                        <br /><br />
                        <b>Eslogan:</b><br />
                        <asp:Label ID="LB_Eslogan" runat="server" Text='<%# Bind("eslogan") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sobre Nosotros" ItemStyle-Width="200px">
                    <EditItemTemplate>
                        <b>Quiénes Somos:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ETB_Quienes" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Quienes" onpaste="return false" TextMode="MultiLine" onkeyDown="checkTextAreaMaxLength(this,event,'499');" runat="server" MaxLength="499" Text='<%# Bind("quienes") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Misión:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="ETB_Mision" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Mision" onpaste="return false" TextMode="MultiLine" onkeyDown="checkTextAreaMaxLength(this,event,'499');" runat="server" MaxLength="499" Text='<%# Bind("mision") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Visión:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="ETB_Vision" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Vision" onpaste="return false" TextMode="MultiLine" onkeyDown="checkTextAreaMaxLength(this,event,'499');" runat="server" MaxLength="499" Text='<%# Bind("vision") %>' CssClass="form-control small"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        
                    </FooterTemplate>
                    <ItemTemplate>
                        <b>Quiénes Somos:</b><br />
                        <asp:Label ID="LB_Quienes" runat="server" Text='<%# Bind("quienes") %>' ></asp:Label>
                        <br /><br />
                        <b>Misión:</b><br />
                        <asp:Label ID="LB_Mision" runat="server" Text='<%# Bind("mision") %>' ></asp:Label>
                        <br /><br />
                        <b>Visión:</b><br />
                        <asp:Label ID="LB_Vision" runat="server" Text='<%# Bind("vision") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Encabezados" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <b>Título 1:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="ETB_Titulo1" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Titulo1" runat="server" MaxLength="30" Text='<%# Bind("titulo1") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Texto 1:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="ETB_Texto1" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Texto1" runat="server" MaxLength="30" Text='<%# Bind("texto1") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Título 2:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="ETB_Titulo2" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Titulo2" runat="server" MaxLength="30" Text='<%# Bind("titulo2") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Texto 2:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="ETB_Texto2" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Texto2" runat="server" MaxLength="30" Text='<%# Bind("texto2") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Título 3:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="ETB_Titulo3" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Titulo3" runat="server" MaxLength="30" Text='<%# Bind("titulo3") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Texto 3:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="ETB_Texto3" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Texto3" runat="server" MaxLength="30" Text='<%# Bind("texto3") %>' CssClass="form-control small"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        
                    </FooterTemplate>
                    <ItemTemplate>
                        <b>Encabezado 1:</b><br />
                        <asp:Label ID="LB_Titulo1" runat="server" Text='<%# Bind("titulo1") %>' ></asp:Label>
                        <br />
                        <asp:Label ID="LB_Texto1" runat="server" Text='<%# Bind("texto1") %>' ></asp:Label>
                        <br />
                        <br />
                        <b>Encabezado 2:</b><br />
                        <asp:Label ID="LB_Titulo2" runat="server" Text='<%# Bind("titulo2") %>' ></asp:Label>
                        <br />
                        <asp:Label ID="LB_Texto2" runat="server" Text='<%# Bind("texto2") %>' ></asp:Label>
                        <br />
                        <br />
                        <b>Encabezado 3:</b><br />
                        <asp:Label ID="LB_Titulo3" runat="server" Text='<%# Bind("titulo3") %>' ></asp:Label>
                        <br />
                        <asp:Label ID="LB_Texto3" runat="server" Text='<%# Bind("texto3") %>' ></asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contacto" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <b>Info. Ubicación:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ControlToValidate="ETB_Info" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Info" runat="server" MaxLength="499" Text='<%# Bind("info_ubicacion") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Ciudad:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ControlToValidate="ETB_Ciudad" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Ciudad" runat="server" MaxLength="30" Text='<%# Bind("ciudad") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Dirección:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ControlToValidate="ETB_Direccion" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Direccion" runat="server" MaxLength="499" Text='<%# Bind("direccion") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Mapa:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" ControlToValidate="ETB_Mapa" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Mapa" runat="server" MaxLength="499" Text='<%# Bind("mapa") %>' CssClass="form-control small"></asp:TextBox>
                        <br />
                        <b>Correo Electrónico:</b><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ControlToValidate="ETB_Email" ValidationGroup="VG_Editar" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ETB_Email" runat="server" MaxLength="30" Text='<%# Bind("email") %>' CssClass="form-control small"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <b>Info. Ubicación:</b><br />
                        <asp:Label ID="LB_Info" runat="server" Text='<%# Bind("info_ubicacion") %>'></asp:Label>
                        <br /><br />
                        <b>Ciudad:</b><br />
                        <asp:Label ID="LB_Ciudad" runat="server" Text='<%# Bind("ciudad") %>' ></asp:Label>
                        <br /><br />
                        <b>Dirección:</b><br />
                        <asp:Label ID="LB_Direccion" runat="server" Text='<%# Bind("direccion") %>' ></asp:Label>
                        <br /><br />
                        <b>Mapa:</b><br />
                        <asp:Label ID="LB_Mapa" Width="10" runat="server" Text='<%# Bind("mapa") %>' ></asp:Label>
                        <br /><br />
                        <b>Correo Electrónico:</b><br />
                        <asp:Label ID="LB_Email" runat="server" Text='<%# Bind("email") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:LinkButton ID="BT_Editar" runat="server" ValidationGroup="VG_Editar" CssClass="btn btn-shadow btn-success" OnClick="BT_Editar_Click"><i class="fa fa-check"></i>&nbsp;Aceptar</asp:LinkButton>
                        <br /><br />
                        <asp:LinkButton ID="BT_Cancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-shadow btn-danger"><i class="fa fa-times"></i>&nbsp;Cancelar</asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>

                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="BT_Editar1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-shadow btn-info"><i class="fa fa-pencil"></i>&nbsp;Editar</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

              <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrarInfo" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>
                              <br /><br />

        <asp:GridView ID="GV_Tipo" runat="server" DataSourceID="ObjectDataSource2" class="table table-striped table-hover table-bordered" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True">
                <Columns>
                <asp:TemplateField HeaderText="Tipo Venta" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:Label ID="ELB_Tipo" runat="server" Text='<%# Bind("nombre") %>' ></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Tipo" runat="server" Text='<%# Bind("nombre") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Precio" ItemStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator44" ControlToValidate="ETB_Precio" runat="server" ErrorMessage="Solo números permitidos." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="ETB_Precio" MaxLength="10" CssClass="form-control small" runat="server" Text='<%# Bind("precio") %>' ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator254" ControlToValidate="ETB_Precio" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LB_Precio" runat="server" Text='<%# Bind("precio") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:LinkButton ID="BT_Editar_tipo" runat="server" CssClass="btn btn-shadow btn-success" OnClick="BT_Editar_tipo_Click"><i class="fa fa-check"></i>&nbsp;Aceptar</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="BT_Cancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-shadow btn-danger"><i class="fa fa-times"></i>&nbsp;Cancelar</asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="BT_Editar_tipo1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-shadow btn-info"><i class="fa fa-pencil"></i>&nbsp;Editar</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

              <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="mostrarTipo" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>
                              <br /><br />
                          </div>
                      </div>
                  </div>
                  
                  </section>
              
              <!-- page end-->

    </form>
</asp:Content>

