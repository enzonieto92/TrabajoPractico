﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarSucursal.aspx.cs" Inherits="TP5_Grupo_Nro_06.AgregarSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
        .auto-style2 {
            margin-left: 160px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <div>
        </div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:LinkButton ID="btnAgregarSucursal" runat="server" OnClick="btnAgregarSucursal_Click">Agregar Sucursal</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnEliminarSucursal" runat="server" OnClick="btnEliminarSucursal_Click">Eliminar Sucursal</asp:LinkButton>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnListarSucursal" runat="server">Listar Sucursal</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
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
        <asp:RequiredFieldValidator ID="rfvNombreSucursal" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revNombreSucursal" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre valido" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]+$" ValidationGroup="Grupo 1">*</asp:RegularExpressionValidator>
        <p>
            <asp:Label ID="lblDescripcion" runat="server" Height="45px" Text="Descripción:"></asp:Label>
            <asp:TextBox ID="txtDescripcion" runat="server" Height="44px" style="margin-left: 139px" Width="227px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="Debe Ingresar una descripción" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
            <asp:DropDownList ID="ddlProvincias" runat="server" CssClass="auto-style1" style="margin-left: 157px" Width="232px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvProvincias" runat="server" ControlToValidate="ddlProvincias" ErrorMessage="Debe seleccionar una Provincia" ForeColor="Red" InitialValue="-- Seleccione --" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="lblDireccion" runat="server" Text="Dirección:"></asp:Label>
            <asp:TextBox ID="txtDireccion" runat="server" style="margin-left: 155px" Width="224px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección" ForeColor="Red" ValidationGroup="Grupo 1">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección valida" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\s]+$" ValidationGroup="Grupo 1">*</asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:Button ID="btnAceptar" runat="server" style="margin-left: 218px" Text="Aceptar" ValidationGroup="Grupo 1" OnClick="btnAceptar_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblAgregado" runat="server"></asp:Label>
        </p>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Grupo 1" />
        <p class="auto-style2">
            &nbsp;</p>
    </form>
</body>
</html>
