<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="~/Logica/login.aspx.cs" Inherits="Presentacion_login" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Iniciar Sesión | Restaurante</title>
  
  
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

      <link rel="stylesheet" href="css/style3.css">

  
</head>

<body>
    
    <div class="login-wrap">
	      <div class="login-html">

    <form id="form1" runat="server">
    
    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate">
        <LayoutTemplate>

            <div class="login-wrap">
	      <div class="login-html">

		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Iniciar Sesión</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Regístrate</label>
          
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName" CssClass="label">Nombre de usuario</label></asp:Label>
                    <asp:TextBox ID="UserName" runat="server" class="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Nombre de usuario requerido." ToolTip="User Name is required." ValidationGroup="Login1" ForeColor="Red">Campo requerido.</asp:RequiredFieldValidator>
					
				</div>
				<div class="group">

                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="label">Contraseña</asp:Label>
               <asp:TextBox ID="Password" runat="server" TextMode="Password" class="input"></asp:TextBox>
               <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Contraseña requerida." ToolTip="Password is required." ValidationGroup="Login1" ForeColor="Red">Campo requerido.</asp:RequiredFieldValidator>

					<!--<input id="pass" type="password" class="input" data-type="password">-->
				</div>
				<div class="group">

                    <asp:CheckBox ID="RememberMe" runat="server" Text="Recuérdame" class="check"/>

					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Recuérdame</label>
                    <br>
                    <br>
                    <br>
                    <br></br>
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                    <br>
                    <br></br>
                    <br></br>
                    <br></br>
                    </br>
                    </br>
                    </br>
                    </br>
                    
				</div>
				<div class="group">

                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Acceder" ValidationGroup="Login1" CssClass="button" />

					
				</div>
				<!--<div class="hr"></div>
				<div class="foot-lnk">
					<a href="#forgot">Olvidaste tu contraseña?</a>
				</div>-->
			</div>
			<div class="sign-up-htm">
				<div class="group">
					<label for="nombre" class="label">Nombres y apellidos</label>
                    <asp:TextBox ID="TB_Nombre" MaxLength="30" runat="server" class="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Nombre" ValidationGroup="VG_Registro" ErrorMessage="Campo requerido." ForeColor="Red">Campo requerido.</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TB_Nombre" ValidationGroup="VG_Registro" runat="server" ErrorMessage="Solo letras permitidas." ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
				
					<label for="cedula" class="label">Número de Cédula</label>
                    <asp:TextBox ID="TB_Cedula" MaxLength="10" runat="server" class="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Cedula" ValidationGroup="VG_Registro" ErrorMessage="Campo requerido." ForeColor="Red">Campo requerido.</asp:RequiredFieldValidator>
				    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TB_Cedula" ValidationGroup="VG_Registro" runat="server" ErrorMessage="Solo números." ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>

					<label for="tel" class="label">Teléfono</label>
                    <asp:TextBox ID="TB_Telefono" MaxLength="15" runat="server" class="input" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_Telefono" ValidationGroup="VG_Registro" ErrorMessage="Campo requerido." ForeColor="Red">Campo requerido.</asp:RequiredFieldValidator>
				
					<label for="user" class="label">Nombre de usuario</label>
					<asp:TextBox ID="TB_User" MaxLength="20" runat="server" class="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_User" ValidationGroup="VG_Registro" ErrorMessage="Campo requerido." ForeColor="Red">Campo requerido.</asp:RequiredFieldValidator>
				
					<label for="pass" class="label">Contraseña</label>
					<asp:TextBox ID="TB_Pass" MaxLength="20" runat="server" class="input" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Pass" ValidationGroup="VG_Registro" ErrorMessage="Campo requerido." ForeColor="Red">Campo requerido.</asp:RequiredFieldValidator>
				
					<label for="email" class="label">Correo Electrónico</label>
					<asp:TextBox ID="TB_Email" MaxLength="30" runat="server" class="input" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TB_Email" ValidationGroup="VG_Registro" ErrorMessage="Campo requerido." ForeColor="Red">Campo requerido.</asp:RequiredFieldValidator>
				    
					<asp:Button ID="BT_Registro" runat="server" Text="Enviar" OnClick="BT_Registro_Click" ValidationGroup="VG_Registro" class="button"/>

                    

				</div>
				<!--<div class="hr"></div>
				<div class="foot-lnk">
					<label for="tab-1">Ya estás registrado?</a>
                        
				</div>-->
			</div>
		</div>
        </div>
</div>

            
        </LayoutTemplate>
    </asp:Login>
    <asp:Label ID="anuncio" runat="server" Text="Label"></asp:Label>
    </form>
</div>
</div>
              	

</body>
</html>
