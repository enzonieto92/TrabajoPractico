<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarSucursales.aspx.cs" Inherits="TP7_Grupo_Nro_06.MostrarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            height: 167px;
        }
        .auto-style4 {
            height: 42px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlSucursales" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx">Listado De Sucursales</asp:HyperLink>
                    </td>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hlMostrarSuc" runat="server" NavigateUrl="~/MostrarSucursales.aspx">Mostrar Sucursales Seleccionadas</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" Text="Mostrar sucursales seleccionadas"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:GridView ID="GridView1" runat="server" Width="678px">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
