<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallesUsuario.aspx.cs" Inherits="Vistas.DetallesUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        		<div class="wrapper">
			<div class="logo">TECNOVATOS</div>
			
			<nav>
				<a href="inicio.aspx">
                    Inicio
				</a>
                <asp:LinkButton ID="btnUsuario" runat="server" PostBackUrl="DetallesUsuario.aspx"></asp:LinkButton>

			    <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/Imagenes/Iconos/carrito.png" Width="37px" href="Carrito.aspx"/>
           </nav>
		</div>
    </header>
    </form>
</body>
</html>
