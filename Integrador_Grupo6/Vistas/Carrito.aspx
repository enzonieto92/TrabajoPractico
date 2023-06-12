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

                    
        <div class="Button" ">
                <asp:Button ID="btnRegistrase" runat="server"  Text="Iniciar Sesión"/>
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
                        <asp:Button ID="Button1" runat="server" Text="Registrarse" font-family="sans-serif" Font-Size="Medium"   />
                        </div>
    </div>

              </div>
       </div>
        </asp:Panel>
            <div style="display:flex;justify-content:center;" class="encabezado">

                <asp:Label ID="lblEncabezadoCarrito" runat="server" Text="Artículos en carrito"></asp:Label>

            </div>
        <div style="display:flex;justify-content:center;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CodProducto_Pro" DataSourceID="SqlDataSource1" HeaderStyle-CssClass="dataGrid-th">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_TecnoUTNConnectionString %>" SelectCommand="SELECT [CodProducto_Pro], [Nombre_Pro], [Descripcion_Pro], [PrecioUnitario_Pro], [imgURL_Pro] FROM [Productos]"></asp:SqlDataSource>
        </div>
        <div style="display:flex;justify-content:center; margin-top: 10px">
            <asp:Button class="boton-personalizado" style="margin: 10px" ID="btnConfirmar" runat="server" Text="Confirmar" />
            <asp:Button class="boton-personalizado" style="margin: 10px" ID="btnVaciar" runat="server" Text="Vaciar Carrito" />
        </div>
    </form>
</body>
</html>