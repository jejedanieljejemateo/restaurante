<%@ Page Title="Sobre Nosotros | Restaurante" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica/sobre.aspx.cs" Inherits="Presentacion_sobre" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="abajo">
       <br /><br /><br />
        <h3 class="single">Sobre Nosotros</h3>
        <div class="container">
    <!--bottom-->
	    <div class="bottom">
		<div class="container">
		       <div class="bottom-top" style="padding-top: 2em;">
			    <h3 class=" wow flipInX"  data-wow-duration="1s" data-wow-delay=".3s">¿Quiénes somos?</h3>
				<!--<span>DELICIOUS TREATS</span>-->
				   <p class="wow slideInDown" data-wow-duration="1s" data-wow-delay=".5s"><%:Session["quienes"]%></p>
				   
                   <div class="col-md-5 ab-text" style="width:100%">
			             <h3 class=" wow flipInX"  data-wow-duration="1s" data-wow-delay=".3s">Misión</h3>
						  <p class="wow slideInUp"  data-wow-duration="1s" data-wow-delay=".3s"><%:Session["mision"]%></p>
						 
			        </div>
                   <div class="col-md-5 ab-text" style="width:100%">
			             <h3 class=" wow flipInX"  data-wow-duration="1s" data-wow-delay=".3s">Visión</h3>
						  <p class="wow slideInUp"  data-wow-duration="1s" data-wow-delay=".3s"><%:Session["vision"]%></p>
						 
			        </div>

			   </div>
		</div>
    </div>   
    </div>
    </div><br /><br /><br /><br /><br /><br />
    

</asp:Content>

