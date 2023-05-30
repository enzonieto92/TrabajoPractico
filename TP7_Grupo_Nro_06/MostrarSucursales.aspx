<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarSucursales.aspx.cs" Inherits="TP7_Grupo_Nro_06.MostrarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .Buttons
        {
            margin-top: 30px;
            margin-bottom: 30px;
            margin-left:100px;
            margin-right: 100px;
            display: inline;
            padding: 7px 7px;
            background-color: #5D7B9D; 
            border-radius: 5px; 
            text-decoration: none;
        }
        .container{
            display:flex;
            justify-content:center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <div class ="container">
                    <div class="Buttons">
                        <asp:HyperLink ID="hlSucursales" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx" Font-Underline="False" ForeColor="White">Listado de Sucursales</asp:HyperLink>
                    </div>
                    <div class="Buttons">
                        <asp:HyperLink ID="hlMostrarSuc" runat="server" NavigateUrl="~/MostrarSucursales.aspx" Font-Underline="False" ForeColor="White">Mostrar Sucursales Seleccionadas</asp:HyperLink>
                    </div>

            </div>
        <table class="container">
            <tr>
                <td class="container">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" Text="Mostrar sucursales seleccionadas"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="container">
                    <asp:GridView ID="GridView1" runat="server" Width="678px">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
