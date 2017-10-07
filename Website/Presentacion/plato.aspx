<%@ Page Title="Menú | Restaurante" Language="C#" MasterPageFile="~/Presentacion/MasterPage.master" AutoEventWireup="true" CodeFile="~/Logica/plato.aspx.cs" Inherits="Presentacion_plato" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <style type="text/css">
        .ratingEmpty
        {
        background-image: url('images/stars/star.png');
        width: 30px;
        height: 30px;
        }
        .ratingFilled
        {
        background-image: url('images/stars/star-hover.png');
        width: 30px;
        height: 30px;
        }
        .ratingSaved
        {
        background-image: url('images/stars/star-rate.png');
        width: 30px;
        height: 30px;
        }
    </style>

    <div id="abajo">
    <div class="gallery" id="gallery">
	<div class="container">
		<h3 class="tittle"><%:Session["platoNombre"]%></h3>

        <asp:ScriptManager ID="ScriptManager1" runat="server" />

            <div style="width:150px; margin:0 auto;">
                <asp:Rating ID="Rating1" runat="server" ReadOnly="true" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled">
                </asp:Rating>
                
            </div><br />
        <div class="make wow shake" data-wow-duration="1s" data-wow-delay=".5s">
                                        
                   						</div>
        
        <div style="font-size:12px;" ><asp:Label ID="lblRating" runat="server" Text=""></asp:Label></div>

        
            
            <div class="gallery-grids">
					<div class="col-md-6 baner-top wow fadeInRight animated" data-wow-delay=".5s">
                        <a style="width: 540px;" class="b-link-stripe b-animate-go">
							<div class="gal-spin-effect vertical" >
                                
            <asp:Image ID="Imagen" runat="server" Height="345px" Width="535px"/>


                                </div></a></div>
                
                
                <div class="col-md-6 baner-top wow fadeInRight animated" data-wow-delay=".5s">
                    
                        
                    <div class="gal-spin-effect vertical" >
                    <asp:Label ID="LB_id" runat="server" Visible="false"></asp:Label>
                                        <h1 style="font-size:50px; color:#EFA52C"><asp:Label ID="Label6" runat="server" Text="Descripción:"></asp:Label></h1>

                
            </div>                              

                                       
                                        <p><asp:Label ID="LB_Descripcion" runat="server" ></asp:Label></p>

                                        <span class="separator"></span>
                                        <h1>Precio: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$ <asp:Label ID="LB_Precio" runat="server" ></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
                                        <span class="separator"></span>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="TB_Cantidad" ValidationGroup="VG_Agregar" runat="server" ErrorMessage="Número no válido." ForeColor="Red" ValidationExpression="^([1-9])$"></asp:RegularExpressionValidator>
                                        <p style="font-family:'Italianno', cursive; font-size:36px">Cantidad: &nbsp;&nbsp;<asp:TextBox ID="TB_Cantidad" MaxLength="1" runat="server"></asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Cantidad" ValidationGroup="VG_Agregar" ErrorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>

                                        </p>

                                        <div class="make wow shake" data-wow-duration="1s" data-wow-delay=".5s">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="BT_Agregar" runat="server" ValidationGroup="VG_Agregar" OnClick="BT_Agregar_Click" Text="Agregar a la reserva" /></p>
                   						</div></div>

                </div>
            </div>
                    <br></br>
        
                <asp:Label ID="prueba" runat="server" ForeColor="Red"></asp:Label>
        
    <div class="clearfix"> </div>
    </div>
    </div>
    </div>   
        
</asp:Content>

