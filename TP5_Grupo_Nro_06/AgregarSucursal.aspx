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
            .form {		
                padding: 20px;
                display: flex;
			    justify-content: center;
			    gap: 20px;
            }
	        .auto-style1 {
                        margin-left: 118px;
                    }

	            </style>
</head>


<body>
<form id="form1" runat="server" aria-checked="true">
        <div class="links">
		    <asp:HyperLink ID="hlAgregarSucursal" runat="server" NavigateUrl="AgregarSucursal.aspx">AgregarSucursal</asp:HyperLink>
		    <asp:HyperLink ID="hlListarSucursal" runat="server" NavigateUrl="ListarSucursal.aspx">ListarSucursal</asp:HyperLink>
            <asp:HyperLink ID="hlEliminarSucursal" runat="server" NavigateUrl="EliminarSucursal.aspx">EliminarSucursal</asp:HyperLink>
	    </div> 
        
        <div class="form">
                <asp:Label ID="lblGrupo" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GRUPO Nº6"></asp:Label>
        </div>

        <div class="form">
                <asp:Label ID="lblAgregarSucursal" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Agregar Sucursal"></asp:Label>
        </div>
        
        <table class="form" role="gridcell">
                <tr>
                    <td>
        <asp:Label ID="lblNombreSucursal" runat="server" Text="Nombre Sucursal:"></asp:Label>
                    </td>
                    <td>
        <asp:TextBox ID="txtNombre" runat="server" Width="226px"></asp:TextBox>
                    </td>
                    <td>
        <asp:RequiredFieldValidator ID="rfvNombreSucursal" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revNombreSucursal" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre valido" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]+$" ValidationGroup="Grupo 1">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="lblDescripcion" runat="server" Height="19px" Text="Descripción:" Width="79px"></asp:Label>
                    </td>
                    <td>
            <asp:TextBox ID="txtDescripcion" runat="server" Height="87px" Width="225px" Rows="5" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Debe Ingresar una descripción" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
                    </td>
                    <td>
            <asp:DropDownList ID="ddlProvincias" runat="server" Width="232px">
            </asp:DropDownList>
                    </td>
                    <td>
            <asp:RequiredFieldValidator ID="rfvProvincias" runat="server" ControlToValidate="ddlProvincias" ErrorMessage="Debe seleccionar una Provincia" ForeColor="Red" InitialValue="-- Seleccione --" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
                    </td>

                </tr>
                  <tr>
                    <td>
            <asp:Label ID="lblDireccion" runat="server" Text="Dirección:"></asp:Label>
                    </td>
                    <td>
            <asp:TextBox ID="txtDireccion" runat="server" Width="224px" CssClass="auto-style6"></asp:TextBox>
                    </td>
                    <td>
            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección valida" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]+$" ValidationGroup="Grupo 1">*</asp:RegularExpressionValidator>
                    </td>
                 </tr>
            </table>

            <div class ="form">
                  <asp:Button class="form" ID="btnAceptar" runat="server" Text="Aceptar" ValidationGroup="Grupo 1" OnClick="btnAceptar_Click" CssClass="auto-style1" />
            </div>
            <div class ="form">
                <asp:Label ID="lblAgregado" runat="server"></asp:Label>
                <asp:Label ID="lblPrueba" runat="server"></asp:Label>
            </div>
            <div class ="form">
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Grupo 1" />
            </div>
        </form>
   </body>
</html>
