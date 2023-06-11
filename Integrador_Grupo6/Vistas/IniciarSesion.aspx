<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iniciarSesion.aspx.cs" Inherits="Vistas.iniciarSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio Sesion</title>

    <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>

</head>

<body>
    <header>
        		<div class="wrapper">
			<div class="logo">TECNO UTN</div>
			
			<nav>
				<a href="inicio.aspx">
                    Inicio

				</a>
				<a href="iniciarSesion.aspx">
                    Iniciar Sesión

				</a>
				<a href="registrarse.aspx">
                    Registrarse

				</a>
			</nav>
		</div>
    </header>
    <form id="form1" runat="server">
        <div style="display:flex;justify-content:center;">
        <div style="width: 400px; border: 1px none #333333; height: 315px; justify-content:center; border-radius: 3px; color:white;background-color:darkcyan;">
            <div>  </div>

            <div style="text-align:center; margin-bottom: 20px;margin-top: 20px;font-family:sans-serif;">
                <asp:Label ID="lblRegistrarse" runat="server" Font-Size="13pt" Text-align="center" Text="Inicio de Sesión"></asp:Label>
                </div>
            <div style="display:flex;justify-content:center;margin-bottom:10px;font-family:sans-serif;">
            <table style="margin: 5px; width:340px; height:105px; text-align: center; color:white;border-radius: 3px;">
                <tr>
                    <td>
                        <asp:Label ID="lblUsuario" runat="server" style="width: 100px;" Text="Usuario :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server" class="TextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblContraseña" runat="server" style="width: 100px;" Text="Contraseña :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtContraseña" runat="server" class="TextBox" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
            </table>
                </div>
            <div style="display:flex;justify-content:center;">

               
                <asp:HyperLink ID="HlOlvidar" runat="server" Text="¿Olvidaste tu contraseña?" font-name="sans-serif" ForeColor="SkyBlue" Font-Size="Medium" NavigateUrl="~/iniciarSesion.aspx"></asp:HyperLink>
            </div>
            <br/>
            <div style="display:flex;justify-content:center;">
                        <asp:Button ID="btnRegistrase" runat="server" Text="Iniciar Sesión" ForeColor="White" font-family="sans-serif" Font-Size="Medium" BackColor="#018A76"   />
            </div>
</div>
</div>
    </form>
</body>
</html>
