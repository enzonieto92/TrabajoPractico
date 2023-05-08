<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarSucursal.aspx.cs" Inherits="TP5_Grupo_Nro_06.EliminarSucursal" %>

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
		padding: 20px;
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

	 <div class="form">
        <asp:Label ID="lblGrupo" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GRUPO Nº6"></asp:Label>
    </div>

    <div class="form">
		<asp:Label ID="lblEliminarSucursal" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Eliminar Sucursal"></asp:Label>
	</div> 
	<div class="form">
		<asp:Label ID="lblBusqueda" runat="server" Font-Size="Large" Text="Ingresar ID Sucursal:"></asp:Label>
		<asp:TextBox ID="txtBusqueda" runat="server" Width="278px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="revIDsucursal" runat="server" ControlToValidate="txtBusqueda" ErrorMessage="Ingrese un ID Valido!" ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
        <asp:Button ID="btnEliminar" runat="server" Font-Bold="True" Text="Eliminar" OnClick="btnEliminar_Click"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblAgregado" runat="server"></asp:Label>
	</div>

	</body>
</form>
</html>
