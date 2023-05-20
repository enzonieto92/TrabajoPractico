<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TP7_Grupo_Nro_06.SeleccionarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .container {
        margin-bottom: 30px;
        overflow: hidden; /* Limpiar el float */
        }
        td {
          width: 100%; /* Ancho del 100% de la celda de la tabla */
        }
        .Boton{
            width:120px;
            margin-bottom: 30px;
        }
        .left-column {
            float: left;
            width:130px;
        }

        .right-column {
                float: left;
        }
        .auto-style1 {
            float: left;
            width: 207px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="container">
            <asp:HyperLink ID="linkListado" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx">Listado de Sucursales</asp:HyperLink>
            <asp:HyperLink ID="linkMostrarSeleccionados" runat="server" NavigateUrl="~/MostrarSucursales.aspx">Mostrar Sucursales Seleccionadas</asp:HyperLink>
            </div>
            <div>
            <asp:Label ID="lblListado" runat="server" Text="Listado de Sucursales" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div>
            <div class ="container">
        <asp:Label ID="lblBusqueda" runat="server" Text="Búsqueda por Nombre de Sucursal"></asp:Label>
        <asp:TextBox ID="txtboxBusqueda" runat="server"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
            </div>
        <div class="container">
              <table class="left-column">
      <tr>
        <td>
            <asp:Button ID="btnBuenosAires" runat="server" Text="Buenos Aires" CssClass="Boton" />
          
        </td>
      </tr>
      <tr>
        <td>
            <asp:Button ID="btnEntreRios" runat="server" Text="Entre Rios" CssClass="Boton" />

        </td>
      </tr>
      <tr>
        <td>
            <asp:Button ID="btnSantaFe" runat="server" Text="Santa Fé" CssClass="Boton" />
          
        </td>
      </tr>
          <tr>
        <td>
            <asp:Button ID="btnLaPampa" runat="server" Text="La Pampa" CssClass="Boton" />
          
        </td>
      </tr>
          <tr>
        <td>
            <asp:Button ID="btnCórdoba" runat="server" Text="Córdoba" CssClass="Boton"/>
          
        </td>
      </tr>
          <tr>
        <td>
            <asp:Button ID="btnMisiones" runat="server" Text="Misiones" CssClass="Boton" />
          
        </td>
      </tr>
          <tr>
        <td>
            <asp:Button ID="btnChaco" runat="server" Text="Chaco" CssClass="Boton" />
          
        </td>
      </tr>
    </table>

      <div class="auto-style1">
                <asp:ListView ID="lvSucursales" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
                    <%--<AlternatingItemTemplate>
                        <td runat="server" style="background-color: #FFFFFF;color: #284775;">NombreSucursal:
                            <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                            <br />
                            URL_Imagen_Sucursal:
                            <asp:Label ID="URL_Imagen_SucursalLabel" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
                            <br />
                            DescripcionSucursal:
                            <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                            <br />
                        </td>
                    </AlternatingItemTemplate>--%>
                    <EditItemTemplate>
                        <td runat="server" style="background-color: #999999;">NombreSucursal:
                            <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                            <br />URL_Imagen_Sucursal:
                            <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                            <br />
                            DescripcionSucursal:
                            <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                            <br />
                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
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
                        <td runat="server" style="">NombreSucursal:
                            <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                            <br />URL_Imagen_Sucursal:
                            <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                            <br />
                            DescripcionSucursal:
                            <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                            <br />
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                            &nbsp;<asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                            <br />
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' />
&nbsp;<asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                            <br /></td>
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
                                <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">NombreSucursal:
                            <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                            <br />URL_Imagen_Sucursal:
                            <asp:Label ID="URL_Imagen_SucursalLabel" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
                            <br />DescripcionSucursal:
                            <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString2 %>" SelectCommand="SELECT [NombreSucursal], [URL_Imagen_Sucursal], [DescripcionSucursal] FROM [Sucursal]"></asp:SqlDataSource>
        </div>
</div>
    </form>
</body>
</html>
