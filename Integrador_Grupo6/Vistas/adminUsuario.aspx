<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminUsuario.aspx.cs" Inherits="Vistas.adminUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="StyleSheet" href="StyleSheet.css" type="text/css"/>
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
            </div>
            
            <strong> </strong>
            
            
            <br />
            <br />
            <br />
            <div style="text-align: center;">
            <strong>Filtros</strong><br />
            <asp:DropDownList ID="ddlFiltro" runat="server" Height="16px" Width="164px" AutoPostBack="True">
                <asp:ListItem Value="DNI_Us">DNI</asp:ListItem>
                <asp:ListItem Value="Usuario_Us">Usuario</asp:ListItem>
                <asp:ListItem Value="Email_Us">Email</asp:ListItem>
                <asp:ListItem Value="Telefono_Us">Telefono</asp:ListItem>
                <asp:ListItem Value="Nombre_Us">Nombre</asp:ListItem>
                <asp:ListItem Value="Apellido_Us">Apellido</asp:ListItem>
                <asp:ListItem Value="Tipo_Us">Tipo de Usuario</asp:ListItem>
                <asp:ListItem Value="Estado_Us">Estado de Usuario</asp:ListItem>
            </asp:DropDownList>
            &nbsp;
            <asp:TextBox ID="txtFiltro" runat="server" CssClass="auto-style2" Height="21px" Width="273px"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnFiltrar" CssClass="boton-personalizado" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
            &nbsp;
            <asp:Button ID="btnQuitarFiltro" CssClass="boton-personalizado" runat="server" Text="Quitar Filtro" OnClick="btnQuitarFiltro_Click"/>
            </div>
           <div style="margin-top: 30px; justify-content:center; display:flex; text-align:center;">

            Tipo 1 = Usuario Común </br>
            Tipo 2 = Usuario Administrador

           </div>

                        <asp:GridView ID="grvUsuarios" runat="server" style="justify-content:center; display:flex;margin-top:30px;" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCancelingEdit="grvUsuarios_RowCancelingEdit" OnRowEditing="grvUsuarios_RowEditing" OnRowUpdating="grvUsuarios_RowUpdating" AllowPaging="True" OnRowCommand="grvUsuariosRowCommand1" OnPageIndexChanging="grvUsuarios_PageIndexChanging" PageSize="3">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="DNI">
                                    <EditItemTemplate>
                                        <asp:Label ID="eit_lbl_DNI" runat="server" Text='<%# Bind("DNI_Us") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_DNI" runat="server" Text='<%# Bind("DNI_Us") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtMail" runat="server" MaxLength="60" Text='<%# Bind("Email_Us") %>' TextMode="Email"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Email" runat="server" Text='<%# Bind("Email_Us") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtNombre" runat="server" MaxLength="30" Text='<%# Bind("Nombre_Us") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Nombre" runat="server" Text='<%# Bind("Nombre_Us") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellido">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtApellido" runat="server" MaxLength="30" Text='<%# Bind("Apellido_Us") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Apellido" runat="server" Text='<%# Bind("Apellido_Us") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha Nacimiento">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtFechaNac" runat="server" AutoPostBack="True" Text='<%# Bind("FechaNacimiento_Us", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_FechaNac" runat="server" Text='<%# Bind("FechaNacimiento_Us", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telefono">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtTelefono" runat="server" MaxLength="10" Text='<%# Bind("Telefono_Us") %>' Width="129px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Telefono" runat="server" Text='<%# Bind("Telefono_Us") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Usuario">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtUsuario" runat="server" MaxLength="30" Text='<%# Bind("Usuario_Us") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Usuario" runat="server" Text='<%# Bind("Usuario_Us") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contraseña">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtContraseña" runat="server" MaxLength="30" Text='<%# Bind("Contraseña_Us") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Contraseña" runat="server" Text='<%# Bind("Contraseña_Us") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tipo">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="eit_ddl_Tipo" runat="server" SelectedValue='<%# Bind("Tipo_Us") %>'>
                                            <asp:ListItem Value="1">Común</asp:ListItem>
                                            <asp:ListItem Value="2">Admin</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Tipo" runat="server" Text='<%# Bind("Tipo_Us") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="eit_chk_Estado" runat="server" Checked='<%# Bind("Estado_Us") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="it_chk_Estado" runat="server" Checked='<%# Bind("Estado_Us") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
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
        </div>
        <!-- DIV CONFIRMACIÓN ELIMINAR -->
        <div class="contenedor-popup" id="modalConfirmacionEliminar" runat="server">
             <div class="popup2">
                <div class="funciones-popup">
                  <asp:Label style="margin-left:10%; font-size: 20px" ID="Label1" runat="server" Text="Eliminar Usuario" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                  <asp:Label ID="lblDNIeliminar" runat="server" Text="DNI: " ForeColor="White"></asp:Label>
                  <asp:Label ID="lblMuestrDNIeliminar" runat="server" Text="" ForeColor="White"></asp:Label>
                    <br />
                  <asp:Label ID="lblConfirmacion" runat="server" Text="¿Está seguro que desea eliminar este Usuario?" ForeColor="White"></asp:Label>
                    <br />
                  <asp:Button ID="btnSi" runat="server" Text="Si" CssClass="boton-personalizado" OnClick="btnSi_Click"></asp:Button>
                  <asp:Button ID="btnNo" runat="server" Text="No" CssClass="boton-personalizado" OnClick="btnNo_Click"></asp:Button>
                </div>
                 <asp:ImageButton ID="imgCerrarConfirmacion" runat="server" ImageAlign="Right" ImageUrl="~/Imagenes/Iconos/cruz.png" OnClick="imgCerrarConfirmacion_Click1" />
            </div>
        </div>
        <p>
            <asp:Label ID="lblLeyenda" runat="server" ForeColor="Red"></asp:Label>
        </p>
    </form>
</body>
</html>