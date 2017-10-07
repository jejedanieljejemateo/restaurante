<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Logica/reserva.aspx.cs" Inherits="Presentacion_reserva" EnableViewState="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservación | Restaurante</title>

    <script type="applisalonion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/iconeffects.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />	
<link rel="stylesheet" href="css/swipebox.css">
<script src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<!--/web-font-->
	<link href='//fonts.googleapis.com/css?family=Italianno' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Merriweather+Sans:400,300,700' rel='stylesheet' type='text/css'>
<!--/script-->
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 900);
        });
    });
</script>
<!-- swipe box js -->
	<script src="js/jquery.swipebox.min.js"></script> 
	    <script type="text/javascript">
	        jQuery(function ($) {
	            $(".swipebox").swipebox();
	        });
	</script>
<!-- //swipe box js -->
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
	    new WOW().init();
	</script>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
      $.datepicker.regional['es'] = {
          closeText: 'Cerrar',
          prevText: '< Ant',
          nextText: 'Sig >',
          currentText: 'Hoy',
          monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
          monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
          dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
          dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
          dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
          weekHeader: 'Sm',
          dateFormat: 'dd/mm/yy',
          firstDay: 1,
          isRTL: false,
          showMonthAfterYear: false,
          yearSuffix: ''
      };
      $.datepicker.setDefaults($.datepicker.regional['es']);
      $(function () {
          $("#fecha").datepicker();
      });
  </script>

  <script>
      //var disableddates = ["20-05-2017", "21-05-2017", "22-05-2017", "23-05-2017"];

      var disableddates = "<%=Fechas%>" ;

      function DisableSpecificDates(date) {
          var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
          return [disableddates.indexOf(string) == -1];
      }

      $(function () {
          $(".date").datepicker({
              minDate: 1,
              maxDate: "+1M",
              beforeShowDay: DisableSpecificDates
          });


      });
  </script>
    <style type="text/css">
        @import url("css/datepicker.css");
    </style>

</head>
<body>
    <form id="form1" runat="server">

    <!--start-home-->
		<div class="banner" id="home">
		<div class="header-bottom wow slideInDown"  data-wow-duration="1s" data-wow-delay=".3s">
		     <div class="container">
			  <div class="fixed-header">
			      <!--logo-->
			       <div class="logo">
                      <a href="inicio.aspx"><h1>R<span>estaurante</span></h1></a>
					  <p>El Sabor Real</p>
				   </div>
					<!--//logo-->
					<div class="top-menu">
							<span class="menu"> </span>
							<nav class="link-effect-4" id="link-effect-4">
                              <ul>

								 <li class="active"><a data-hover="Inicio" href="inicio.aspx">Inicio</a></li>
								<li><a data-hover="Sobre&nbsp;Nosotros" href="sobre.aspx#abajo" >Sobre Nosotros</a></li>
							    <li><a data-hover="Reservación" href="reserva.aspx#abajo" >Reservación</a></li>
							    <li><a data-hover="Menú" href="menu.aspx#abajo">Menú</a></li>
								<li><a data-hover="Contacto" href="contacto.aspx#abajo" >Contacto</a></li>
                                <li><a data-hover="Mi&nbsp;Perfil" href="perfil.aspx#abajo" ><asp:Label ID="LB_Perfil" runat="server" Text='Mi Perfil'></asp:Label></a></li>
                                <li><a data-hover="Iniciar&nbsp;Sesión" href="login.aspx"><asp:Label ID="LB_Iniciar" runat="server" Text='Iniciar Sesión'></asp:Label></a></li>
                                <li><a><asp:LinkButton ID="LB_Cerrar" OnClick="LB_Cerrar_Click" runat="server" data-hover="Cerrar&nbsp;Sesión" Text='Cerrar Sesión'></asp:LinkButton></a></li>

								</ul>
							</nav>
							</div>
							<!-- script-for-menu -->
								<script>
								    $("span.menu").click(function () {
								        $(".top-menu ul").slideToggle("slow", function () {
								        });
								    });
								</script>
								<!-- script-for-menu -->

				 <div class="clearfix"></div>
					<script>
					    $(document).ready(function () {
					        var navoffeset = $(".header-bottom").offset().top;
					        $(window).scroll(function () {
					            var scrollpos = $(window).scrollTop();
					            if (scrollpos >= navoffeset) {
					                $(".header-bottom").addClass("fixed");
					            } else {
					                $(".header-bottom").removeClass("fixed");
					            }
					        });

					    });
				</script>
			 </div>
		</div>
	         
	</div>
		
            <!--reservation-->
    <div id="abajo">
	<div class="reservation" id="reservation">
		<div class="container">
		<div class="reservation-info">
		  <h3 class="tittle reserve">Haz una <br>
			Reservación
            </h3>
			 
			 <div class="arrows-reserve"><img src="images/border.png" alt="border"></div>
				<div class="book-reservation wow slideInUp" data-wow-duration="1s" data-wow-delay=".5s">
					

                    <asp:ScriptManager id="ScriptManager1" runat="server"  EnablePartialRendering="true">
                    </asp:ScriptManager>
                    <form>
                       
                        <!--<script type="text/javascript"> 
                            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq); 
                            function endReq(sender, args) 
                            { 
                                //$("#divTabs").tabs();
                                //$(".date").datepicker();
                                //var disableddates = ["24-05-2017", "25-05-2017", "26-05-2017", "27-05-2017"];
                                var disableddates = "<%=Fechas%>";

                                function DisableSpecificDates(date) {
                                    var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
                                    return [disableddates.indexOf(string) == -1];
                                }

                                //$(function () {
                                    $(".date").datepicker({
                                        minDate: 1,
                                        maxDate: "+1M",
                                        beforeShowDay: DisableSpecificDates
                                    });


                                //});
                            } 
                        </script>-->

                        <div class="col-md-4 form-left">
							<label><i class="glyphicon glyphicon-user"></i> N° Personas :</label>
                
							<asp:DropDownList ID="DDL_Personas" runat="server" CssClass="form-control" EnableViewState="true" AutoPostBack="true" >
                                <asp:ListItem Value="1">1 Persona</asp:ListItem>
                                <asp:ListItem Value="2">2 Personas</asp:ListItem>
                                <asp:ListItem Value="3">3 Personas</asp:ListItem>
                                <asp:ListItem Value="4">4 Personas</asp:ListItem>
                                <asp:ListItem Value="5">5 Personas</asp:ListItem>
                                <asp:ListItem Value="6">Más...</asp:ListItem>
                            </asp:DropDownList>
                
						</div>

                        <div class="col-md-4 form-right">
							<label><i class="glyphicon glyphicon-time"></i> Hora :</label>
                            <asp:DropDownList ID="DDL_Hora" runat="server" CssClass="form-control" EnableViewState="true" AutoPostBack="true" >
                                <asp:ListItem Value="12:00:00-05">12:00 p. m.</asp:ListItem>
                                <asp:ListItem Value="13:00:00-05">1:00 p. m.</asp:ListItem>
                                <asp:ListItem Value="14:00:00-05">2:00 p. m.</asp:ListItem>
                                <asp:ListItem Value="15:00:00-05">3:00 p. m.</asp:ListItem>
                                <asp:ListItem Value="16:00:00-05">4:00 p. m.</asp:ListItem>
                                <asp:ListItem Value="17:00:00-05">5:00 p. m.</asp:ListItem>
                                <asp:ListItem Value="18:00:00-05">6:00 p. m.</asp:ListItem>
                                <asp:ListItem Value="19:00:00-05">7:00 p. m.</asp:ListItem>
                                <asp:ListItem Value="20:00:00-05">8:00 p. m.</asp:ListItem>
                                </asp:DropDownList>

						</div>

    					<div class="col-md-4 form-left">
						<label><i class="glyphicon glyphicon-calendar"></i> Fecha :</label>
                         <asp:TextBox ID="TB_Fecha" CssClass="date" runat="server" ReadOnly="true" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Fecha" ValidationGroup="VG_Reserva" ErrorMessage="Campo requerido." ForeColor="White">Campo requerido.</asp:RequiredFieldValidator>
						</div>

						<div class="clearfix"> 
                            
        </div>
						<div class="make wow shake" data-wow-duration="1s" data-wow-delay=".5s">
                            <asp:Button ID="BT_Reserva" runat="server" ValidationGroup="VG_Reserva" Text="Hacer una Reservación" OnClick="BT_Reserva_Click" />
						</div>
                        

				</div>
				<div class="clearfix"> 
        </div>
			
    </form>
			</div>
		</div>
	</div>
	<!--//reservation-->

        <!--footer-->
		<div class="footer text-center">
						<div class="container">
							<!--logo2-->
								   <div class="logo2 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
									  <a href="inicio.aspx"><h2>R<span>estaurante</span></h2></a>
									  <p><%:Session["nombreRest"]%></p>
								   </div>
					<!--//logo2-->
								<!--<a href="single.html" class="flag_tag2">Where to find us?</a>
									<ul class="social wow slideInDown" data-wow-duration="1s" data-wow-delay=".3s">
										<li><a href="#" class="tw"></a></li>
										<li><a href="#" class="fb"> </a></li>
										<li><a href="#" class="in"> </a></li>
										<li><a href="#" class="dott"></a></li>
										 <div class="clearfix"></div>
									</ul>-->
									<p class="copy-right wow fadeInUp"  data-wow-duration="1s" data-wow-delay=".3s"><%:Session["nombreRest"]%> &copy; 2017. Todos los derechos reservados.</p>

					 </div>
	     </div>
		<!--start-smooth-scrolling-->
						<script type="text/javascript">
						    $(document).ready(function () {
						        /*
                                var defaults = {
                                    containerID: 'toTop', // fading element id
                                    containerHoverID: 'toTopHover', // fading element hover id
                                    scrollSpeed: 1200,
                                    easingType: 'linear' 
                                };
                                */

						        $().UItoTop({ easingType: 'easeOutQuart' });

						    });
								</script>
								<!--end-smooth-scrolling-->
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

    </form>
</body>
</html>
