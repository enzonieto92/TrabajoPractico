<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrarse.aspx.cs" Inherits="Vistas.registrarse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro</title>

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
                <asp:Label ID="lblRegistrarse" runat="server" Font-Size="13pt" Text-align="center" Text="Registro de Usuario Nuevo"></asp:Label>
                </div>
            <div style="display:flex;justify-content:center;margin-bottom:10px;font-family:sans-serif;">
            <table style="margin: 5px; width:340px; height:105px; text-align: center; color:white;border-radius: 3px;">
                <tr>
                    <td>
                        <asp:Label ID="lblNombreCompleto" runat="server" Text="Nombre completo :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombre" runat="server" class= "TextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUsuario" runat="server" style="width: 100px;" Text="Usuario :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" class="TextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" style="width: 100px;" Text="Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server" class="TextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblRepEmail" runat="server" style="width: 100px;" Text="Repita el Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRepEmail" runat="server" class="TextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblContraseña" runat="server" style="width: 100px;" Text="Contraseña :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtContraseña" runat="server" class="TextBox" TextMode="password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblRepContraseña" runat="server" Text="Repita la contraseña :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRepContraseña" runat="server" class="TextBox" TextMode="password"></asp:TextBox>
                    </td>
                </tr>

            </table>
                </div>
            <div style="display:flex;justify-content:center;">
                        <asp:Button ID="btnRegistrase" runat="server" Text="Registrarse" ForeColor="White" font-family="sans-serif" Font-Size="Medium" BackColor="#018A76"   />
            </div>
</div>
</div>
    </form>
</body>
</html>
