<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Vistas.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Carrito</title>

    <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>

    <style type="text/css">

        .auto-style1 {
            width: 315px;
        }
        .auto-style2 {
            width: 64px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        		<div class="wrapper">
			<div class="logo">TECNOVATOS</div>
			
			<nav>
                <asp:LinkButton ID="btnInicio" runat="server" TabIndex="-1" Text="Inicio" PostBackUrl="Inicio.aspx"></asp:LinkButton>
                <asp:LinkButton ID="btnUsuario" runat="server" OnClick="btnUsuario_Click"></asp:LinkButton>

                <asp:LinkButton ID="btnCerrarSesion" runat="server" OnClick="btnCerrarSesion_Click">Cerrar Sesión</asp:LinkButton>

			    <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/Imagenes/Iconos/carrito.png" Width="37px" href="Carrito.aspx" OnClick="ImageButton2_Click1"/>
           </nav>
		</div>
    </header>


            <div style="display:flex;justify-content:center;" class="encabezado">

                <asp:Label ID="lblEncabezadoCarrito" runat="server" Text="Artículos en carrito"></asp:Label>

            </div>
        <div style="display:flex;justify-content:center;">
            <asp:GridView ID="gvProductosCarrito" runat="server" AutoGenerateColumns="False" DataKeyNames="CodProducto_Pro" HeaderStyle-CssClass="dataGrid-th">
                <Columns>
                    <asp:ImageField DataImageUrlField="imgURL_Pro" HeaderText="Imagen">
                        <ControlStyle Height="40px" Width="50px" />
                        <HeaderStyle HorizontalAlign="Center" Width="100px" />
                        <ItemStyle Height="5px" HorizontalAlign="Center" Width="5px" Wrap="True" />
                    </asp:ImageField>
                    <asp:BoundField DataField="CodProducto_Pro" HeaderText="Código" ReadOnly="True" SortExpression="CodProducto_Pro">
                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Nombre_Pro" HeaderText="Nombre" SortExpression="Nombre_Pro">
                    <HeaderStyle HorizontalAlign="Center" Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Descripcion_Pro" HeaderText="Descripcion" SortExpression="Descripcion_Pro">
                    <ControlStyle Width="100px" />
                    <HeaderStyle HorizontalAlign="Center" Width="800px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PrecioUnitario_Pro" HeaderText="Precio Unitario" SortExpression="PrecioUnitario_Pro">
                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Imagenes/Iconos/tachobasura.png" HeaderText="Quitar" ShowDeleteButton="True">
                    <HeaderStyle Width="50px" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Columns>
                <HeaderStyle CssClass="dataGrid-th" />
            </asp:GridView>
                    <asp:GridView ID="grdCarrito" runat="server" Width="211px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AllowPaging="True">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle CssClass="dataGrid-th" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            <asp:Label ID="lblMensaje" runat="server" Font-Size="15pt"></asp:Label>
            <asp:Label ID="lblCarroVacio" runat="server" Font-Size="15pt" ForeColor="Red"></asp:Label>
        </div>
        <div class="encabezado" style="display:flex;justify-content:center; margin-top: 10px; background-color:darkred">
            <asp:Label ID="lblTotal" runat="server" Text="Total: $"></asp:Label>
            <asp:Label ID="lblImporte" runat="server" Text="-"></asp:Label>
        </div>
        <div style="display:flex;justify-content:center; margin-top: 10px">
            <asp:Button class="boton-personalizado" style="margin: 10px" ID="btnConfirmar" runat="server" Text="Confirmar" OnClick="btnConfirmar_Click" />
            <asp:Button class="boton-personalizado" style="margin: 10px" ID="btnVaciar" runat="server" Text="Vaciar Carrito" OnClick="btnVaciar_Click" />
        </div>


        <asp:Panel ID="PanelMetodos" runat="server">
            <p>
        <strong>Formas de Envio</strong></p>
    <p>
        <asp:DropDownList ID="ddl_FormasEnvio" runat="server" AutoPostBack="True" ValidationGroup="Grupo0" OnSelectedIndexChanged="ddl_FormasEnvio_SelectedIndexChanged">
            <asp:ListItem Value="0">---Forma de Envio---</asp:ListItem>
            <asp:ListItem Value="1">Retiro en Sucursal</asp:ListItem>
            <asp:ListItem Value="2">A Domicilio</asp:ListItem>
        </asp:DropDownList>
        &nbsp;<asp:RequiredFieldValidator ID="rfv_FormaEnvio" runat="server" ControlToValidate="ddl_FormasEnvio" ErrorMessage="Seleccione un metodo de envio" ForeColor="Red" InitialValue="---Forma de Envio---" ValidationGroup="Grupo0"></asp:RequiredFieldValidator>
            </p>
    <asp:Panel ID="PanelFormaEnvio" runat="server">
        Direccion de Entrega:&nbsp;&nbsp;
        <asp:TextBox ID="txtDireccionEntrega" runat="server" MaxLength="40" ValidationGroup="Grupo1"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="rfv_Dir" runat="server" ControlToValidate="txtDireccionEntrega" ErrorMessage="Ingrese una direccion de entrega" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
        <br />
        Ciudad:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtCiudad" runat="server" ValidationGroup="Grupo1"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="rfv_Ciu" runat="server" ControlToValidate="txtCiudad" ErrorMessage="Ingrese un ciudad" ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
        <br />
        Provincia:&nbsp;&nbsp;
        <asp:TextBox ID="txtProvincia" runat="server" ValidationGroup="Grupo1"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="rfv_Prov" runat="server" ControlToValidate="txtProvincia" ErrorMessage="Ingrese una provincia " ForeColor="Red" ValidationGroup="Grupo1"></asp:RequiredFieldValidator>
        </asp:Panel>
    <br />
    <table class="auto-style12">
        <tr>
            <td class="auto-style1">
        <strong>Formas de Pago</strong><br />
        <asp:Button ID="btnTarjeta" runat="server" Text="Tarjeta" CssClass="boton-personalizado" OnClick="btnTarjeta_Click" Width="114px" ValidationGroup="Grupo0" />
        <br />
                <br />
        <asp:Button ID="btnEfectivo" runat="server" Text="Efectivo" CssClass="boton-personalizado" Width="127px" OnClick="btnEfectivo_Click" ValidationGroup="Grupo0" />
            </td>
            <td class="auto-style2">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                DNI:<br />
            </td>
            <td>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="lbl_DNI" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1"></td>
            <td class="auto-style2">Nombre:
                <br />
            </td>
            <td>
                <asp:Label ID="lbl_Nombre" runat="server"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">Apellido:&nbsp; </td>
            <td>
                <asp:Label ID="lbl_Apellido" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="PanelTarjeta" runat="server">
        <br />
        <span><strong>Tarjeta de Credito</strong></span><br />
        <br />
        Numero de Tarjeta:<asp:TextBox ID="txt_Tarjeta" runat="server" MaxLength="16" ValidationGroup="Grupo2"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="rfv_Tarjeta" runat="server" ControlToValidate="txt_Tarjeta" ErrorMessage="Ingresar Numero de Tarjeta" ForeColor="Red" ValidationGroup="Grupo2"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rev_Tarjeta" runat="server" ControlToValidate="txt_Tarjeta" ErrorMessage="Numero de Tarjeta No Valido" ForeColor="Red" ValidationExpression="^\d*$" ValidationGroup="Grupo2"></asp:RegularExpressionValidator>
        <br />
        Titular Tarjeta:<asp:TextBox ID="txt_Titular" runat="server" ValidationGroup="Grupo2"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="rfv_Titular" runat="server" ControlToValidate="txt_Titular" ErrorMessage="Ingresar Nombre del Titular" ForeColor="Red" ValidationGroup="Grupo2"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rev_Titular" runat="server" ControlToValidate="txt_Titular" ErrorMessage="Ingresar Nombre Valido" ForeColor="Red" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" ValidationGroup="Grupo2"></asp:RegularExpressionValidator>
        <br />
        Fecha de Vencimiento(MM/AA):<asp:TextBox ID="txt_Vencimiento" runat="server" Width="151px" TextMode="Month" ValidationGroup="Grupo2"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="rfv_Vencimiento" runat="server" ControlToValidate="txt_Vencimiento" ErrorMessage="Ingresar Fecha de Vencimiento" ForeColor="Red" ValidationGroup="Grupo2"></asp:RequiredFieldValidator>
        <br />
        Codigo de Seguridad:<asp:TextBox ID="txt_CodigoSeg" runat="server" Width="83px" ValidationGroup="Grupo2"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="rfv_CodigoSeg" runat="server" ControlToValidate="txt_CodigoSeg" ErrorMessage="Ingresar Codigo de Seguridad" ForeColor="Red" ValidationGroup="Grupo2"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rev_CodigoSeg" runat="server" ControlToValidate="txt_CodigoSeg" ErrorMessage="Codigo de Seguridad Erroneo" ForeColor="Red" ValidationExpression="^\d*$" ValidationGroup="Grupo2"></asp:RegularExpressionValidator>
        <br />
        Cuotas:
        <asp:DropDownList ID="ddl_Cuotas" runat="server" ValidationGroup="Grupo2">
            <asp:ListItem Value="--Seleccionar Cuotas--">--Seleccionar Cuotas--</asp:ListItem>
            <asp:ListItem>1 Cuota</asp:ListItem>
            <asp:ListItem>3 Cuota</asp:ListItem>
            <asp:ListItem>6 Cuota</asp:ListItem>
            <asp:ListItem>9 Cuota</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_Cuotas" ForeColor="Red" InitialValue="--Seleccionar Cuotas--" ValidationGroup="Grupo2">Seleccionar Cuotas</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btn_PagarTarj" runat="server" Text="Pagar" CssClass="boton-personalizado" OnClientClick="return validate();" ValidationGroup="Grupo2"  OnClick="btn_PagarTarj_Click" Width="133px" />
        <br />
        <br />
    </asp:Panel>
            
    <asp:Panel ID="PanelEfectivo" runat="server">
        <br />
        <span><strong>Efectivo</strong></span><br />
        <br />
        <asp:DropDownList ID="ddl_Efectivo" runat="server" ValidationGroup="Grupo3">
            <asp:ListItem>--Seleccionar Opcion--</asp:ListItem>
            <asp:ListItem Value="1">Pago Facil</asp:ListItem>
            <asp:ListItem Value="2">Rapi Pago</asp:ListItem>
            <asp:ListItem Value="3">Sucursal</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfv_Efectivo" runat="server" ControlToValidate="ddl_Efectivo" ForeColor="Red" InitialValue="--Seleccionar Opcion--" ValidationGroup="Grupo3">Seleccionar Opcion</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btn_PagarEfec" runat="server" Text="Pagar" CssClass="boton-personalizado" OnClientClick="return validate();" ValidationGroup="Grupo3"  OnClick="btn_PagarEfec_Click" Width="138px" />
    </asp:Panel>
                <asp:ScriptManager ID="ScriptManager2" runat="server">
                </asp:ScriptManager>
          <script type="text/javascript" language="javascript" >
              
             function validate() {
                 if (Page_ClientValidate()) {
                     return confirm('¿Está seguro de realizar la compra?');

                 }
             }
          </script>
    <p>
        <asp:Label ID="Label4" runat="server"></asp:Label>
    </p>
            </asp:Panel>
    </form>
</body>
</html>