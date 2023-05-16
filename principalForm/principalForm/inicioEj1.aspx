<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicioEj1.aspx.cs" Inherits="principalForm.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 250px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="lblTitulo" runat="server" EnableTheming="True" Font-Bold="True" Font-Italic="False" Font-Size="34pt" Text="Grupo N° 6"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="lnkEjercicio1" runat="server" OnClick="lnkEjercicio1_Click">Ejercicio1</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="lnkEjercicio2" runat="server" OnClick="lnkEjercicio2_Click">Ejercicio 2</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
