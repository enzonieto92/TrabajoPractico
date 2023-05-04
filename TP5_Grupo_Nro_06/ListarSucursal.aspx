<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarSucursal.aspx.cs" Inherits="TP5_Grupo_Nro_06.ListarSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    	<style>
		.links {
			display: flex;
			justify-content: center;
			gap: 20px;
		}

		.links a {
			padding: 10px;
			background-color: #4CAF50;
			color: white;
			text-decoration: none;
			border-radius: 5px;
		}
		.form {			
                display: flex;
			    justify-content: center;
			    gap: 20px;
            }
	</style>
</head>
<form id="form1" runat="server">
    <body>
    <div class="links">
		<asp:HyperLink ID="hlAgregarSucursal" runat="server" NavigateUrl="AgregarSucursal.aspx">AgregarSucursal</asp:HyperLink>
		<asp:HyperLink ID="hlListarSucursal" runat="server" NavigateUrl="ListarSucursal.aspx">ListarSucursal</asp:HyperLink>
        <asp:HyperLink ID="hlEliminarSucursal" runat="server" NavigateUrl="EliminarSucursal.aspx">EliminarSucursal</asp:HyperLink>
	</div>
    </body>
    <br />
    <br />
                
        <br />
    <br />
	<div class="form">
		<asp:Label ID="lblListarSucursales" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Listado de Sucursales"></asp:Label>
		<br />
        <br />
		<br />
	</div>
	<div class="form">
		<asp:Label ID="lblBusqueda" runat="server" Font-Size="Large" Text="Búsqueda ingrese ID Sucursal:"></asp:Label>
		&nbsp;&nbsp;&nbsp;
		<asp:TextBox ID="txtBusqueda" runat="server" Width="278px"></asp:TextBox>
	</div>
    

</form>
</html>
