﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ejercicio1.aspx.cs" Inherits="TP5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbAgregarSucursal" runat="server">Agregar Sucrusal</asp:LinkButton>
            <br />
            <br />
            <br />
        </div>
        <asp:Label ID="lblGrupo" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GRUPO Nº6"></asp:Label>
        <p>
            <asp:Label ID="lblAgregarSucursal" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Agregar Sucursal"></asp:Label>
        </p>
        <p style="height: 3px">
            &nbsp;</p>
        <asp:Label ID="lblNombreSucursal" runat="server" Text="Nombre Sucursal:"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" style="margin-left: 105px" Width="226px"></asp:TextBox>
        <p>
            <asp:Label ID="lblDescripcion" runat="server" Height="45px" Text="Descripción:"></asp:Label>
            <asp:TextBox ID="txtDescripcion" runat="server" Height="44px" style="margin-left: 139px" Width="227px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Height="17px" style="margin-left: 156px" Width="233px">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="lblDireccion" runat="server" Text="Dirección:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 155px" Width="224px"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
