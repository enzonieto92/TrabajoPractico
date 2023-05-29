<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeleccionarSucursales.aspx.cs" Inherits="TP7_Grupo_Nro_06.SeleccionarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .container{
            display:flex;
            justify-content:center;
            margin-top: 10px;
        }
        .left-column {
            float: left;
            width:130px;
        }

        .Buttons
        {
            margin-top: 30px;
            margin-bottom: 30px;
            margin-left:100px;
            margin-right: 100px;
            display: inline;
            padding: 7px 7px;
            background-color: #5D7B9D; 
            border-radius: 5px; 
            text-decoration: none;
        }
        .single-item {
            border: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class ="container">

            <div class ="Buttons">
            <asp:HyperLink ID="linkListado" runat="server" NavigateUrl="~/SeleccionarSucursales.aspx" Font-Underline="False" ForeColor="White">Listado de Sucursales</asp:HyperLink>
            </div>

            <div class ="Buttons">
            <asp:HyperLink ID="linkMostrarSeleccionados" runat="server" NavigateUrl="~/MostrarSucursales.aspx" Font-Underline="False" ForeColor="White">Mostrar Sucursales Seleccionadas</asp:HyperLink>
            </div>

        </div>

            <div class ="container">
            <asp:Label ID="lblListado" runat="server" Text="Listado de Sucursales" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            </div>

            <div class ="container">
        <asp:Label ID="lblBusqueda" runat="server" Text="Búsqueda por Nombre de Sucursal"></asp:Label>
        <asp:TextBox ID="txtboxBusqueda" runat="server"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click1" />
            </div>

        <div class ="container">

           <table class="left-column">
                  <tr>
                    <td>
                        <asp:Label ID="lblMensajeSeleccion" runat="server"></asp:Label>
                      </td>
                  </tr>
                  <tr>
                    <td>
                        <asp:DataList ID="dlProvincias" runat="server" DataSourceID="sqlDataProvincias" Height="571px" Width="155px">
                            <ItemTemplate>
                                <asp:Button ID="btnProvincias" runat="server" CommandArgument='<%# Eval("Id_Provincia") %>' CommandName="comandoBoton" Height="23px" OnCommand="btnProvincias_Command" Text='<%# Eval("DescripcionProvincia") %>' Width="178px" />
            <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>

                    </td>
                  </tr>
                      <tr>
                    <td>
                        <asp:SqlDataSource ID="sqlDataProvincias" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString2 %>" SelectCommand="SELECT [DescripcionProvincia], [Id_Provincia] FROM [Provincia]"></asp:SqlDataSource>
          
                    </td>
                  </tr>
           </table>

        <table>
                <asp:ListView ID="lvSucursales" runat="server" DataSourceID="SqlDataSource1" GroupItemCount='<%# Agrupar() %>'>

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
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;">
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
                        <td runat="server">
                            <br />NombreSucursal:
                            <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                            <br />URL_Imagen_Sucursal:
                            <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                            <br />DescripcionSucursal:
                            <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                            <br />
                        </td>
                    </InsertItemTemplate>

                    <ItemTemplate >
                        <td runat="server" style="background-color: #E0FFFF;color: #333333; width: 250px;">
                            
                            <div>
                            <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' Height="20px" Width="180px"/>
                            </div>
                            <div>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' Height="150px" Width="180px" />
                            </div>
                            <div>
                            <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>'  Width="250px" Height="70px"/>
                            </div>
                            <div>
                            <asp:Button ID="btnSeleccionar" runat="server" Text="Seleccionar" CommandArgument='<%# Eval("Id_Sucursal")+","+Eval("NombreSucursal")+","+Eval("DescripcionSucursal") %>' CommandName="eventoSeleccionar" OnCommand="btnSeleccionar_Command"/>
                            </div>

                        </td>
                    </ItemTemplate>

                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;text-align: center; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" >

                                    <div class="container">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="6" style="text-align:center;">
                                        <Fields>
                                            <asp:NumericPagerField />
                                        </Fields>
                                    </asp:DataPager>
                                    </div>
                                </td>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString2 %>" SelectCommand="SELECT [NombreSucursal], [URL_Imagen_Sucursal], [DescripcionSucursal], [Id_Sucursal], [Id_ProvinciaSucursal] FROM [Sucursal]"></asp:SqlDataSource>
</table>

        </div>
         </form>
    </body>
</html>
