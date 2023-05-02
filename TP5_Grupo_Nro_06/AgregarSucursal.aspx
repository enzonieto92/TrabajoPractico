<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarSucursal.aspx.cs" Inherits="TP5_Grupo_Nro_06.AgregarSucursal" %>

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
	</style>
    <style type="text/css">
        .auto-style2 {
            margin-left: 160px;
        }
        .auto-style3 {
            width: 33%;
            height: 166px;
        }
        .auto-style5 {
            width: 159px;
        }
        .auto-style6 {
            margin-left: 0px;
        }
        .auto-style7 {
            width: 453px;
            height: 229px;
            margin-left: 20px;
        }
        .auto-style8 {
            width: 247px;
        }
        .auto-style9 {
            width: 16px;
        }
        .auto-style10 {
            height: 3px;
            margin-top: 30px;
        }
    </style>
</head>
    <form id="form1" runat="server" aria-checked="true">
<body>
    <div class="links">
		<asp:HyperLink ID="hlAgregarSucursal" runat="server" NavigateUrl="AgregarSucursal.aspx">AgregarSucursal</asp:HyperLink>
		<asp:HyperLink ID="hlListarSucursal" runat="server" NavigateUrl="ListarSucursal.aspx">ListarSucursal</asp:HyperLink>
        <asp:HyperLink ID="hlEliminarSucursal" runat="server" NavigateUrl="EliminarSucursal.aspx">EliminarSucursal</asp:HyperLink>
	</div> 
        <asp:Label ID="lblGrupo" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GRUPO Nº6"></asp:Label>
        <p>
            <asp:Label ID="lblAgregarSucursal" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Agregar Sucursal"></asp:Label>
        </p>
            <table class="auto-style7" role="gridcell">
                <tr>
                    <td class="auto-style5">
        <asp:Label ID="lblNombreSucursal" runat="server" Text="Nombre Sucursal:"></asp:Label>
                    </td>
                    <td class="auto-style8">
        <asp:TextBox ID="txtNombre" runat="server" Width="226px" CssClass="auto-style6"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
        <asp:RequiredFieldValidator ID="rfvNombreSucursal" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revNombreSucursal" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre valido" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]+$" ValidationGroup="Grupo 1">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
            <asp:Label ID="lblDescripcion" runat="server" Height="19px" Text="Descripción:" CssClass="auto-style3" Width="79px"></asp:Label>
                    </td>
                    <td class="auto-style8">
            <asp:TextBox ID="txtDescripcion" runat="server" Height="87px" Width="225px" CssClass="auto-style6" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Debe Ingresar una descripción" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
            <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
                    </td>
                    <td class="auto-style8">
            <asp:DropDownList ID="ddlProvincias" runat="server" CssClass="auto-style6" Width="232px">
            </asp:DropDownList>
                    </td>
                    <td class="auto-style9">
            <asp:RequiredFieldValidator ID="rfvProvincias" runat="server" ControlToValidate="ddlProvincias" ErrorMessage="Debe seleccionar una Provincia" ForeColor="Red" InitialValue="-- Seleccione --" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
                    </td>

                </tr>
                  <tr>
                    <td class="auto-style5">
            <asp:Label ID="lblDireccion" runat="server" Text="Dirección:"></asp:Label>
                    </td>
                    <td class="auto-style8">
            <asp:TextBox ID="txtDireccion" runat="server" Width="224px" CssClass="auto-style6"></asp:TextBox>
                    </td>
                    <td class="auto-style9"
                    </td>
            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección valida" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]+$" ValidationGroup="Grupo 1">*</asp:RegularExpressionValidator>
                 </tr>
            </table>
            <asp:Button ID="btnAceptar" runat="server" style="margin-left: 218px" Text="Aceptar" ValidationGroup="Grupo 1" OnClick="btnAceptar_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblAgregado" runat="server"></asp:Label>
            <asp:Label ID="lblPrueba" runat="server"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Grupo 1" />

        </body>
    </form>
</html>
