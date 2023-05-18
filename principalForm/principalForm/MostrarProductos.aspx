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
        <asp:GridView ID="gvSeleccionados" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
            <br />
            <br />
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" Text="No se cargaron Productos."></asp:Label>
            <br />
            <br />
        </div>

        <div class="form";>
        <asp:HyperLink ID="hpVolver" runat="server" NavigateUrl="~/InicioEj2.aspx">Volver al Inicio</asp:HyperLink>
        </div>
    </form>
</body>
</html>
