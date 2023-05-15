<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formEjercicio1.aspx.cs" Inherits="principalForm.formEjercicio1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 149px;
        }
        .auto-style2 {
            width: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Label ID="lblProductos" runat="server" Enabled="False" Font-Bold="True" Font-Size="34pt" Text="Productos"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:GridView ID="grdProductos" runat="server" Height="351px" Width="834px" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="grdProductos_RowEditing" OnRowUpdating="grdProductos_RowUpdating">
                            <Columns>
                                <asp:TemplateField HeaderText="ID Producto">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtboxIDProducto" runat="server" Text='<%# Bind("IdProducto") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_IDProducto" runat="server" Text='<%# Bind("IdProducto") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre Producto">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtboxNombreProducto" runat="server" Text='<%# Bind("NombreProducto") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_NombreProducto" runat="server" Text='<%# Bind("NombreProducto") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cantidad Por Unidad">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtbxCantidadUnidad" runat="server" Text='<%# Bind("CantidadPorUnidad") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_CantidadUnidad" runat="server" Text='<%# Bind("CantidadPorUnidad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Precio Unidad">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtbxPrecioUnidad" runat="server" Text='<%# Bind("PrecioUnidad") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_PrecioUnidad" runat="server" Text='<%# Bind("PrecioUnidad") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
