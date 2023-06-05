<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarSucursales.aspx.cs" Inherits="Vistas.ListarSucursales" %>

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
			.labels {
                position: absolute;
                top: 0;
                left: 0;
                width: 170px;
            }
		    .buttons {
                position: relative;
				left: 160px;
            }
		</style>
	</head>

    <body>
		<form id="form1" runat="server">

    <div class="links">
                        <asp:HyperLink ID="hlAgregarSucursal" runat="server" NavigateUrl="~/agregarSucursal.aspx">Agregar Sucursal</asp:HyperLink>
                        <asp:HyperLink ID="hlListarSucursal" runat="server" NavigateUrl="~/ListarSucursales.aspx">Listar Sucursales</asp:HyperLink>
                        <asp:HyperLink ID="hlEliminarSucursal" runat="server" NavigateUrl="~/EliminarSucursales.aspx">Eliminar Sucursales</asp:HyperLink>
	</div>

	<div class="form">
        <asp:Label ID="lblGrupo" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GRUPO Nº6"></asp:Label>
    </div>

	<div class="form">
		<asp:Label ID="lblListarSucursales" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Listado de Sucursales"></asp:Label>
	</div>

	<div class="form">
		<asp:Label ID="lblBusqueda" runat="server" Font-Size="Large" Text="Búsqueda ingrese ID Sucursal:"></asp:Label>
		<asp:TextBox ID="txtBusqueda" runat="server" Width="278px"></asp:TextBox>
		<div style="position: relative; display:inline-block;">
		  <div class="labels"><asp:RegularExpressionValidator ID="revSucursal" runat="server" ControlToValidate="txtBusqueda" ErrorMessage="Escriba un ID Válido!" ValidateRequestMode="Enabled" ValidationExpression="^[1-9]\d*$" ForeColor="#FF3300"></asp:RegularExpressionValidator></div>
		  <div class="labels"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tiene que escribir un ID!" ForeColor="#FF3300" ControlToValidate="txtBusqueda"></asp:RequiredFieldValidator></div>
		</div>
     <div class="buttons">   
        <asp:Button ID="btnFiltrar" runat="server" Font-Bold="True" Text="Filtrar" OnClick="btnFiltrar_Click" />
        <asp:Button ID="btnMostrarTodo" runat="server" Font-Bold="True" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Text="Mostrar Todos" OnClick="btnMostrarTodo_Click" />
	</div>
	</div>
		
    <div class ="form">
    <asp:Label ID="lblResultado" runat="server" Text="No se encontraron resultados" Visible="False" ForeColor="White" BackColor="red" BorderWidth="2px" BorderColor="Black"></asp:Label>
    </div>

	<div class="form">
    <asp:GridView ID="grdSucursales" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" Height="10px" Width="1254px" CellSpacing="3" OnSelectedIndexChanged="grdSucursales_SelectedIndexChanged">
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
	</body>
</html>
