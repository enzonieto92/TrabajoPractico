﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallesUsuario.aspx.cs" Inherits="Vistas.DetallesUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 280px;
        }
        .auto-style3 {
            height: 22px;
        }
        .auto-style4 {
            width: 280px;
            height: 22px;
        }
        .auto-style5 {
            height: 22px;
            width: 518px;
        }
        .auto-style6 {
            width: 518px;
        }
        .auto-style7 {
            width: 518px;
            height: 23px;
        }
        .auto-style8 {
            width: 280px;
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
        }
    </style>
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
                <asp:LinkButton ID="btnUsuario" runat="server"></asp:LinkButton>
                <asp:LinkButton ID="btnCerrarSesion" runat="server" OnClick="CerrarSesion" Text="Cerrar Sesión"></asp:LinkButton>
			    <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/Imagenes/Iconos/carrito.png" Width="37px" href="Carrito.aspx" PostBackUrl="Carrito.aspx"/>
           </nav>
		</div>
    </header>
        <table class="auto-style1">
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style4">Nombre:</td>
                <td class="auto-style4">
                    <asp:Label ID="lblNombre" runat="server"></asp:Label>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style4">Apellido:</td>
                <td class="auto-style4">
                    <asp:Label ID="lblApellido" runat="server"></asp:Label>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style2">DNI:</td>
                <td class="auto-style2">
                    <asp:Label ID="lblDNI" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style2">Email:</td>
                <td class="auto-style2">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style2">Fecha de Nacimiento:</td>
                <td class="auto-style2">
                    <asp:Label ID="lblFechaNac" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7"></td>
                <td class="auto-style8">Telefono:</td>
                <td class="auto-style8">
                    <asp:Label ID="lblTelefono" runat="server"></asp:Label>
                </td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style2">Usuario:</td>
                <td class="auto-style2">
                    <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style2">Contraseña:</td>
                <td class="auto-style2">
                    <asp:Label ID="lblContraseña" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
