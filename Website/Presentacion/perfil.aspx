<%@ Page Title="Perfil | Restaurante" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica/perfil.aspx.cs" Inherits="Presentacion_perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- service-type-grid -->
    <div id="abajo">
	<div class="service" id="services">
		<div class="container">
		    <h3 class="tittle">¡ Bienvenido <%:Session["user"]%> !</h3>
			<div class="arrows-serve"><img src="images/border.png" alt="border"></div>
				<div class="inst-grids">
					<div class="col-md-3 services-gd text-center wow slideInLeft"  data-wow-duration="1s" data-wow-delay=".3s">
						<div class="hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
							<a href="reserva.aspx#abajo" class="hi-icon"><img src="images/serve2.png" alt=" " /></a>
						</div>
						<h4>Reservación</h4>
						 <p>Haz ya tu reservación.</p>
					</div>
					<div class="col-md-3 services-gd text-center wow slideInDown"  data-wow-duration="1s" data-wow-delay=".2s">
						<div class="hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
							<a href="menu.aspx#abajo" class="hi-icon"><img src="images/serve1.png" alt=" " /></a>
						</div>
						<h4>Menú</h4>
						 <p>Elige los platos que más te gusten.</p>
					</div>
					<div class="col-md-3 services-gd text-center wow slideInRight"  data-wow-duration="1s" data-wow-delay=".3s">
						<div class="hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
							<a href="opciones.aspx#abajo" class="hi-icon"><img src="images/serve3.png" alt=" " /></a>
						</div>
						<h4>Opciones</h4>
						 <p>Mira el estado de la reserva.</p>
					</div>
                    <div class="col-md-3 services-gd text-center wow slideInUp"  data-wow-duration="1s" data-wow-delay=".2s">
						<div class="hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
							<a href="calificacion.aspx#abajo" class="hi-icon"><img src="images/serve4.png" alt=" " /></a>
						</div>
						<h4>Puntuación</h4>
						 <p>Califica tu experiencia.&nbsp;
                             <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;
                             <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </p>
					</div>
					<div class="clearfix"> </div>		
                    
				</div>

		</div>
	</div>
    </div>
<!-- //service-type-grid -->

</asp:Content>

