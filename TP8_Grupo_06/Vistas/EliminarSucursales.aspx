<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarSucursales.aspx.cs" Inherits="Vistas.EliminarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="hlAgregarSucursales" runat="server" NavigateUrl="~/agregarSucursal.aspx">Agregar Sucursal</asp:HyperLink>
            <asp:HyperLink ID="hlListarSucursales" runat="server" NavigateUrl="~/ListarSucursales.aspx">Listar Sucursales</asp:HyperLink>
            <asp:HyperLink ID="hlEliminarSucursales" runat="server" NavigateUrl="~/EliminarSucursales.aspx">Eliminar Sucursales</asp:HyperLink>
        </div>
        <p>
            <asp:Label ID="lblEliminar" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Eliminar Sucursal"></asp:Label>
        </p>
        <asp:Label ID="lblIngresarID" runat="server" Text="Ingresar ID sucursal:"></asp:Label>
        <asp:TextBox ID="txtIngresarID" runat="server"></asp:TextBox>
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" />
        <p>
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
