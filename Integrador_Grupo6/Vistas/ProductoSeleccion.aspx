<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductoSeleccion.aspx.cs" Inherits="Vistas.ProductoSeleccion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        		<div class="wrapper">
			<div class="logo">TECNOVATOS</div>
			
			<nav>
                <asp:LinkButton ID="btnInicio" runat="server" PostBackUrl="Inicio.aspx" Text="Inicio"></asp:LinkButton>
                <asp:LinkButton ID="btnUsuario" runat="server" PostBackUrl="DetallesUsuario.aspx"></asp:LinkButton>
                <asp:LinkButton ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" OnClick="CerrarSesion"></asp:LinkButton>
			    <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/Imagenes/Iconos/carrito.png" Width="37px" href="Carrito.aspx" OnClick="ImageButton2_Click1"/>
           </nav>
		</div>
    </header>

        <asp:ListView ID="lvProductoMas" runat="server" DataKeyNames="CodProducto_Pr">
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No se han devuelto datos.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <<td runat="server" class="estiloListView">&nbsp;<strong><asp:Label ID="Nombre_PrLabel" runat="server" Text='<%# Eval("Nombre_Pr") %>'></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Descripcion_PrLabel" runat="server" Text='<%# Eval("Descripcion_Pr") %>'></asp:Label>
                    <br />
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="ibtnProducto" runat="server" CommandName="eventoVerMas" Height="200px" ImageUrl='<%# Eval("URLImagen_Pr") %>' Width="200px" />
                    <br />
                    <br />
                    $<asp:Label ID="PrecioUnitario_PrLabel" runat="server" Text='<%# Eval("PrecioUnitario") %>' />
                    <br />
                    <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("Nombre_Pr") + "-" + Eval("PrecioUnitario") %>' CommandName="eventoAgregar" OnCommand="btnAgregar_Command"  Text="Agregar" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
<p>
    Caracteristica<br/>
    <asp:DropDownList runat="server" ID="ddlcaracteristica" AutoPostBack="True" OnSelectedIndexChanged="ddlCaracteristica_SelectedIndexChanged" Width="90px" Height="17px">
    </asp:DropDownList>
    <br/>Color<br/>
    <asp:DropDownList runat="server" ID="ddlColor" AutoPostBack="True" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged">
    </asp:DropDownList>
    <br/>Cantidad<br/>
    <asp:DropDownList runat="server" ID="ddlCantidad" AutoPostBack="True" Height="18px" Width="91px">
    </asp:DropDownList>
</p>
<br />
<p>
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
</p>
        </form>
</body>
</html>
