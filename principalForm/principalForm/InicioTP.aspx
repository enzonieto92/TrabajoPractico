<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioTP.aspx.cs" Inherits="principalForm.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .Inicio
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
            padding: 10px 20px;
            background-color:#5D7B9D; /* Cambia el color de fondo a tu preferencia */
            border-radius: 5px; /* Ajusta el valor para cambiar el radio de los bordes */
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class ="Inicio">

                <div >
                    <asp:Label ID="lblTitulo" runat="server" EnableTheming="True" Font-Bold="True" Font-Italic="False" Font-Size="34pt" Text="Grupo N° 6"></asp:Label>
                </div>

                <div class ="Buttons">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/InicioEj1.aspx" ForeColor="White">Ejercicio 1</asp:HyperLink>
                </div>

                <div class ="Buttons">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/InicioEj2.aspx" ForeColor="White">Ejercicio 2</asp:HyperLink>
                </div>



    </form>
</body>
</html>
