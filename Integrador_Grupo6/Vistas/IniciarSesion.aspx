<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="Vistas.IniciarSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Size="25pt" Text="Tecno-UTN"></asp:Label>
            <br />
            <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Size="15pt" Text="Registrarse"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblNombreCompleto" runat="server" Text="Nombre completo :"></asp:Label>
            <br />
            <asp:TextBox ID="txtNombreCompleto" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario :"></asp:Label>
            <br />
            <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblEmail" runat="server" Text="Email :"></asp:Label>
            <br />
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblRepEmail" runat="server" Text="Repita el Email :"></asp:Label>
            <br />
            <asp:TextBox ID="txtRepEmail" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblContraseña" runat="server" Text="Contraseña :"></asp:Label>
            <br />
            <asp:TextBox ID="txtContraseña" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblRepContraseña" runat="server" Text="Repita la contraseña :"></asp:Label>
            <br />
            <asp:TextBox ID="txtRepContraseña" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnRegistrase" runat="server" Text="Registrarse" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
