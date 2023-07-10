<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminReportes.aspx.cs" Inherits="Vistas.adminReportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>
</head>
<body>
    <form id="form2" style ="font-family: sans-serif" runat="server">
        <div>
            
            <header>
                <div>
                        <asp:LinkButton ID="lbCerrarSesión" runat="server" OnClick="lbCerrarSesión_Click" CssClass="btnCerrar">Cerrar sesión</asp:LinkButton>         
                </div>
                <div style="justify-content:center; display:flex;" >
                    <asp:HyperLink ID="hlProductos" runat="server" class="btnCerrar" NavigateUrl="~/adminProductos.aspx" style="margin-right: 20px;">Productos</asp:HyperLink>
                    <asp:HyperLink ID="hlUsuarios" runat="server" class="btnCerrar" NavigateUrl="~/adminUsuario.aspx" style="margin-right: 20px;">Usuarios</asp:HyperLink>
                    <asp:HyperLink ID="hlReportes" runat="server" class="btnCerrar" NavigateUrl="~/adminReportes.aspx" >Reportes</asp:HyperLink>
                </div>
            </header>
       
            <strong>
            <br />
            <br />
            <br />
            <div style="text-align: center;">
            Buscar reporte de venta<br />
            Ingrese N° Factura:<br />
            <asp:TextBox ID="txtReporteDeVenta" runat="server" CssClass="auto-style2" Height="21px" Width="273px"></asp:TextBox>
             &nbsp;
            <asp:Button ID="btnBuscarReporte" CssClass="boton-personalizado" runat="server" Text="Buscar" OnClick="btnBuscarReporte_Click" />
                &nbsp;
            <asp:Button ID="btnQuitarFiltros" CssClass="boton-personalizado" runat="server" OnClick="btnQuitarFiltros_Click" Text="Quitar Filtros" />
            </div>
            
            <br />
            </strong>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <strong>Filtros<br />
                        <br />
                        Filtrar Por Fecha:</strong><br />
                        <asp:DropDownList ID="ddlFiltroFecha" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFiltroFecha_SelectedIndexChanged" Width="200px">
                            <asp:ListItem Value="-1">Seleccione un parametro</asp:ListItem>
                            <asp:ListItem Value="=">Igual</asp:ListItem>
                            <asp:ListItem Value="entre">Entre</asp:ListItem>
                            <asp:ListItem Value="&gt;=">Mayor o Igual</asp:ListItem>
                            <asp:ListItem Value="&lt;=">Menor o Igual</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
    <asp:TextBox ID="txtFecha1" runat="server" TextMode="Date" Visible="False"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="revFecha1" runat="server" ControlToValidate="txtFecha1" ForeColor="Red" ValidationGroup="1">Completar fecha</asp:RequiredFieldValidator>
                        <br />
                        <br />
    <asp:TextBox ID="txtFecha2" runat="server" TextMode="Date" Visible="False"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvFecha2" runat="server" ControlToValidate="txtFecha2" ForeColor="Red" ValidationGroup="1">Completar fecha</asp:RequiredFieldValidator>
                        <br />
                        <asp:Button ID="btnFiltroFecha" CssClass="boton-personalizado" runat="server" OnClick="btnFiltroFecha_Click" Text="Buscar" ValidationGroup="1" visible ="false" />
                        <br />
                        <br />
                        <br />
                        <asp:Panel ID="PanelFiltros" runat="server" Visible="false">
                            <div>

                            <strong><span class="auto-style8">Cantidad de productos vendidos:</span>
                            <asp:Label ID="lblProductosVendidos" runat="server"></asp:Label>
                            </div>
                            <div>
                            <strong>Ingresos totales:  </strong>


                            <asp:Label ID="lblReporteTotal" runat="server"></asp:Label>
                               </div>
                        </asp:Panel>

                        </strong>
                    </td>
                    <td>
                       <div style="justify-content:center;display:flex;">

                        <asp:GridView ID="grvFacturas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999"  BorderStyle="None" BorderWidth="1px" CellPadding="3"   EmptyDataText="No hay resultados." AllowPaging="True" OnRowCommand="grvFacturas_RowCommand" OnPageIndexChanging="grvFacturas_PageIndexChanging1">
                            
                            <Columns>
                                <asp:TemplateField HeaderText="N° Factura">
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_NFactura" runat="server" Text='<%# Bind("NroFactura_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DNI">
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_DNI" runat="server" Text='<%# Bind("DNI_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cod. Metodo Envio">
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_CodMetEnvio" runat="server" Text='<%# Bind("CodMetodoEnvio_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cod. Metodo Pago">
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_CodMetPago_Fa" runat="server" Text='<%# Bind("CodMetodoPago_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha">
                                    <ItemTemplate>
                                        <asp:Label ID="it_lblFecha" runat="server" Text='<%# Bind("Fecha_Fa", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dirección Entrega">
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_DireccionEntrega" runat="server" Text='<%# Bind("DireccionEntrega_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Total" runat="server" Text='<%# Bind("Total_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Button" CommandName="eventoVerMas" HeaderText="Detalle Factura" Text="Ver detalle" />
                            </Columns>
                            <HeaderStyle CssClass="dataGrid-th" />
                        </asp:GridView>
                       </div>
                    </td>
                    <td>&nbsp;
                                                    <asp:GridView ID="grvDetalleFacturas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" AllowPaging="True">
                                                        
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="N°Factura">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblNFactura" runat="server" Text='<%# Bind("NroFactura_Df") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Producto">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblNombreProd" runat="server" Text='<%# Bind("Nombre_Pr") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Categoria">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblCategoria" runat="server" Text='<%# Bind("Descripcion_Cat") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Caracteristicas">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblCaracteristicas" runat="server" Text='<%# Bind("Nombre_Car") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Color">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblColor" runat="server" Text='<%# Bind("Descripcion_Co") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Precio Un.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblPrecioUn" runat="server" Text='<%# Bind("PrecioUnitario_Df") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cantidad">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblCantidad" runat="server" Text='<%# Bind("Cantidad_Df") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="dataGrid-th" />
                                                    </asp:GridView>
                                                </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
