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

      <div class="right-column">
                <asp:ListView ID="lvSucursales" runat="server">
                </asp:ListView>
        </div>
</div>
    </form>
</body>
</html>
