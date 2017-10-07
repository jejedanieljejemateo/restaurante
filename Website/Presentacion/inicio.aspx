<%@ Page Title="Inicio | Restaurante" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica/inicio.aspx.cs" Inherits="inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="about" id="about">
		     <div class="container">
			 <!--/about-section-->
			   <div class="about-section">
				<div class="col-md-7 ab-left">
				  <div class="grid">

    <asp:Repeater ID="repeater" DataSourceID="ObjectDataSource1" runat="server">
        <ItemTemplate>
           
            <div class="h-f wow slideInLeft"  data-wow-duration="1s" data-wow-delay=".2s">
					<figure class="effect-jazz">
					 <asp:Image ID="Imagen" runat="server" ImageUrl='<%# "~/Presentacion/images/platos/" + Eval("url_imagen") %>' Height="350" Width="311"/>
						<figcaption>
							<h4><span><asp:Label ID="LB_Nombre" runat="server" Text='<%# Bind("nombre") %>'/></span></h4>
                            <p>Puntuación:&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("calificacion", "{0:0.0}") %>'/></p>
							<a href="menu.aspx#abajo" class="hvr-bounce-to-bottom">Ver el Menú</a>
						</figcaption>
					</figure>
			</div>

        </ItemTemplate>
    </asp:Repeater>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="mostrarPlato1" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>

				 <div class="clearfix"> </div>
				 </div>
			   </div>
			   <div class="col-md-5 ab-text">
			             <h3 class="tittle wow slideInDown"  data-wow-duration="1s" data-wow-delay=".3s">Bienvenidos</h3>
						  <div class="arrows-two wow slideInDown"  data-wow-duration="1s" data-wow-delay=".5s"><img src="images/border.png" alt="border"/></div>
						  <p class="wow slideInUp"  data-wow-duration="1s" data-wow-delay=".3s"><%:Session["quienes"]%></p>
						  <div class="start wow flipInX"  data-wow-duration="1s" data-wow-delay=".3s">
						     <a href="sobre.aspx#abajo" class="hvr-bounce-to-bottom">Sobre Nosotros</a>
						  </div>

					</div>
					<div class="clearfix"> </div>
			 </div>
			  <!--//about-section-->
			  <!--/about-section2-->
			   <div class="about-section">
			        <div class="col-md-5 ab-text two">
			             <h3 class="tittle wow slideInDown"  data-wow-duration="1s" data-wow-delay=".3s"><%:Session["nombreRest"]%></h3>
						 <div class="arrows-two wow slideInDown"  data-wow-duration="1s" data-wow-delay=".5s"><img src="images/border.png" alt="border"/></div>
						  <p class="wow slideInUp"  data-wow-duration="1s" data-wow-delay=".3s"><%:Session["eslogan"]%></p>
						 <div class="start wow flipInX"  data-wow-duration="1s" data-wow-delay=".3s">
						     <a href="reserva.aspx#abajo" class="hvr-bounce-to-bottom">Hacer Reserva</a>
						  </div>

					</div>
						<div class="col-md-7 ab-left">
				  <div class="grid">
			        
    <asp:Repeater ID="repeater1" DataSourceID="ObjectDataSource2" runat="server">
        <ItemTemplate>
           
            <div class="h-f wow slideInLeft"  data-wow-duration="1s" data-wow-delay=".2s">
					<figure class="effect-jazz">
					 <asp:Image ID="Imagen" runat="server" ImageUrl='<%# "~/Presentacion/images/platos/" + Eval("url_imagen") %>' Height="350" Width="311"/>
						<figcaption>
							<h4><span><asp:Label ID="LB_Nombre" runat="server" Text='<%# Bind("nombre") %>'/></span></h4>
                            <p>Puntuación:&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("calificacion", "{0:0.0}") %>'/></p>
							<a href="menu.aspx#abajo" class="hvr-bounce-to-bottom">Ver el Menú</a>
						</figcaption>
					</figure>
			</div>

        </ItemTemplate>
    </asp:Repeater>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="mostrarPlato2" TypeName="Data.DAOUsuario"></asp:ObjectDataSource>

				 <div class="clearfix"> </div>
				 </div>
			   </div>
					<div class="clearfix"> </div>
			 </div>
			  <!--//about-section2-->
			</div>
        </div>
</asp:Content>

