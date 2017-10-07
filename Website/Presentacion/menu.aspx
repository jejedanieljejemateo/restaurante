<%@ Page Title="Menú | Restaurante" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica/menu.aspx.cs" Inherits="Presentacion_menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!--Gallery-->
<div id="abajo">
<div class="gallery" id="gallery">
	<div class="container">
		<h3 class="tittle">Menú</h3>
		<div class="arrows-serve"><img src="images/border.png" alt="border"/></div>

        <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" CssClass="container" RepeatDirection="Horizontal" RepeatColumns="2" >
        <ItemTemplate>
            
            <div class="gallery-grids">
					<div class="col-md-6 baner-top wow fadeInRight animated" data-wow-delay=".5s">
                        <a style="width: 540px;" class="b-link-stripe b-animate-go">
							<div class="gal-spin-effect vertical" >
                                
            <asp:Image ID="Imagen" runat="server" ImageUrl='<%# "~/Presentacion/images/platos/" + Eval("url_imagen") %>' Height="345px" Width="535px"/>

                                <div class="gal-text-box">
									<div class="info-gal-con">
                                        <asp:Label ID="LB_id" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                                        <h4><asp:Label ID="LB_Nombre" runat="server" Text='<%# Bind("nombre") %>'></asp:Label></h4>
                                        <span class="separator"></span>
                                        <p><asp:Label ID="LB_Descripcion" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label></p>
										<span class="separator"></span>
                                        <h4>$ <asp:Label ID="LB_Precio" runat="server" Text='<%# Bind("precio") %>'></asp:Label></h4>

                                        <div class="make wow shake" data-wow-duration="1s" data-wow-delay="1s">
                                        <asp:Button ID="BT_Agregar" runat="server" Text="Agregar a la reserva" OnClick="BT_Agregar_Click" />
                   						</div>
                                    
                                        </div></div>

                                

                                </div></a></div></div>
                    <br></br>
        </ItemTemplate>
    </asp:DataList>

				<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrarPlatos" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>

				
					<div class="clearfix"> </div>
			</div>
	</div>
    </div>

<!-- //gallery -->

</asp:Content>

