<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="Vistas.IniciarSesion" %>

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

    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div style="display:flex;justify-content:center;">
        <div style="background-color: darkcyan; width: 400px; border: thick outset #006666; height: 380px;justify-content:center;border-radius: 30px;color:white;">
            <div> </br> </div>
            <div style="margin-bottom:20px;margin-top:10px;text-align:center; font-family:sans-serif;">
                <asp:Label ID="lblTitulo" runat="server" Font-Size="25pt" Text="TECNO-UTN"></asp:Label>
            </div>
            <div style="text-align:center; margin-bottom: 20px;font-family:sans-serif;">
                <asp:Label ID="lblRegistrarse" runat="server" Font-Size="13pt" Text-align="center" Text="Registrar Usuario Nuevo"></asp:Label>
                </div>
            <div style="display:flex;justify-content:center;margin-bottom:10px;font-family:sans-serif;">
            <table style="margin: 5px; border: medium outset #006666; width:340px; height:200px; text-align: center; color:black;border-radius: 15px;">
                <tr>
                    <td>
                        <asp:Label ID="lblNombreCompleto" runat="server" Text="Nombre completo :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombre" runat="server" style="width: 100px;" BackColor="#009999" BorderColor="#006666" BorderStyle="Groove" ForeColor="White" Width="120px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUsuario" runat="server" style="width: 100px;" Text="Usuario :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" style="width: 100px;" BackColor="#009999" BorderColor="#006666" BorderStyle="Groove" ForeColor="White" Width="120px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" style="width: 100px;" Text="Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUsuario" runat="server" style="width: 100px;" BackColor="#009999" BorderColor="#006666" BorderStyle="Groove" ForeColor="White" Width="120px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblRepEmail" runat="server" style="width: 100px;" Text="Repita el Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRepEmail" runat="server" style="width: 100px;" BackColor="#009999" BorderColor="#006666" BorderStyle="Groove" ForeColor="White" Width="120px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblContraseña" runat="server" style="width: 100px;" Text="Contraseña :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtContraseña" runat="server" style="width: 100px;" BackColor="#009999" BorderColor="#006666" BorderStyle="Groove" ForeColor="White" TextMode="Password" Width="120px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblRepContraseña" runat="server" Text="Repita la contraseña :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRepContraseña" runat="server" style="width: 100px;" BackColor="#009999" BorderColor="#006666" BorderStyle="Groove" ForeColor="White" TextMode="Password" Width="120px"></asp:TextBox>
                    </td>
                </tr>

            </table>
                </div>
            <div style="display:flex;justify-content:center;">
                        <asp:Button ID="btnRegistrase" runat="server" Text="Registrarse" ForeColor="White" font-family="sans-serif" Font-Size="Medium" BackColor="#009999" BorderColor="#006666"  />
            </div>
</div>
</div>
    </form>
</body>
</html>
