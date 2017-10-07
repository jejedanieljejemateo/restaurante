<%@ Page Title="Contacto | Restaurante" ValidateRequest="false" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica/contacto.aspx.cs" Inherits="Presentacion_contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <style type="text/css">
        textarea
        {
            width : 555px;
            height : 120px;
            resize: none;
            border: none;
            background: #E8E9EA;
            margin: 0;
            padding: 18px 0;
            padding-left: 22%;
            color: #313A3D;
            font-size: 13px;
            letter-spacing: 0.05em;
            font-family: 'Merriweather Sans', sans-serif;
        }
        form .field2 {
            width: 100%;
    position: relative;
    margin-bottom: 15px;
        }
        form .field2 label {
            position: absolute;
            top: 0;
            left: 0;
            background: #333;
            width: 100%;
            padding: 50px 0;
            font-size: 15px;
            letter-spacing: 0.075em;
            color: #EAEAEA;
            -webkit-transition: all 333ms ease-in-out;
            -moz-transition: all 333ms ease-in-out;
            -o-transition: all 333ms ease-in-out;
            -ms-transition: all 333ms ease-in-out;
            transition: all 333ms ease-in-out;
            font-weight: 400;
        }
        form .field2:hover label {
            width: 20%;
            background: #efa52c;
            color: white;
        }
        form .field input[type="text"], form .field textarea {
            border: none;
            background: #E8E9EA;
            width: 100%;
            margin: 0;
            padding: 18px 0;
            padding-left: 22%;
            color: #313A3D;
            font-size: 13px;
            letter-spacing: 0.05em;
            font-family: 'Merriweather Sans', sans-serif;
        }
        
    </style>
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
        <!--/contact-->
    <div id="abajo">
	 <div class="section-contact" id="contact">
	    <div class="container">
           <div class="contact-main">
				    <div class="col-md-6 contact-grid wow fadeInUp"  data-wow-duration="1s" data-wow-delay=".3s">
					<h3 class="tittle wow bounceIn"  data-wow-duration=".8s" data-wow-delay=".2s">Contáctanos</h3>
						<div class="arrows-three"><img src="images/border.png" alt="border"></div>
							<p class="wel-text wow fadeInDown"  data-wow-duration=".8s" data-wow-delay=".4s">Envíanos un mensaje, nos pondrémos en contacto.</p>
						    
					  <div class="field name-box">  
                            <asp:TextBox ID="TB_Nombre" MaxLength="30" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TB_Nombre" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TB_Nombre" runat="server" ErrorMessage="Solo letras permitidas." ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
							<label>Nombre</label>
					  </div>
					  
					  <div class="field email-box">
							<asp:TextBox ID="TB_Email" MaxLength="40" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TB_Email" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TB_Email" runat="server" ErrorMessage="Correo no válido (ejemplo@email.com)." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
							<label>Correo</label>
					  </div>
					  
					  <div class="field phonenum-box">
							<asp:TextBox ID="TB_Telefono" MaxLength="15" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TB_Telefono" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
							<label>Teléfono</label>
					  </div>

					  <div class="field2 msg-box">
							<asp:TextBox ID="TB_Mensaje" onpaste="return false" MaxLength="499" onkeyDown="checkTextAreaMaxLength(this,event,'499');" TextMode="multiline" style = "resize:none" runat="server"></asp:TextBox>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TB_Mensaje" runat="server" ErrorMessage="Campo requerido." ForeColor="Red"></asp:RequiredFieldValidator>
                            <label>Mensaje</label>
					  </div>
						<div class="send wow shake"  data-wow-duration="1s" data-wow-delay=".3s">
								<asp:Button ID="BT_Enviar" runat="server" OnClick="BT_Enviar_Click" Text="Enviar" />
					    </div>
					 

					   </div>
					<div class="col-md-6 contact-in wow fadeInUp"  data-wow-duration="1s" data-wow-delay=".5s">
						<h4 class="info">Información </h4>
						<p class="para1"><%:Session["info_ubicacion"]%></p>
						<div class="con-top">
							<h4><%:Session["ciudad"]%></h4>
								<ul>
								<li><%:Session["direccion"]%></li>
								<li><a href="mailto:<%:Session["email"]%>"><%:Session["email"]%></a></li>
							  </ul>
						</div>
						<!--<div class="con-top two">
							<h4>Hawaii</h4>
							<ul>
								<li>4th Floor dolor sit amet,</li> 
								<li># Grand Hyatt New York Road,</li>   
								<li>Opp. adipiscing elit,</li> 
								<li>Hawaii - 96815</li>
								<li>Ph:3698521475 </li>
								<li>Call Centre Time : 7am to 11pm</li>	
								<li><a href="">mail@example.com</a></li>
							</ul>								
						</div>-->
					</div>
					
						<div class="clearfix"> </div>
			      </div>
				   <!--map-->
				    <div class="map wow fadeInDown" data-wow-duration=".8s" data-wow-delay=".5s">
					  <iframe src="<%:Session["mapa"]%>"></iframe>
					</div>
				<!--//map-->
			 </div>
		</div>
        </div>
		<!--//contact-->
</asp:Content>

