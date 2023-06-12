<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio</title>

    <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>

    <style type="text/css">
        .auto-style8 {
            margin-bottom: 0px;
        }
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
                <a href="#" id="btnAbrirPopup" onclick="MostrarPopup(); return false;">IniciarSesión</a>
				<a href="registrarse.aspx">
                    Registrarse
				</a>
			    <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/Imagenes/Iconos/carrito.png" Width="37px"/>
           </nav>
		</div>
    </header>

               <div id="miPopup" class="popup">
                <div class="popup-contenido">
                    <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Imagenes/Iconos/cruz.png" DescriptionUrl="CerrarPopup(); return false;" style="position: relative; top: 10px; left: 265px;"/>
                    <h2 style="text-align:center; font-family:sans-serif;">
                <asp:Label ID="lblRegistrarse" runat="server" Text="Inicio de Sesión"></asp:Label> 
                    </h2>

        <div class="Form">

            <asp:Label ID="lblUsuario" runat="server" Text="Usuario: "></asp:Label>
            <asp:TextBox ID="txtUsuario" runat="server" class="TextBox"></asp:TextBox>

        </div>

        <div class="Form">

                <asp:Label ID="lblContraseña" runat="server" Text="Contraseña:"></asp:Label>
                <asp:TextBox ID="txtContraseña" runat="server" class="TextBox" TextMode="Password"></asp:TextBox> 

        </div>

        <div style="text-align:center;">
                <asp:HyperLink ID="HlOlvidar" runat="server" Text="¿Olvidaste tu contraseña?" font-name="sans-serif" ForeColor="SkyBlue" Font-Size="Medium" NavigateUrl="~/iniciarSesion.aspx"></asp:HyperLink>
        </div>      
                    
            <div class="Form" style="justify-content:center; display:flex;">
                    <asp:Button ID="btnRegistrase" runat="server"  Text="Iniciar Sesión"/>
                    </div>   

              </div>
       </div>



<script>
    function MostrarPopup() {
        document.getElementById("miPopup").style.display = "flex";
    }

    function CerrarPopup() {
        document.getElementById("miPopup").style.display = "none";
    }
</script>

        <div style="text-align: center; margin: 50px">
            <asp:TextBox class="cajaDeTexto" ID="txtBuscar" runat="server"></asp:TextBox>
            <asp:Button class="boton-personalizado" ID="btnBuscar" runat="server" Text="Buscar"  />
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <table class="auto-style3">
                        <tr>
                           
                                
                         
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4"><strong>--------------------------------------------------------------------------<br />
                                <br />
                                Categorías</strong><asp:RadioButtonList ID="rblCategorias" runat="server">
                                <asp:ListItem Value="1">Tarjetas Graficas</asp:ListItem>
                                <asp:ListItem Value="2">Computadoras Armadas</asp:ListItem>
                                <asp:ListItem Value="3">Gaming</asp:ListItem>
                                <asp:ListItem Value="4">Notebooks</asp:ListItem>
                                <asp:ListItem Value="5">Realidad Virtual</asp:ListItem>
                                <asp:ListItem Value="6">Codigos de windows</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />
                                <asp:Button ID="btnLimpiarCategorias" runat="server" OnClick="btnLimpiarCategorias_Click" Text="Limpiar" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5"><strong>Marcas</strong><asp:RadioButtonList ID="rblMarcas" runat="server">
                                <asp:ListItem Value="1">Nvidia</asp:ListItem>
                                <asp:ListItem Value="2">Asus</asp:ListItem>
                                <asp:ListItem Value="3">Xbox</asp:ListItem>
                                <asp:ListItem Value="4">Sony</asp:ListItem>
                                <asp:ListItem Value="5">Samsung</asp:ListItem>
                                <asp:ListItem Value="6">MSI</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />
                                <asp:Button ID="btnLimpiarMarcas" runat="server" OnClick="btnLimpiarMarcas_Click" Text="Limpiar" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">&nbsp; <strong>Precio</strong><br />
                                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Min&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max<br />
                                <asp:TextBox ID="txtPrecioMin" runat="server" Width="101px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtPrecioMax" runat="server" Width="101px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <asp:DropDownList ID="ddlOrden" runat="server" Height="16px" Width="170px">
                                    <asp:ListItem Value="0">----Seleccionar Orden----</asp:ListItem>
                                    <asp:ListItem Value="PrecioUnitario_Pr ASC">Precio (menor a mayor)</asp:ListItem>
                                    <asp:ListItem Value="PrecioUnitario_Pr DESC">Precio (mayor a menor)</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" Width="56px" OnClick="btnFiltrar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" OnClick="btnQuitarFiltro_Click" />
                            </td>
                        </tr>
                    </table>

        <td>
            <div style="display:flex;justify-content:center;">
            <asp:ListView ID="lvProductos" runat="server" DataKeyNames="CodProducto_Pro" DataSourceID="SqlDataSource1" GroupItemCount="4">
                <EditItemTemplate>
                    <td runat="server" style="background-color: #FFCC66; color: #000080;">CodProducto_Pro:
                        <asp:Label ID="CodProducto_ProLabel1" runat="server" Text='<%# Eval("CodProducto_Pro") %>' />
                        <br />Nombre_Pro:
                        <asp:TextBox ID="Nombre_ProTextBox" runat="server" Text='<%# Bind("Nombre_Pro") %>' />
                        <br />Descripcion_Pro:
                        <asp:TextBox ID="Descripcion_ProTextBox" runat="server" Text='<%# Bind("Descripcion_Pro") %>' />
                        <br />
                        PrecioUnitario_Pro:
                        <asp:TextBox ID="PrecioUnitario_ProTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Pro") %>' />
                        <br />
                        imgURL_Pro:
                        <asp:TextBox ID="imgURL_ProTextBox" runat="server" Text='<%# Bind("imgURL_Pro") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                        <br /></td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
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
                <InsertItemTemplate>
                    <td runat="server" style="">CodProducto_Pro:
                        <asp:TextBox ID="CodProducto_ProTextBox" runat="server" Text='<%# Bind("CodProducto_Pro") %>' />
                        <br />Nombre_Pro:
                        <asp:TextBox ID="Nombre_ProTextBox" runat="server" Text='<%# Bind("Nombre_Pro") %>' />
                        <br />
                        Descripcion_Pro:
                        <asp:TextBox ID="Descripcion_ProTextBox" runat="server" Text='<%# Bind("Descripcion_Pro") %>' />
                        <br />
                        PrecioUnitario_Pro:
                        <asp:TextBox ID="PrecioUnitario_ProTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Pro") %>' />
                        <br />
                        imgURL_Pro:
                        <asp:TextBox ID="imgURL_ProTextBox" runat="server" Text='<%# Bind("imgURL_Pro") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" class="estiloListView">
                        <asp:Label class="nombreArticulo" ID="Nombre_ProLabel0" runat="server" Text='<%# Eval("Nombre_Pro") %>' Height="30px"></asp:Label>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("imgURL_Pro") %>' Width="230px" Height="200px" />
                        <br />
                        Código:
                        <asp:Label ID="CodProducto_ProLabel" runat="server" Text='<%# Eval("CodProducto_Pro") %>' />
                        <br />
                        Nombre:
                        <asp:Label ID="Nombre_ProLabel" runat="server" Text='<%# Eval("Nombre_Pro") %>' />
                        <br />Descripcion:
                        <asp:Label style="text-align:left" ID="Descripcion_ProLabel" runat="server" Text='<%# Eval("Descripcion_Pro") %>' Width="250px" Height="150px"/>
                        <br />Precio: $<asp:Label ID="PrecioUnitario_ProLabel" runat="server" Text='<%# Eval("PrecioUnitario_Pro") %>' />
                        <asp:Button class="boton-personalizado" ID="btnAgregarAlCarrito" runat="server" Text="Agregar al Carrito" />
                        <br />
                    </td>
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
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color: #FFCC66; font-weight: bold; color: #000080;">CodProducto_Pro:
                        <asp:Label ID="CodProducto_ProLabel" runat="server" Text='<%# Eval("CodProducto_Pro") %>' />
                        <br />Nombre_Pro:
                        <asp:Label ID="Nombre_ProLabel" runat="server" Text='<%# Eval("Nombre_Pro") %>' />
                        <br />Descripcion_Pro:
                        <asp:Label ID="Descripcion_ProLabel" runat="server" Text='<%# Eval("Descripcion_Pro") %>' />
                        <br />
                        PrecioUnitario_Pro:
                        <asp:Label ID="PrecioUnitario_ProLabel" runat="server" Text='<%# Eval("PrecioUnitario_Pro") %>' />
                        <br />
                        imgURL_Pro:
                        <asp:Label ID="imgURL_ProLabel" runat="server" Text='<%# Eval("imgURL_Pro") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_TecnoUTNConnectionString %>" SelectCommand="SELECT [CodProducto_Pro], [Nombre_Pro], [Descripcion_Pro], [PrecioUnitario_Pro], [imgURL_Pro] FROM [Productos]"></asp:SqlDataSource>
            </div>
            


    </form>
</body>
</html>
