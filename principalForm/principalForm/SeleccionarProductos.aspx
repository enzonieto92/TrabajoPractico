<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarProductos.aspx.cs" Inherits="principalForm.SeleccionarProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 539px;
        }
        .auto-style2 {
            height: 458px;
        }
        .auto-style3 {
            height: 458px;
            width: 827px;
        }
        .auto-style4 {
            width: 827px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:GridView ID="GridView1" runat="server" Height="417px" Width="823px">
                    </asp:GridView>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblSelect" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:LinkButton ID="lnkInicio" runat="server" OnClick="lnkInicio_Click">Volver al Inicio</asp:LinkButton>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
