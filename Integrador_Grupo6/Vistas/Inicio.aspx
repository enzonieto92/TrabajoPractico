<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio</title>
    <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>
    </head>
<body>
    <form id="form1" runat="server">
    <header>
        		<div class="wrapper">
			<div class="logo">TECNOVATOS</div>
			
			<nav>
                <asp:LinkButton ID="btnInicio" runat="server" TabIndex="-1" PostBackUrl="Inicio.aspx"></asp:LinkButton>
                <asp:LinkButton ID="btnAbrirPopup" runat="server" OnClick="btnAbrirPopup_Click" TabIndex="-1"></asp:LinkButton>

                <asp:LinkButton ID="btnRegistrarse" runat="server" OnClick="btnCerrarSesion" TabIndex="-1"></asp:LinkButton>

			    <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/Imagenes/Iconos/carrito.png" Width="37px" TabIndex="-1" OnClick="btnCarrito" />
           </nav>
		</div>
    </header>
            <asp:Label ID="lblErrorIni" runat="server" CssClass="lblError"></asp:Label>
       
    <asp:Panel ID="PanelInicioSesion" runat="server" Visible ="false" DefaultButton="btnIniciarSesion">
    <div id="PopupInicioSesion" class="popup">
            <div class="popup-contenido">
                <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Imagenes/Iconos/cruz.png" style="position: relative; top: 10px; left: 265px;" OnClick="btnCerrar_Click"/>
                <h2 style="text-align:center; font-family:sans-serif;">
                <asp:Label ID="lblRegistrarse" runat="server" Text="Inicio de Sesión"></asp:Label> 
                </h2>
                <div class="Datos">
    <div class="Form">
        <asp:Label ID="lblUsuario" runat="server" class="Label" Text="Usuario: " ></asp:Label>
        <asp:TextBox ID="txtUsuario" runat="server" class="TextBox" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvInicioUsuario" runat="server" ErrorMessage="*" ControlToValidate="txtUsuario" ValidationGroup="InicioSesion" ForeColor="#FF5050"></asp:RequiredFieldValidator>
    </div>
     

    <div class="Form">
            <asp:Label ID="lblContraseña" runat="server" class="Label" Text="Contraseña:" BackColor="#232F3B"></asp:Label>
            <asp:TextBox ID="txtContraseña" runat="server" class="TextBox" TextMode="Password" ValidationGroup="InicioSesion"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="rfvInicioContraseña" runat="server" ErrorMessage="*" ControlToValidate="txtContraseña" ValidationGroup="InicioSesion" ForeColor="#FF5050"></asp:RequiredFieldValidator>
    </div>

</div>
                <div class="Hyperlink">
                    <asp:HyperLink ID="HlOlvidar" runat="server" Text="¿Olvidaste tu contraseña?" font-name="sans-serif"  ForeColor="SkyBlue" Font-Size="10px"></asp:HyperLink> 
                </div>
                    
        <div class="Button">
                <asp:Button ID="btnIniciarSesion" class="boton-personalizado" runat="server"  Text="Iniciar Sesión" OnClick="btnIniciarSesion_Click" ValidationGroup="InicioSesion" />
                </div>   
                <div class="lblError">
                    <asp:Label ID="lblerror" runat="server" visible="false"></asp:Label>
                 </div>

            </div>
    </div>
    </asp:Panel>

        <asp:Panel ID="PanelRegistro" runat="server" Visible ="false" DefaultButton="btnRegistrarUsuario">
       <div id="PopupRegistro" class="popup">
             <div class="popup-contenido" style="height:680px; width: 500px;">
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Imagenes/Iconos/cruz.png" style="position: relative; top: 10px; left:465px;" OnClick="btnCerrar2_Click"/>
                    <h2 style="text-align:center; font-family:sans-serif;">
                    <asp:Label ID="Label1" runat="server" Text="Registrarse"></asp:Label> 
                    </h2>
                    <div class="Datos">
        <div class="Form">

            <asp:Label ID="Label2" runat="server" class="Label" Text="DNI: " ></asp:Label>
            <asp:TextBox ID="txtboxDNI" runat="server" class="TextBox" AutoCompleteType="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDNI" runat="server"  class="Validator_Center" ControlToValidate="txtboxDNI" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txtboxDNI" ForeColor="Red" ValidationExpression="^[\d]{1,3}\.?[\d]{3,3}\.?[\d]{3,3}$" ValidationGroup="1">*</asp:RegularExpressionValidator>
        </div>
                        
       <div class="Form">

                        <asp:Label ID="lblEmail" runat="server" class="Label" Text="Email:"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="example@gmail.com" class="TextBox"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvEmail" runat="server"  class="Validator_Center" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
       </div>
                        
       <div class="Form">

                        <asp:Label ID="lblNombre" runat="server" class="Label" Text="Nombre:"></asp:Label>
                        <asp:TextBox ID="txtboxNombre" runat="server" class="TextBox"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvNombre" class="Validator_Center" runat="server" ControlToValidate="txtboxNombre" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtboxNombre" ForeColor="Red" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
       </div>
       
       <div class="Form">

                        <asp:Label ID="lblApellido" runat="server" class="Label" Text="Apellido:"></asp:Label>
                        <asp:TextBox ID="txtboxApellido" runat="server" class="TextBox"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvApellido" class="Validator_Center" runat="server" ControlToValidate="txtboxApellido" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtboxApellido" ForeColor="Red" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
       </div>
       
       <div class="Form">

                        <asp:Label ID="lblFechaNacimineto" runat="server" class="Label" Text="Fecha de Nacimiento:"></asp:Label>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" class="TextBox" TextMode="Date"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvFechaNac" class="Validator_Center" runat="server" ControlToValidate="txtFechaNacimiento" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
       </div>
                               
       <div class="Form">

                        <asp:Label ID="lblTelefono" runat="server" class="Label" Text="Telefono:"></asp:Label>
                        <asp:TextBox ID="txtTelefono" runat="server" class="TextBox"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvTelefono"  class="Validator_Center" runat="server" ControlToValidate="txtTelefono" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="1">*</asp:RegularExpressionValidator>
       </div>

       <div class="Form">

                        <asp:Label ID="lblCrearUsuario" runat="server" class="Label" Text="Usuario:"></asp:Label>
                        <asp:TextBox ID="txtboxCrearUsuario" runat="server" class="TextBox"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" class="Validator_Center"  ControlToValidate="txtboxCrearUsuario" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">*</asp:RequiredFieldValidator>
       </div>

        <div class="Form">

                <asp:Label ID="lblboxContraseña" runat="server" class="Label" Text="Contraseña:" BackColor="#232F3B"></asp:Label>
                <asp:TextBox ID="txtboxContraseña" runat="server" class="TextBox" TextMode="Password"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="rfvContraseña" class="Validator_Center" runat="server" ControlToValidate="txtboxContraseña" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">*</asp:RequiredFieldValidator>
        </div>
        <div class="Form">
                <asp:Label ID="lblRepContraseña" runat="server" class="Label" Text="Repita la contraseña:"></asp:Label>
               <asp:TextBox ID="txtRepContraseña" runat="server" class="TextBox" TextMode="password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRepetir" runat="server"  class="Validator_Center" ControlToValidate="txtRepContraseña" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvRepetir" runat="server" ControlToCompare="txtboxContraseña" ControlToValidate="txtRepContraseña" ForeColor="Red" ValidationGroup="1">*</asp:CompareValidator>
        </div>

                        <div class="Button">
                        <asp:Button ID="btnRegistrarUsuario" runat="server" class="boton-personalizado" Text="Registrarse" font-family="sans-serif" Font-Size="Medium" OnClick="Button1_Click" ValidationGroup="1"   />
                            <asp:Label ID="lblLeyenda" class="Validator_Center" runat="server" ForeColor="Red"></asp:Label>
                        </div>
    </div>

              </div>
       </div>
        </asp:Panel>

        <asp:Panel ID="PanelBusqueda" runat="server" DefaultButton="btnBuscar">

        <div style="text-align: center; margin: 50px">
            <asp:TextBox class="cajaDeTexto" ID="txtBuscar" placeholder="Buscar productos por nombre" runat="server"></asp:TextBox>
            <asp:Button class="boton-personalizado" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"  />
        </div>
        </asp:Panel>
        <div class="contenedor">
                            <h3 style="font-family:sans-serif; text-align:center;">Categorías</h3>
                                
                                <asp:RadioButtonList ID="rblCategorias" runat="server" CssClass="radioBtn">
                                    <asp:ListItem Value="1">celulares</asp:ListItem>
                                    <asp:ListItem Value="2">Tarjetas Graficas</asp:ListItem>
                                    <asp:ListItem Value="3">Mothers</asp:ListItem>
                                    <asp:ListItem Value="4">Consolas</asp:ListItem>
                                    <asp:ListItem Value="5">Coolers</asp:ListItem>
                                    <asp:ListItem Value="6">Gabinetes</asp:ListItem>
                                </asp:RadioButtonList>
                            <div style="display:flex; justify-content:center;margin-top:20px;">
                                <asp:Button ID="btnLimpiarCategorias" runat="server" OnClick="btnLimpiarCategorias_Click" Text="Limpiar" class="boton-personalizado"/>
                            </div>

                             <h3 style="text-align:center;font-family:sans-serif;"> Marcas</h3>

                                <asp:RadioButtonList ID="rblMarcas" runat="server" CssClass="radioBtn">
                                    <asp:ListItem Value="1">Sony</asp:ListItem>
                                    <asp:ListItem Value="2">Samsung</asp:ListItem>
                                    <asp:ListItem Value="3">Motorola</asp:ListItem>
                                    <asp:ListItem Value="4">Nvidia</asp:ListItem>
                                    <asp:ListItem Value="5">Asus</asp:ListItem>
                                    <asp:ListItem Value="6">MSI</asp:ListItem>
                                </asp:RadioButtonList>
                             <div style="display:flex; justify-content:center;margin-top:20px; margin-bottom:20px;">

                                <asp:Button ID="btnLimpiarMarcas" runat="server" OnClick="btnLimpiarMarcas_Click" Text="Limpiar" class="boton-personalizado"/>
                            </div>

                                <h3 style="text-align:center;font-family:sans-serif;">Precio</h3>
                            <div style="width:100%; height:50px;">
                                    <div style="float:left; width:30%;">
                                        <asp:Label ID="lblMax" runat="server" Text="Max: " style="display:block;margin-left:10px;"></asp:Label>
                                        <asp:Label ID="lblMin" runat="server" Text="Min: " style="display:block;margin-left:10px;"></asp:Label>
                                    </div>
                                    <div style="float:right;width:70%;">
                                    <asp:TextBox ID="txtPrecioMin" runat="server" style="width:80px;"></asp:TextBox>
                                    <asp:TextBox ID="txtPrecioMax" runat="server" style="width:80px;"></asp:TextBox>
                                    </div>
                            </div>
                                <div style="display:flex; justify-content:center;margin-top:20px; ">
                                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" Width="120px" OnClick="btnFiltrar_Click" CssClass="boton-personalizado"/>
                                    </div>
                                <div style="display:flex; justify-content:center;margin-top:20px;">
                                <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" OnClick="btnQuitarFiltro_Click" CssClass="boton-personalizado"/>
                                </div>
            </div>

        <div style="float:right; float:left;width: 80%;display:flex;justify-content:center;">
                        <asp:ListView ID="lvProductos" runat="server" GroupItemCount="3">
                <EditItemTemplate>
                    <td runat="server" style="background-color: #FFCC66; color: #000080;">CodProducto_Pro:
                        <asp:Label ID="CodProducto_ProLabel1" runat="server" Text='<%# Eval("CodProducto_Pr") %>' />
                        <br />Nombre_Pro:
                        <asp:TextBox ID="Nombre_ProTextBox" runat="server" Text='<%# Bind("Nombre_Pr") %>' />
                        <br />Descripcion_Pro:
                        <asp:TextBox ID="Descripcion_ProTextBox" runat="server" Text='<%# Bind("Descripcion_Pr") %>' />
                        <br />
                        PrecioUnitario_Pro:
                        <asp:TextBox ID="PrecioUnitario_ProTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Pr") %>' />
                        <br />
                        imgURL_Pro:
                        <asp:Image ID="imgURL_ProTextBox" runat="server" ImageUrl='<%# Eval("URLimagen_Pr") %>' />
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
                    <td runat="server">CodProducto_Pro:
                        <asp:TextBox ID="CodProducto_ProTextBox" runat="server" Text='<%# Bind("CodProducto_Pr") %>' />
                        <br />Nombre_Pro:
                        <asp:TextBox ID="Nombre_ProTextBox" runat="server" Text='<%# Bind("Nombre_Pr") %>' />
                        <br />
                        Descripcion_Pro:
                        <asp:TextBox ID="Descripcion_ProTextBox" runat="server" Text='<%# Bind("Descripcion_Pr") %>' />
                        <br />
                        PrecioUnitario_Pro:
                        <asp:TextBox ID="PrecioUnitario_ProTextBox" runat="server" Text='<%# Bind("PrecioUnitario") %>' />
                        <br />
                        imgURL_Pro:
                        <asp:ImageButton ID="imgURL_ProTextBox" runat="server" ImageUrl='<%# Eval("URLimagen_Pr") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" class="estiloListView">
                        <asp:Label class="nombreArticulo" ID="Nombre_ProLabel0" runat="server" Text='<%# Eval("Nombre_Pr") %>' Height="30px"></asp:Label>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("URLimagen_Pr") %>' CssClass="lvImagen" />
                        <br />
                        <div style="border:3px solid #f2f2f2;  margin-bottom:30px; height:120px;">
                        Código:
                        <asp:Label ID="CodProducto_ProLabel" runat="server" Text='<%# Eval("CodProducto_Pr") %>' />
                        <br />
                        Nombre:
                        <asp:Label ID="Nombre_ProLabel"   runat="server" Text='<%# Eval("Nombre_Pr") %>' />
                            Descripcion:
                        <asp:Label style="text-align:center; margin-top: 5px;" ID="Descripcion_ProLabel" runat="server" Text='<%# Eval("Descripcion_Pr") %>' Width="250px"/>
                        </div>
                        <br />Precio: $<asp:Label ID="PrecioUnitario_ProLabel" runat="server" Text='<%# Eval("PrecioUnitario") %>' />
                        <asp:Button class="boton-personalizado" style="margin-bottom:50px;" ID="btnAgregarAlCarrito" runat="server" Text="Agregar al Carrito" CommandArgument='<%# Eval("CodProducto_Pr") %>' OnCommand="btnVerMas_Command" CommandName="eventoVerMas" />
                            </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" style="background-color: #FFFFFF;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
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
                        <asp:Label ID="CodProducto_ProLabel" runat="server" Text='<%# Eval("CodProducto_Pr") %>' />
                        <br />Nombre_Pro:
                        <asp:Label ID="Nombre_ProLabel" runat="server" Text='<%# Eval("Nombre_Pr") %>' />
                        <br />Descripcion_Pro:
                        <asp:Label ID="Descripcion_ProLabel" runat="server" Text='<%# Eval("Descripcion_Pr") %>' />
                        <br />
                        PrecioUnitario_Pro:
                        <asp:Label ID="PrecioUnitario_ProLabel" runat="server" Text='<%# Eval("PrecioUnitario") %>' />
                        <br />
                        imgURL_Pro:
                        <asp:ImageButton ID="imgURL_ProLabel" runat="server" ImageUrl='<%# Eval("URLimagen_Pr") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
                        
                        <br />
                        <asp:Label ID="lblMensajeStock" runat="server"></asp:Label>
                        <br />
                        
        </div> 

    </form>
</body>
</html>
