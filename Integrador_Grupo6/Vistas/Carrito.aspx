<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Vistas.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Carrito</title>

    <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>

    <style type="text/css">

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        		<div class="wrapper">
			<div class="logo">TECNO UTN</div>
			
			<nav>
				<a href="inicio.aspx">
                    Inicio
				</a>
                <asp:LinkButton ID="btnAbrirPopup" runat="server" OnClick="btnAbrirPopup_Click">Iniciar Sesión</asp:LinkButton>

                <asp:LinkButton ID="btnRegistrarse" runat="server" OnClick="btnAbrirPopup2_Click"> Registrarse</asp:LinkButton>

			    <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/Imagenes/Iconos/carrito.png" Width="37px" href="Carrito.aspx" OnClick="ImageButton2_Click1"/>
           </nav>
		</div>
    </header>
            <asp:Panel ID="Panelpopup" runat="server" Visible="False">
    <div id="miPopup" class="popup">
            <div class="popup-contenido">
                <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Imagenes/Iconos/cruz.png" style="position: relative; top: 10px; left: 265px;" OnClick="btnCerrar_Click"/>
                <h2 style="text-align:center; font-family:sans-serif;">
                <asp:Label ID="lblRegistrarse" runat="server" Text="Inicio de Sesión"></asp:Label> 
                </h2>
                <div class="Datos">
    <div class="Form">

        <asp:Label ID="lblUsuario" runat="server" class="Label" Text="Usuario: " ></asp:Label>
        <asp:TextBox ID="txtUsuario" runat="server" class="TextBox" AutoCompleteType="Disabled"></asp:TextBox>

    </div>

    <div class="Form">

            <asp:Label ID="lblContraseña" runat="server" class="Label" Text="Contraseña:" BackColor="#232F3B"></asp:Label>
            <asp:TextBox ID="txtContraseña" runat="server" class="TextBox" TextMode="Password"></asp:TextBox> 
    </div>
</div>
                <div class="Hyperlink">
                    <asp:HyperLink ID="HlOlvidar" runat="server" Text="¿Olvidaste tu contraseña?" font-name="sans-serif"  ForeColor="SkyBlue" Font-Size="10px" NavigateUrl="~/iniciarSesion.aspx"></asp:HyperLink> 
                </div>

                    
        <div class="Button">
                <asp:Button ID="btnRegistrase" class="boton-personalizado" runat="server"  Text="Iniciar Sesión"/>
                </div>   

            </div>
    </div>
    </asp:Panel>

        <asp:Panel ID="Panelpopup2" runat="server">
       <div id="PopupRegistro" class="popup">
             <div class="popup-contenido" style="height:500px; width: 500px;">
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Imagenes/Iconos/cruz.png" style="position: relative; top: 10px; left:465px;" OnClick="btnCerrar2_Click"/>
                    <h2 style="text-align:center; font-family:sans-serif;">
                    <asp:Label ID="Label1" runat="server" Text="Registrarse"></asp:Label> 
                    </h2>
                    <div class="Datos">
        <div class="Form">

            <asp:Label ID="Label2" runat="server" class="Label" Text="Usuario: " ></asp:Label>
            <asp:TextBox ID="txtboxUsuario" runat="server" class="TextBox" AutoCompleteType="Disabled"></asp:TextBox>

        </div>

        <div class="Form">

                <asp:Label ID="Label3" runat="server" class="Label" Text="Contraseña:" BackColor="#232F3B"></asp:Label>
                <asp:TextBox ID="txtboxContraseña" runat="server" class="TextBox" TextMode="Password"></asp:TextBox> 
        </div>
        <div class="Form">
                <asp:Label ID="lblRepContraseña" runat="server" class="Label" Text="Repita la contraseña:"></asp:Label>
               <asp:TextBox ID="txtRepContraseña" runat="server" class="TextBox" TextMode="password"></asp:TextBox>
        </div>

       <div class="Form">

                        <asp:Label ID="lblEmail" runat="server" class="Label" Text="Email:"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" class="TextBox"></asp:TextBox>

       </div>

        <div class="Form">

                        <asp:Label ID="lblRepEmail" runat="server" class="Label" Text="Repita el Email:"></asp:Label>

                        <asp:TextBox ID="txtRepEmail" class="TextBox" runat="server" ></asp:TextBox>
        </div>
                        <div class="Button">
                        <asp:Button ID="Button1" runat="server" class="boton-personalizado" Text="Registrarse" font-family="sans-serif" Font-Size="Medium"   />
                        </div>
    </div>

              </div>
       </div>
        </asp:Panel>
            <div style="display:flex;justify-content:center;" class="encabezado">

                <asp:Label ID="lblEncabezadoCarrito" runat="server" Text="Artículos en carrito"></asp:Label>

            </div>
        <div style="display:flex;justify-content:center;">
            <asp:GridView ID="gvProductosCarrito" runat="server" AutoGenerateColumns="False" DataKeyNames="CodProducto_Pro" DataSourceID="SqlDataSource1" HeaderStyle-CssClass="dataGrid-th">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>
        <div class="encabezado" style="display:flex;justify-content:center; margin-top: 10px; background-color:darkred">
            <asp:Label ID="lblTotal" runat="server" Text="Total: $"></asp:Label>
            <asp:Label ID="lblImporte" runat="server" Text="-"></asp:Label>
        </div>
        <div style="display:flex;justify-content:center; margin-top: 10px">
            <asp:Button class="boton-personalizado" style="margin: 10px" ID="btnConfirmar" runat="server" Text="Confirmar" />
            <asp:Button class="boton-personalizado" style="margin: 10px" ID="btnVaciar" runat="server" Text="Vaciar Carrito" />
        </div>


        <asp:Panel ID="PanelMetodos" runat="server">
            <p>
        <strong>Formas de Envio</strong></p>
    <p>
        <asp:DropDownList ID="ddl_FormasEnvio" runat="server" AutoPostBack="True" ValidationGroup="Grupo0">
            <asp:ListItem>---Forma de Envio---</asp:ListItem>
            <asp:ListItem Value="1">Retiro en Sucursal</asp:ListItem>
            <asp:ListItem Value="2">A Domicilio</asp:ListItem>
        </asp:DropDownList>
        &nbsp;</p>
    <asp:Panel ID="PanelFormaEnvio" runat="server">
        Direccion de Entrega:&nbsp;&nbsp;
        <asp:TextBox ID="txtDireccionEntrega" runat="server" MaxLength="40" ValidationGroup="Grupo1"></asp:TextBox>
        &nbsp;<br />
        Ciudad:&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtCiudad" runat="server" ValidationGroup="Grupo1"></asp:TextBox>
        &nbsp;
        <br />
        Provincia:&nbsp;&nbsp;
        <asp:TextBox ID="txtProvincia" runat="server" ValidationGroup="Grupo1"></asp:TextBox>
        &nbsp;
        </asp:Panel>
    <br />
    <table class="auto-style12">
        <tr>
            <td class="auto-style10">
                <br />
                <br />
        <strong>Formas de Pago</strong><br />
        <asp:Button ID="btnTarjeta" runat="server" Text="Tarjeta" CssClass="boton-personalizado" OnClick="btnTarjeta_Click" Width="114px" ValidationGroup="Grupo0" />
        <br />
                <br />
        <asp:Button ID="btnEfectivo" runat="server" Text="Efectivo" CssClass="boton-personalizado" Width="114px" OnClick="btnEfectivo_Click" ValidationGroup="Grupo0" />
            </td>
            <td>
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
                <asp:Label ID="lbl_DNI" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>Nombre:
                <br />
            </td>
            <td>
                <asp:Label ID="lbl_Nombre" runat="server"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Apellido:&nbsp; </td>
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
        <br />
        Titular Tarjeta:<asp:TextBox ID="txt_Titular" runat="server" ValidationGroup="Grupo2"></asp:TextBox>
        &nbsp;
        <br />
        Fecha de Vencimiento(MM/AA):<asp:TextBox ID="txt_Vencimiento" runat="server" Width="151px" TextMode="Month" ValidationGroup="Grupo2"></asp:TextBox>
        &nbsp;
        <br />
        Codigo de Seguridad:<asp:TextBox ID="txt_CodigoSeg" runat="server" Width="83px" ValidationGroup="Grupo2"></asp:TextBox>
        &nbsp;
        <br />
        Cuotas:
        <asp:DropDownList ID="ddl_Cuotas" runat="server" ValidationGroup="Grupo2">
            <asp:ListItem Value="--Seleccionar Cuotas--">--Seleccionar Cuotas--</asp:ListItem>
            <asp:ListItem>1 Cuota</asp:ListItem>
            <asp:ListItem>3 Cuota</asp:ListItem>
            <asp:ListItem>6 Cuota</asp:ListItem>
            <asp:ListItem>9 Cuota</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btn_PagarTarj" runat="server" Text="Pagar" CssClass="boton-personalizado" ValidationGroup="Grupo2" OnClientClick="return validate();" OnClick="btn_PagarTarj_Click" Width="80px" />
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
        <br />
        <br />
        <asp:Button ID="btn_PagarEfec" runat="server" Text="Pagar" CssClass="boton-personalizado" ValidationGroup="Grupo3" OnClientClick="return validate();" OnClick="btn_PagarEfec_Click" Width="77px" />
    </asp:Panel>
    <p>
        <asp:Label ID="Label4" runat="server"></asp:Label>
    </p>
            </asp:Panel>
    </form>
</body>
</html>