<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarProductos.aspx.cs" Inherits="principalForm.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        /*.form{
            text-align: center;
        }
        .grid{
            justify-content: center;
        }*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form";>
        <asp:Label ID="lblSeleccionados" runat="server" Text="Productos Seleccionados por el Usuario: " Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div>

        <div class="grid";>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        </div>

        <div class="form";>
        <asp:HyperLink ID="hpVolver" runat="server" NavigateUrl="~/InicioEj2.aspx">Volver al Inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
