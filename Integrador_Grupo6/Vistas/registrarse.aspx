<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrarse.aspx.cs" Inherits="Vistas.registrarse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>

        td{
            margin-bottom:3px;
        }
        tr{
            margin:5px;
        }
 header {
	width:100%; 
	overflow:hidden; 
	background:#252932;
	margin-bottom:20px;
}

.wrapper {
	width:90%; 
	max-width:1000px; 
	margin:auto; 
	overflow:hidden; 
}

header .logo {
	color:#f2f2f2;
	font-size:50px;
	line-height:200px;
	float:left;
}

header nav {
	float:right;
	line-height:200px;
}

header nav a {
	display:inline-block;
	color:#fff;
	text-decoration:none;
	padding:10px 20px;
	line-height:normal;
	font-size:20px;
	font-weight:bold;
	-webkit-transition:all 500ms ease;
	-o-transition:all 500ms ease;
	transition:all 500ms ease;
}

header nav a:hover {
	background:#f56f3a;
	border-radius:50px;
}

    </style>
</head>

<body>
    <header>
        		<div class="wrapper">
			<div class="logo">Tecno UTN</div>
			
			<nav>
				<a href="inicio.aspx">
                    Inicio

				</a>
				<a href="iniciarSesion.aspx">
                    Iniciar Sesion

				</a>
				<a href="registrarse.aspx">
                    Registrarse

				</a>
			</nav>
		</div>
    </header>
    <form id="form1" runat="server">
        <div style="display:flex;justify-content:center;">
        <div style="width: 400px; border: thick outset #006666; height: 380px; justify-content:center; border-radius: 30px; color:white;background-image: url('https://localhost:44338/Imagenes/images.jpg'); background-repeat: no-repeat; background-size: cover;">
            <div> </br> </div>
            <div style="margin-bottom:20px;margin-top:10px;text-align:center; font-family:sans-serif;">
                <asp:Label ID="lblTitulo" runat="server" Font-Size="25pt" Text="TECNO-UTN"></asp:Label>
            </div>
            <div style="text-align:center; margin-bottom: 20px;font-family:sans-serif;">
                <asp:Label ID="lblRegistrarse" runat="server" Font-Size="13pt" Text-align="center" Text="Registrar Usuario Nuevo"></asp:Label>
                </div>
            <div style="display:flex;justify-content:center;margin-bottom:10px;font-family:sans-serif;">
            <table style="margin: 5px; border: medium outset #006666; width:340px; height:200px; text-align: center; color:white;border-radius: 15px;">
                <tr>
                    <td>
                        <asp:Label ID="lblNombreCompleto" runat="server" Text="Nombre completo :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombre" runat="server" style="width: 100px;" BackColor="#018A76" BorderColor="#015243" ForeColor="White" Width="120px" BorderWidth="1px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUsuario" runat="server" style="width: 100px;" Text="Usuario :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" style="width: 100px;" BackColor="#018A76" BorderColor="#015243" ForeColor="White" Width="120px" BorderWidth="1px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" style="width: 100px;" Text="Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server" style="width: 100px;" BackColor="#018A76" BorderColor="#015243" ForeColor="White" Width="120px" BorderWidth="1px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblRepEmail" runat="server" style="width: 100px;" Text="Repita el Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRepEmail" runat="server" style="width: 100px;" BackColor="#018A76" BorderColor="#015243" ForeColor="White" Width="120px" BorderWidth="1px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblContraseña" runat="server" style="width: 100px;" Text="Contraseña :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtContraseña" runat="server" style="width: 100px;" BackColor="#018A76" BorderColor="#015243" ForeColor="White" TextMode="Password" Width="120px" BorderWidth="1px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblRepContraseña" runat="server" Text="Repita la contraseña :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRepContraseña" runat="server" style="width: 100px;" BackColor="#018A76" BorderColor="#015243" ForeColor="White" TextMode="Password" Width="120px" BorderWidth="1px"></asp:TextBox>
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
