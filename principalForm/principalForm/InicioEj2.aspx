<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioEj2.aspx.cs" Inherits="principalForm.formEjercicio2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .Ej1
        {
            justify-content:center;
            text-align: center;
        }
        .Buttons
        {
            margin-top: 5rem;
            margin-left: 2rem;
            margin-right: 2rem;
            display: inline-block;
            padding: 7px 7px;
            background-color: #5D7B9D; /* Cambia el color de fondo a tu preferencia */
            border-radius: 5px; /* Ajusta el valor para cambiar el radio de los bordes */
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="Ej1">

        <div>
            <asp:Label ID="lblInicio" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Inicio"></asp:Label>
        </div>

         <div class ="Buttons">
            <asp:HyperLink ID="hpSeleccionar" runat="server" NavigateUrl="~/SeleccionarProductos.aspx" Font-Underline="False" ForeColor="White">Seleccionar Productos</asp:HyperLink>
        </div>

         <div class ="Buttons">
            <asp:LinkButton ID="lbEliminar" runat="server" OnClick="lbEliminar_Click" ForeColor="White" Font-Underline="False">Eliminar Productos Seleccionados</asp:LinkButton>
        </div>

         <div class ="Buttons">
            <asp:HyperLink ID="hpMostrar" runat="server" NavigateUrl="~/MostrarProductos.aspx" ForeColor="White" Font-Underline="False">Mostrar Productos</asp:HyperLink>
        </div>

    </form>
</body>
</html>
