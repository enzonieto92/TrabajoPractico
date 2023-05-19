<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioEj2.aspx.cs" Inherits="principalForm.formEjercicio2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .Ej1
        {
            margin-top: 1rem;
            font-family: Dubai;
            justify-content:center;
            text-align: center;
        }
        .Buttons
        {
            margin-top: 1rem;
            margin-bottom: 1rem;
            margin-left: 2rem;
            margin-right: 2rem;
            display: inline-block;
            padding: 7px 7px;
            background-color: #5D7B9D; 
            border-radius: 5px; 
            text-decoration: none;
        }
        .Links
        {
            margin-top: 2rem;
            margin-bottom: 2rem;
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="Ej1">

        <div>
            <asp:Label ID="lblEjercicio2" runat="server" Text="Ejercicio N°2"></asp:Label>
         </div>
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

        <div class ="Hyperlink">
        <asp:HyperLink ID="hlInicio" runat="server" Font-Underline="False" NavigateUrl="~/InicioTP.aspx" ForeColor="#3399FF">Volver al Menú Principal</asp:HyperLink>
        </div>

    </form>
</body>
</html>
