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
                        </td>

                    </tr>

                    <tr>
                        <td>
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:"></asp:Label>
                        </td>
                        <td>
                        <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" CssClass="txtbox" Height="100px" Width="152px">
                        </asp:TextBox>
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
                        </td>

                    </tr>

                    <tr>

                        <td>
                        <asp:Label ID="lblDireccion" runat="server" Text="Dirección:"></asp:Label>
                        </td>

                        <td>
                        <asp:TextBox ID="txtDireccion" runat="server" Height="19px" Width="150px">
                        </asp:TextBox>
                        </td>
                    </tr>

               </table>

    </form>
</body>
</html>
