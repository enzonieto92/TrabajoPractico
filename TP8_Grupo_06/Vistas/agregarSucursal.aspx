<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarSucursal.aspx.cs" Inherits="Vistas.agregarSucursal" %>

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
                resize: none;
                padding: 20px;
                display: flex;
			    justify-content: center;
			    gap: 20px;
            }
            .txtbox{
                resize: none;
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
                        <asp:Label ID="lblGrupo" runat="server" Font-Size="20pt" Text="Grupo N° 6"></asp:Label>
                    </div>

                    <div class="form">
                        <asp:Label ID="lblAgregar" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Agregar Sucursal "></asp:Label>
                    </div>

               <table class="form" role="gridcell">

                    <tr>
                        <td>
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre Surusal: "></asp:Label>
                        </td>

                        <td>
                        <asp:TextBox ID="txtNombre" runat="server" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre valido" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]+$" ValidationGroup="Grupo 1">*</asp:RegularExpressionValidator>
                        </td>

                    </tr>

                    <tr>
                        <td>
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:"></asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" CssClass="txtbox" Height="100px" Width="152px">
                        </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Ingrese una descripción" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>

                        <td>
                        <asp:Label ID="lblProvincia" runat="server" Text="Provincia:">
                        </asp:Label>
                        </td>

                        <td>
                        <asp:DropDownList ID="ddlProvincias" runat="server" Width="158px">

                        </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlProvincias" ErrorMessage="Seleccione una provincia" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
                        </td>

                    </tr>

                    <tr>

                        <td>
                        <asp:Label ID="lblDireccion" runat="server" Text="Dirección:"></asp:Label>
                        </td>

                        <td>
                        <asp:TextBox ID="txtDireccion" runat="server" Height="19px" Width="150px">
                        </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección valida" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]+$" ValidationGroup="Grupo 1">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                   <tr>
                       <td>
                       </td>
                           <td class="links">
                    <asp:Button ID="btnAgregar" Width="75px"  runat="server" Text="Agregar" ValidationGroup="Grupo 1" />
                           </td>
                       </tr>

               </table>


                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="Grupo 1" />


    </form>
</body>
</html>
