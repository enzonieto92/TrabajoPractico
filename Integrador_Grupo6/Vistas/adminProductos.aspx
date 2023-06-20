<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminProductos.aspx.cs" Inherits="Vistas.adminProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>
    <style type="text/css">
        .auto-style1 {
            width: 250px;
        }
        .auto-style2 {
            width: 251px;
        }
        .auto-style3 {
            width: 185px;
        }
        .auto-style4 {
            width: 219px;
        }
        .auto-style6 {
            width: 253px;
            height: 64px;
        }
        .auto-style7 {
            width: 428px;
            height: 64px;
        }
        .auto-style8 {
            width: 253px;
            height: 66px;
        }
        .auto-style10 {
            width: 219px;
            height: 114px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbCerrarSesión" runat="server" OnClick="lbCerrarSesión_Click">Cerrar sesión</asp:LinkButton>
            <br />
            <asp:HyperLink ID="hlProductos" runat="server" NavigateUrl="~/adminProductos.aspx">Productos</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
            <asp:HyperLink ID="hlUsuarios" runat="server" NavigateUrl="~/adminUsuario.aspx">Usuarios</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hlReportes" runat="server" NavigateUrl="~/adminReportes.aspx">Reportes</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style8"><strong>&nbsp;</strong></span><span class="auto-style7"><strong>Productos</strong></span><br />
            <br />
            <br />
            <strong>Filtros</strong><br />
            <asp:DropDownList ID="ddlFiltro" runat="server" CssClass="auto-style12">
                <asp:ListItem Value="CodProducto_Pr">Codigo Producto</asp:ListItem>
                <asp:ListItem Value="CodMarca_Pr">Marca</asp:ListItem>
                <asp:ListItem Value="CodCategoria_Pr">Categoría</asp:ListItem>
                <asp:ListItem Value="Nombre_Pr">Nombre</asp:ListItem>
                <asp:ListItem Value="Descripcion_Pr">Descripcion</asp:ListItem>
                <asp:ListItem Value="Estado_Pr">Estado de Producto</asp:ListItem>
                <asp:ListItem Value="PrecioUnitario_Pr">Precio Unitario</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtFiltro" runat="server" CssClass="auto-style11"></asp:TextBox>
            <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" OnClick="btnQuitarFiltro_Click" />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:GridView ID="grvProductos" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style3" AllowPaging="True" OnRowDeleting="grvProductos_RowDeleting" OnPageIndexChanging="grvProductos_PageIndexChanging" OnRowCancelingEdit="grvProductos_RowCancelingEdit" OnRowEditing="grvProductos_RowEditing" OnRowUpdating="grvProductos_RowUpdating">
                            <AlternatingRowStyle BackColor="Gainsboro" />
                            <Columns>
                                <asp:TemplateField HeaderText="Codigo Producto">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCodigoEdit" runat="server" Text='<%# Bind("CodProducto_Pr") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodProd" runat="server" Text='<%# Bind("CodProducto_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codigo Marca">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtMarcaEdit" runat="server" Text='<%# Bind("Descripcion_Ma") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodMarca" runat="server" Text='<%# Bind("Descripcion_Ma") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codigo Categoria">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCategoriaEdit" runat="server" Text='<%# Bind("Descripcion_Cat") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodCat" runat="server" Text='<%# Bind("Descripcion_Cat") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNombreEdit" runat="server" Text='<%# Bind("Nombre_Pr") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Nombre" runat="server" Text='<%# Bind("Nombre_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Descripcion">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDescripcionEdit" runat="server" Text='<%# Bind("Descripcion_Pr") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Desc" runat="server" Text='<%# Bind("Descripcion_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ImageField DataImageUrlField="URLimagen_Pr" HeaderText="Imagen">
                                    <ControlStyle Height="40px" Width="50px" />
                                </asp:ImageField>
                                <asp:TemplateField HeaderText="Precio Unitario">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPrecioEdit" runat="server" Text='<%# Bind("PrecioUnitario") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Precio" runat="server" Text='<%# Bind("PrecioUnitario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbEstado" runat="server" Checked='<%# Bind("Estado_Pr") %>'/>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ch_it_estado" runat="server" Checked='<%# Bind("Estado_Pr") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="Resultado" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <strong>
            <br class="auto-style6" />
            <span class="auto-style6">Ingresar Producto:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ingresar Stock del Producto:<br />
            <br />
            </span>
            <span class="auto-style15">Código de Producto<br />
            </span>
            <asp:TextBox ID="txtCodProd" runat="server" MaxLength="6"></asp:TextBox>
&nbsp;</strong><table>
                <tr>
                    <td class="auto-style4"><strong>Nombre<br />
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="auto-style11" MaxLength="20"></asp:TextBox>
                        <br />
                        </strong></td>
                    <td class="auto-style4"><strong>Categoría<br />
                        <asp:DropDownList ID="ddlCategoriaProducto" runat="server">
                        </asp:DropDownList>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style4"><strong>Marca<br />
                        <asp:DropDownList ID="ddlMarcas" runat="server">
                        </asp:DropDownList>
                        </strong></td>
                    <td class="auto-style4"><strong>Color<br />
                        <asp:DropDownList ID="ddlColorProducto" runat="server">
                        </asp:DropDownList>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>
                        <asp:Label ID="Label27" runat="server" Text="Precio Unitario"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtPrecioUnitario" runat="server" CssClass="auto-style16"></asp:TextBox>
                        <br />
                        </strong></td>
                    <td class="auto-style10"><strong>
                        <asp:Label ID="Label28" runat="server" Text="Stock"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtStock" runat="server" CssClass="auto-style16" TextMode="Number"></asp:TextBox>
                        </strong></td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Cargar Imagen del Producto<br />
                        <asp:FileUpload ID="FileUploadImagenProd" runat="server" />
                        <br />
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style12" colspan="2"><strong>Descripcion<br />
                        <asp:TextBox ID="txtDescripcion" runat="server" Height="115px" MaxLength="100" TextMode="MultiLine" Width="431px" ValidationGroup="1"></asp:TextBox>
                        <br />
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td class="auto-style4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="btnIngresarProducto" runat="server" Text="Ingresar Producto" ValidationGroup="1" OnClick="btnIngresarProducto_Click" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnIngresarStock" runat="server" Text="Ingresar Stock" ValidationGroup="2" OnClick="btnIngresarStock_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMensajeAgregado" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
