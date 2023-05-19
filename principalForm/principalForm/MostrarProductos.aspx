<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MostrarProductos.aspx.cs" Inherits="principalForm.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .Ej2
        {
            margin-top: 1rem;
            font-family: Dubai;
            justify-content:center;
            text-align: center;
        }
        .Buttons
        {
            margin-left: 2rem;
            margin-right: 2rem;
            display:inline;
            padding: 10px 20px;
            background-color:#5D7B9D; 
            border-radius: 5px; 
            text-decoration: none;
        }
        .Links{
            margin-top:2rem;
            margin-bottom:2rem;
            display: block;
        }
        .Label{
            margin-top:2rem;
            margin-bottom:2rem;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="Ej2">
        <div class="Links";>
        <asp:Label ID="lblSeleccionados" runat="server" Text="Productos Seleccionados por el Usuario: " Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div>

        <asp:GridView ID="gvSeleccionados" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
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
        <div class="Label">
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" Text="No se cargaron Productos."></asp:Label>
        </div>

        <div class="Buttons";>
        <asp:HyperLink ID="hpVolver" runat="server" NavigateUrl="~/InicioEj2.aspx" Font-Underline="False" ForeColor="White">Volver al Inicio</asp:HyperLink>
        </div>

    </form>
</body>
</html>
