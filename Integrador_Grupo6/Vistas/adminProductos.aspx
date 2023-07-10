<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminProductos.aspx.cs" Inherits="Vistas.adminProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>
    <style type="text/css">
    </style>
</head>
<body>
    <form id="form1" style ="font-family: sans-serif" runat="server">
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
            <br />
            <br />
            <div style="text-align: center;" >
                <strong>Filtros</strong><br />
                    <asp:DropDownList ID="ddlFiltro" runat="server">
                    <asp:ListItem Value="CodProducto_Pr">Codigo Producto</asp:ListItem>
                    <asp:ListItem Value="CodMarca_Pr">Marca</asp:ListItem>
                    <asp:ListItem Value="CodCategoria_Pr">Categoría</asp:ListItem>
                    <asp:ListItem Value="Nombre_Pr">Nombre</asp:ListItem>
                    <asp:ListItem Value="Descripcion_Pr">Descripcion</asp:ListItem>
                    <asp:ListItem Value="Estado_Pr">Estado de Producto</asp:ListItem>
                    <asp:ListItem Value="PrecioUnitario">Precio Unitario</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtFiltro" runat="server" Height="16px" Width="175px"></asp:TextBox>
                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="boton-personalizado" OnClick="btnFiltrar_Click" />
                <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" CssClass="boton-personalizado" OnClick="btnQuitarFiltro_Click" />
            </div>
            
            <br />
            <br />
                        <asp:GridView ID="grvProductos" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="90%" HeaderStyle-CssClass="dataGrid-th" AllowPaging="True" OnRowDeleting="grvProductos_RowDeleting" OnPageIndexChanging="grvProductos_PageIndexChanging" OnRowCancelingEdit="grvProductos_RowCancelingEdit" OnRowEditing="grvProductos_RowEditing" OnRowUpdating="grvProductos_RowUpdating" OnRowDataBound="grvProductos_RowDataBound" HorizontalAlign="Center" OnRowCommand="grvProductos_RowCommand1">
                            <AlternatingRowStyle BackColor="white" />
                            <Columns>
                                <asp:TemplateField HeaderText="Codigo Producto">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodProd" runat="server" Text='<%# Bind("CodProducto_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codigo Caracteristicas" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodCaract" runat="server" Text='<%# Bind("CodCaracteristicas_CXPXC") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codigo Marca" Visible="true">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ei_ddl_Marca" runat="server">
                                            <asp:ListItem Value="CodMarca_Ma">Codigo Marca</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodMarca" runat="server" Text='<%# Bind("CodMarcas_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Marca">
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Marca" runat="server" Text='<%# Bind("Descripcion_Ma") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codigo Categoria" Visible="true">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ei_ddl_Categoria" runat="server">
                                            <asp:ListItem Value="CodCategoria_Cat">Codigo Categoria</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodCat" runat="server" Text='<%# Bind("CodCategoria_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Categoria">
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Categoria" runat="server" Text='<%# Bind("Descripcion_Cat") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Color">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_CodColor" runat="server" Text='<%# Bind("Descripcion_Co") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Característica">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_Caracteristica" runat="server" Text='<%# Bind("Nombre_Car") %>'></asp:Label>
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
                                        $
                                        <asp:Label ID="lbl_it_Precio" runat="server" Text='<%# Bind("PrecioUnitario") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Stock">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_it_stock" runat="server" Text='<%# Bind("Stock_CXPXC") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado" Visible="False">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbEstado" runat="server" Checked='<%# Bind("Estado_CXPXC") %>'/>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="ch_it_estado" runat="server" Checked='<%# Bind("Estado_CXPXC") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Image" HeaderText="Editar Stock" ImageUrl="~/Imagenes/Iconos/signo mas.png" CommandName="AgregarStock">
                                <ControlStyle Height="20px" Width="20px" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>
                                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Imagenes/Iconos/cancelar.png" EditImageUrl="~/Imagenes/Iconos/lapiz.png" HeaderText="Editar" ShowEditButton="True" UpdateImageUrl="~/Imagenes/Iconos/check.png">
                                <ControlStyle Height="25px" Width="25px" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:ButtonField ButtonType="Image" CommandName="Eliminar" HeaderText="Eliminar" ImageUrl="~/Imagenes/Iconos/tachobasura.png">
                                <ControlStyle Height="25px" Width="25px" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:ButtonField>
                            </Columns>
                            <HeaderStyle CssClass="dataGrid-th" />
                        </asp:GridView>

            <div style="display:flex;justify-content:center; margin-top: 10px">
               <asp:Button CssClass="boton-personalizado" ID="btnAgregarProducto" runat="server" Text="Agregar Producto" ValidationGroup="1" OnClick="btnAgregarProducto_Click" />
            </div>

            <table class="auto-style1">
                <tr>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="Resultado" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
           

        </div>
        

        <!-- PANEL MARCAS -->
           
            <div class="contenedor-popup" id="modal" runat="server">
             <div class="popup2">
                <div class="funciones-popup">
                  <asp:Label ID="lblTextoPopup" runat="server" Text="Ingresar Marca" ForeColor="White"></asp:Label>
                  <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>
                    <br />
                  <asp:Label ID="LblDescPopup" runat="server" Text="Ingresar Descripcion" ForeColor="White"></asp:Label>
                    <asp:TextBox ID="Descripcion" runat="server"></asp:TextBox>
                  <asp:Button ID="btnAgregarMarca" runat="server" CssClass="boton-personalizado" Text="Agregar" OnClick="btnAgregarMarca_Click"></asp:Button>
                </div>
                 <asp:ImageButton ID="imgCerrarPopMarcas" runat="server" ImageAlign="Right" ImageUrl="~/Imagenes/Iconos/cruz.png" OnClick="ImageButtonCerrar_Click1" />
            </div>
        </div>
        

        <!-- DIV AGREGAR STOCK -->
        <div class="contenedor-popup" id="modalStock" runat="server">
             <div class="popup2">
                <div class="funciones-popup">
                  <asp:Label style="margin-left:30%; font-size: 20px" ID="lblTextoPopupAgrStock" runat="server" Text="Editar stock" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                  <asp:Label ID="lblCodigoProd" runat="server" Text="Código: " ForeColor="White"></asp:Label>
                  <asp:Label ID="lblMuestraCod" runat="server" Text="" ForeColor="White"></asp:Label>
                    <br />
                  <asp:Label ID="lblArticulo" runat="server" Text="Articulo: " ForeColor="White"></asp:Label>
                  <asp:Label ID="lblAgrDescripcion" runat="server" Text="Descripcion" ForeColor="White"></asp:Label>
                    <br />
                  <asp:Label ID="lblCaract" runat="server" Text="Caracteristicas: " ForeColor="White"></asp:Label>
                  <asp:Label ID="lblMuestraCar" runat="server" Text="" ForeColor="White"></asp:Label>
                    <br />
                  <asp:Label ID="lblColor" runat="server" Text="Color: " ForeColor="White"></asp:Label>
                  <asp:Label ID="lblMuestraColor" runat="server" Text="" ForeColor="White"></asp:Label>
                    <br />
                  <asp:TextBox style="margin-top: 20px" ID="txtAgrStock" runat="server" TextMode="Number"></asp:TextBox>
                  <asp:Button ID="btnAgrStock" runat="server" Text="Editar Stock" CssClass="boton-personalizado" OnClick="btnAgrStock_Click"></asp:Button>
                    <br />
                    <br />
                  <asp:Label class="centered-element" ID="lblMensajeStock" runat="server" Text="" ForeColor="White"></asp:Label>
                </div>
                 <asp:ImageButton ID="imgCerrarPop" runat="server" ImageAlign="Right" ImageUrl="~/Imagenes/Iconos/cruz.png" OnClick="ImageButton1_Click1" />
            </div>
        </div>

        <!-- DIV AGREGAR PRODUCTO -->
        <div class="contenedor-popup" id="modalAgregarProducto" runat="server">
             <div class="popup2" style="height:60%; width: 70%">
                <div id="divAgregarProducto" class="funciones-popup">
                  <table align="center" class="auto-style13">
                <tr>
                    <asp:Label ID="lblAgregarProducto" runat="server" Text="Agregar Producto" style="color:white"></asp:Label>
                </tr>
                <tr>
                    <td class="auto-style15"><asp:Label ID="lblCodigo" runat="server" Text="Código" Style="color:white"></asp:Label><br />
            <strong>
            <asp:TextBox ID="txtCodProd" runat="server" MaxLength="6"></asp:TextBox>
            </strong></td>
                    
                    <td class="auto-style17"><asp:Label ID="lblNombre" runat="server" Text="Nombre" Style="color:white"></asp:Label><br />
                        <strong>
                        <asp:TextBox ID="txtNombre" runat="server" MaxLength="20" Height="16px" Width="180px"></asp:TextBox>
                        </strong></td>
                    <td class="auto-style19"><asp:Label ID="lbla" runat="server" Text="Marca" Style="color:white"></asp:Label><br />
                        <strong>
                        <asp:DropDownList ID="ddlMarcas" runat="server">
                        </asp:DropDownList>
                        <asp:ImageButton ID="imgAgregar" runat="server" Height="22px" ImageUrl="~/Imagenes/Iconos/agregar.png" OnClick="ImageButton1_Click" Width="21px" />
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style14"><asp:Label ID="lblCategoria" runat="server" Text="Categoría" Style="color:white"></asp:Label><br />
                        <strong>
                        <asp:DropDownList ID="ddlCategoriaProducto" runat="server">
                        </asp:DropDownList>
                        <asp:ImageButton ID="ImageCategoria" runat="server" Height="22px" ImageUrl="~/Imagenes/Iconos/agregar.png" Width="21px" />
                        </strong></td>
                    <td class="auto-style27"><asp:Label ID="lblCaracteristicas" runat="server" Text="Características" Style="color:white"></asp:Label><br />
                        <strong>
                        <asp:DropDownList ID="ddlCaracteristicas" runat="server">
                        </asp:DropDownList>
                        <asp:ImageButton ID="ImageCarac" runat="server" Height="22px" ImageUrl="~/Imagenes/Iconos/agregar.png" Width="21px" />
                        </strong></td>
                    <td class="auto-style26"><asp:Label ID="lblColor2" runat="server" Text="Color" Style="color:white"></asp:Label><br />
                        <strong>
                        <asp:DropDownList ID="ddlColorProducto" runat="server">
                        </asp:DropDownList>
                        <asp:ImageButton ID="ImageColor" runat="server" Height="22px" ImageUrl="~/Imagenes/Iconos/agregar.png" Width="21px" />

                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style21"><asp:Label ID="lblPrecioUnitario" runat="server" Text="Precio Unitario" Style="color:white"></asp:Label><br />
                        <strong>
                        <asp:TextBox ID="txtPrecioUnitario" runat="server" CssClass="auto-style16" Height="16px"></asp:TextBox>
                        </strong></td>
                    <td class="auto-style22"><asp:Label ID="lblStock" runat="server" Text="Stock" Style="color:white"></asp:Label><br />
                        <strong>
                        <asp:TextBox ID="txtAgregarStock" runat="server"></asp:TextBox>
                        </strong></td>
                    <td class="auto-style23">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Label ID="lblImagen" runat="server" Text="Imagen" Style="color:white"></asp:Label><strong><br />
                        <asp:FileUpload style="color:white" ID="FileUploadImagenProd" runat="server" />
                        </strong></td>
                    <td class="auto-style26">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style25" colspan="3"><asp:Label ID="lblDescripcion" runat="server" Text="Descripción" Style="color:white"></asp:Label><br />
                        <strong>
                        <asp:TextBox ID="txtDescripcion" runat="server" Height="115px" MaxLength="100" TextMode="MultiLine" Width="734px" ValidationGroup="1"></asp:TextBox>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style24" colspan="3">
                        <asp:Button ID="btnIngresarProducto" runat="server" Text="Ingresar Producto" ValidationGroup="1" CssClass="boton-personalizado" OnClick="btnIngresarProducto_Click" />
                        <br />
                        <asp:Label ID="lblMensajeAgregado" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
                </div>
                 <asp:ImageButton ID="imgCerrarAgregarProducto" runat="server" ImageAlign="Right" ImageUrl="~/Imagenes/Iconos/cruz.png" OnClick="imgCerrarAgregarProducto_Click1" />
            </div>
        </div>
        
        <!-- DIV CONFIRMACIÓN ELIMINAR -->
        <div class="contenedor-popup" id="modalConfirmacionEliminar" runat="server">
             <div class="popup2">
                <div class="funciones-popup">
                  <asp:Label style="margin-left:10%; font-size: 20px" ID="Label1" runat="server" Text="Eliminar Producto" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                  <asp:Label ID="lblCodEliminar" runat="server" Text="Código: " ForeColor="White"></asp:Label>
                  <asp:Label ID="lblMuestrCodEliminar" runat="server" Text="" ForeColor="White"></asp:Label>
                    <br />
                  <asp:Label ID="lblArticuloEliminar" runat="server" Text="Articulo: " ForeColor="White"></asp:Label>
                  <asp:Label ID="lblMuestraArtEliminar" runat="server" Text="Descripcion" ForeColor="White"></asp:Label>
                    <br />
                  <asp:Label ID="lblCaractEliminar" runat="server" Text="Caracteristicas: " ForeColor="White"></asp:Label>
                  <asp:Label ID="lblMuestraCaractEliminar" runat="server" Text="" ForeColor="White"></asp:Label>
                    <br />
                  <asp:Label ID="lblColorEliminar" runat="server" Text="Color: " ForeColor="White"></asp:Label>
                  <asp:Label ID="lblMuestraColorEliminar" runat="server" Text="" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                  <asp:Label ID="lblConfirmacion" runat="server" Text="¿Está seguro que desea eliminar?" ForeColor="White"></asp:Label>
                    <br />
                  <asp:Button ID="btnSi" runat="server" Text="Si" CssClass="boton-personalizado" OnClick="btnSi_Click"></asp:Button>
                  <asp:Button ID="btnNo" runat="server" Text="No" CssClass="boton-personalizado" OnClick="btnNo_Click"></asp:Button>
                </div>
                 <asp:ImageButton ID="imgCerrarConfirmacion" runat="server" ImageAlign="Right" ImageUrl="~/Imagenes/Iconos/cruz.png" OnClick="imgCerrarConfirmacion_Click1" />
            </div>
        </div>
        

    </form>
</body>
</html>