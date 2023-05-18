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
                    <asp:GridView ID="grdSeleccionarProductos" runat="server" Height="417px" Width="823px" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="grdSeleccionarProductos_PageIndexChanging" PageSize="14" AutoGenerateSelectButton="True" OnSelectedIndexChanging="grdSeleccionarProductos_SelectedIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" >
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="Id Producto">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_IdProducto" runat="server" Text='<%# Bind("IdProducto") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre Producto">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_NombreProducto" runat="server" Text='<%# Bind("NombreProducto") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Id Proveedor">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_IdProveedor" runat="server" Text='<%# Bind("IdProveedor") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Precio Unitario">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_PrecioUnitario" runat="server" Text='<%# Bind("PrecioUnidad") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
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
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblSelect" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:HyperLink ID="hpVolverInicio" runat="server" NavigateUrl="~/InicioEj2.aspx">Volver al Inicio</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
