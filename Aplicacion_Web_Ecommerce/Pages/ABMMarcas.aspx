﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Ecommerce.Master" AutoEventWireup="true" CodeBehind="ABMMarcas.aspx.cs" Inherits="Aplicacion_Web_Ecommerce.Pages.ABMMarcas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <%if (tipo == "a")
        { %>
        
        
        
     <%//----------------------------------------------------------------------------------------------- %>

    <div class="form-control">
        <div class="mb-3 row">
            <div class="col">
                <asp:Label ID="LabelNombreMarca" runat="server" Text="Nombre de la marca"></asp:Label>
                <asp:TextBox ID="TextBoxNombreMarca" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>

    <asp:Button ID="BtnAgregar" runat="server" onclick="BtnAgregar_Click" Text="Agregar" />
        
        
        
        
        
        
        <%} %>
    <%else if(tipo=="e") { %>
               
        <%} %>



</asp:Content>
