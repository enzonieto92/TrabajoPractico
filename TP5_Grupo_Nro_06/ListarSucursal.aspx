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
	&nbsp;&nbsp;<asp:RegularExpressionValidator ID="revSucursal" runat="server" ControlToValidate="txtBusqueda" ErrorMessage="Escriba un ID Válido!" ValidateRequestMode="Enabled" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
        <asp:Button ID="btnFiltrar" runat="server" Font-Bold="True" Text="Filtrar" OnClick="btnFiltrar_Click" />
        <asp:Button ID="btnMostrarTodo" runat="server" Font-Bold="True" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Text="Mostrar Todos" OnClick="btnMostrarTodo_Click" />
	</div>
    <div class ="form">
    <p>
    <asp:Label ID="lblResultado" runat="server" Text="No se encontraron resultados" Visible="False" ForeColor="White" BackColor="red" BorderWidth="2px" BorderColor="Black"></asp:Label>
    </p>
    </div>
    <br />
	<div class="form">
    <asp:GridView ID="grdSucursales" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" Height="10px" Width="1254px" CellSpacing="3">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" BorderStyle="Solid" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    </div>

</form>
</html>
