<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agregarSucursal.aspx.cs" Inherits="Vistas.agregarSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 331px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 331px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:HyperLink ID="hlAgregarSucursal" runat="server" NavigateUrl="~/agregarSucursal.aspx">Agregar Sucursal</asp:HyperLink>
                    </td>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlListarSucursal" runat="server" NavigateUrl="~/ListarSucursales.aspx">Lista De Sucursales</asp:HyperLink>
                    </td>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hlEliminarSucursal" runat="server" NavigateUrl="~/EliminarSucursales.aspx">Eliminar Sucursal</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblGrupo" runat="server" Font-Size="20pt" Text="Grupo N° 6"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblAgregar" runat="server" Font-Bold="True" Text="Agregar Sucursal "></asp:Label>
                    </td>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre Surusal: "></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtNombre" runat="server" Width="148px"></asp:TextBox>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDescripcion" runat="server" Height="100px" Width="148px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProvincias" runat="server" Width="148px">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="Label2" runat="server" Text="Dirección:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDireccion" runat="server" Height="50px" Width="148px"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
