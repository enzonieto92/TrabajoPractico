<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarProductos.aspx.cs" Inherits="principalForm.SeleccionarProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .Ej1
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
        .Label{
            margin-top:2rem;
            margin-bottom:2rem;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="Ej1">
        <div class="Links">
                        <asp:Label ID="lblEjercicio1" runat="server" Text="Ejercicio N°2"></asp:Label>
        </div>

        <div>
                    <asp:GridView ID="grdSeleccionarProductos" Height="351px" Width="831px" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="grdSeleccionarProductos_PageIndexChanging" PageSize="14" AutoGenerateSelectButton="True" CellPadding="4" OnSelectedIndexChanging="grdSeleccionarProductos_SelectedIndexChanging" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
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

                     <div class ="Label">
                        <asp:Label ID="lblSelect" runat="server"></asp:Label>
                         <br />
                         </div>   

                   <div class="Buttons">
                        <asp:HyperLink ID="hpVolverInicio" runat="server" NavigateUrl="~/InicioEj2.aspx" Font-Underline="False" ForeColor="White">Volver al Inicio</asp:HyperLink>
                    </div>   
            </div>

        </form>
    </body>
</html>
