<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarSucursales.aspx.cs" Inherits="Vistas.EliminarSucursales" %>

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
            width: 156px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="links">
            <asp:HyperLink ID="hlAgregarSucursales" runat="server" NavigateUrl="~/agregarSucursal.aspx">Agregar Sucursal</asp:HyperLink>
            <asp:HyperLink ID="hlListarSucursales" runat="server" NavigateUrl="~/ListarSucursales.aspx">Listar Sucursales</asp:HyperLink>
            <asp:HyperLink ID="hlEliminarSucursales" runat="server" NavigateUrl="~/EliminarSucursales.aspx">Eliminar Sucursales</asp:HyperLink>
        </div>

        <div class="form">
            <asp:Label ID="lblGrupo" runat="server" Font-Size="20pt" Text="Grupo N° 6"></asp:Label>
        </div>

        <div class="form">
            <asp:Label ID="lblEliminar" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Eliminar Sucursal"></asp:Label>
        </div>

        <div class="form">
        <asp:Label ID="lblIngresarID" runat="server" Text="Ingresar ID sucursal:"></asp:Label>
        <asp:TextBox ID="txtIngresarID" runat="server"></asp:TextBox>
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" />
        </div>

        <div class="form">
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>


    </form>
</body>
</html>
