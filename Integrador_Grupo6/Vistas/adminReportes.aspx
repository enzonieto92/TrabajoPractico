<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminReportes.aspx.cs" Inherits="Vistas.adminReportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            &nbsp;<span class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style12"><strong>Reportes</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <br />
            <asp:LinkButton ID="lbProcudctos" runat="server" PostBackUrl="~/AdminProducto.aspx" OnClick="lbProcudctos_Click">Productos</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbUsuarios" runat="server" PostBackUrl="~/AdminUsuario.aspx" OnClick="lbUsuarios_Click">Usuarios</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbReportes" runat="server" PostBackUrl="~/adminReportes.aspx" OnClick="lbReportes_Click">Reportes</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:LinkButton ID="lbCerrarSesión" runat="server" OnClick="lbCerrarSesión_Click">Cerrar sesión</asp:LinkButton>
            <strong>
            <br />
            <br />
            <br />
            Buscar reporte de venta<br />
            Ingrese N° Factura:<br />
            <asp:TextBox ID="txtReporteDeVenta" runat="server" CssClass="auto-style2" Height="21px" Width="273px"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Button ID="btnBuscarReporte" runat="server" Text="Buscar" OnClick="btnBuscarReporte_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnQuitarFiltros" runat="server" OnClick="btnQuitarFiltros_Click" Text="Quitar Filtros" />
            <br />
            </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <strong>Filtros&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <br />
                        Filtrar Por Fecha:</strong><br />
            <strong>
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
                        
                        <br />
    <asp:TextBox ID="txtFecha2" runat="server" TextMode="Date" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnFiltroFecha" runat="server" OnClick="btnFiltroFecha_Click" Text="Buscar" ValidationGroup="1" />
                        <br />
                        <br />
                        <br />
                        <asp:Panel ID="PanelFiltros" runat="server" Visible="true">
                            <strong><span class="auto-style8">Cantidad de productos vendidos:</span>
                            <asp:Label ID="lblProductosVendidos" runat="server"></asp:Label>
                            </strong>
                            <br />
                            <strong>
                            <asp:Button ID="btnFiltroVentas" runat="server" OnClick="btnFiltroVentas_Click" Text="Buscar" ValidationGroup="2" />
                            <br />
                            </strong>
                            <br />
                            <br />
                            <strong>Ingresos totales:<br />
                            <asp:Label ID="lblReporteTotal" runat="server"></asp:Label>
                            <br />
                            </strong>
                            <asp:Button ID="btnFiltroTotal" runat="server" OnClick="btnFiltroTotal_Click" Text="Buscar" ValidationGroup="3" />
                        </asp:Panel>
                        </strong>
                    </td>
                    <td>
                        <asp:GridView ID="grvFacturas" runat="server" AutoGenerateColumns="False"  BorderWidth="1px" CellPadding="3"   EmptyDataText="No hay resultados." AllowPaging="True">
                            
                            <Columns>
                                <asp:TemplateField HeaderText="N° Factura">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cod. Metodo Envio">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cod. Metodo Pago">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dirección Entrega">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Button" CommandName="eventoVerMas" HeaderText="Detalle Factura" Text="Ver detalle" />
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>&nbsp;
                                                    <asp:GridView ID="grvDetalleFacturas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" AllowPaging="True">
                                                        
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="N°Factura">
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Producto">
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Categoria">
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Precio Un.">
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cantidad">
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
