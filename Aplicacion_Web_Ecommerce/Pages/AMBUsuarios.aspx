﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Ecommerce.Master" AutoEventWireup="true" CodeBehind="AMBUsuarios.aspx.cs" Inherits="Aplicacion_Web_Ecommerce.Pages.AMBUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <%if (tipo == "a")
        { %>
        
             <div class="form-control">
        <div class="mb-3 row">
            <div class="col">
                <asp:Label ID="lblApellidos" runat="server" Text="Apellidos"></asp:Label>
                <asp:TextBox ID="txtApellidos" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
               <div class="col">
                <asp:Label ID="LabelNombres" runat="server" Text="Nombres"></asp:Label>
                <asp:TextBox ID="TxtNombres" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="col">
                <asp:Label ID="LabelDni" runat="server" Text="Dni"></asp:Label>
                <asp:TextBox ID="TextBoxDni" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
             </div>

          <div class="mb-3 row">
            <div class="col">
                <asp:Label ID="LabelNombreUsuario" runat="server" Text="NombreUsuario"></asp:Label>
                <asp:TextBox ID="TextBoxNombreUsuario" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

             <div class="col">
                <asp:Label ID="LabelContraseña" runat="server" Text="Contraseña"></asp:Label>
                <asp:TextBox ID="TextBoxContraseña" CssClass="form-control" runat="server"></asp:TextBox>
            </div>


            <div class="col">
                <asp:Label ID="LabelRepetirContraseña" runat="server" Text="RepetirContraseña"></asp:Label>
                <asp:TextBox ID="TextBoxRepetirContraseña" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
              <%//En tipo usuario va una dropdonw %>
          </div>

        
                <%//Datos del contacto %>
              <div class="mb-3 row">
               <div class="col">
                   <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
                   <asp:TextBox ID="TextBoxEmail" CssClass="form-control" runat="server"></asp:TextBox>
               </div>

                <div class="col">
                   <asp:Label ID="LabelTelefono" runat="server" Text="Telefono"></asp:Label>
                   <asp:TextBox ID="TextBoxTelefono" CssClass="form-control" runat="server"></asp:TextBox>
               </div>

             
             </div>

              <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
             <div class="mb-3 row">
                  <div class="col">
                      <asp:Label ID="LabelPais" runat="server" Text="Pais"></asp:Label>
                      <asp:DropDownList ID="DropDownListPaises" runat="server" AutoPostBack="true"
                          OnSelectedIndexChanged="DropDownListPaises_SelectedIndexChanged"></asp:DropDownList>
                  </div>

                  <div class="col">
                    <asp:Label ID="LabelProvincia" runat="server" Text="Provincia"></asp:Label>
                      <asp:DropDownList ID="DropDownListProvincia" runat="server" AutoPostBack="true" 
                          OnSelectedIndexChanged="DropDownListProvincia_SelectedIndexChanged"></asp:DropDownList>
                  </div>

                    <div class="col">
                   <%-- <asp:Label ID="Label1" runat="server" Text="Provincia"></asp:Label>--%>
                        <asp:Label ID="LabelLocalidad" runat="server" Text="Localidad"></asp:Label>
                      <asp:DropDownList ID="DropDownListLocalidad" runat="server" AutoPostBack="true"></asp:DropDownList>
                  </div>
              </div>  
            </ContentTemplate>
        </asp:UpdatePanel>


        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                  <ContentTemplate>
                    <div>
                      <asp:Button ID="BtnAgregarUsuario" runat="server" class="btn btn-primary" onclick="BtnAgregarUsuario_Click" Text="Registrarse" type="submit"/>        
                    </div>         
                  </ContentTemplate>         
        </asp:UpdatePanel>

          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <div>
                        <asp:Label ID="LabelErrorCampos" runat="server" Text="" style="color:red"></asp:Label>
                    </div>         
                    </ContentTemplate>         
          </asp:UpdatePanel>

        </div>
   


        
           <div class="mb-3 row">
            <div class="d-grid gap-2 d-md-block">
                <%--<asp:Button ID="ButtonAtras" CssClass="btn btn-primary" runat="server" Text="Atrás" OnClick="ButtonAtras_Click" />--%>
               <%-- <asp:Button ID="BtnAgregar" runat="server" OnClick="BtnAgregar_Click" Text="Agregar" CssClass="btn btn-primary"/>             --%>
            </div>
        </div>

     <%//----------------------------------------------------------------------------------------------- %>

        
        
        <%} %>
    <%else if(tipo=="e") { %>
        
            <div class="form-control">
        <div class="mb-3 row">
            <div class="col">
                <asp:Label ID="LabelNombreDelPais" runat="server" Text="NombrePais"></asp:Label>
                <asp:TextBox ID="TxtNombreDelPais" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
               <div class="col">
                <asp:Label ID="LabelNombreDeLaProvincia" runat="server" Text="Nombre de la provincia"></asp:Label>
                <asp:TextBox ID="TxtNombreDeLaProvincia" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>


      <div class="mb-3 row">
            <div class="d-grid gap-2 d-md-block">
                <%--<asp:Button ID="BtnAtras" CssClass="btn btn-primary" runat="server" Text="Atrás" OnClick="ButtonAtras_Click" />--%>
                <%--<asp:Button ID="Button2" runat="server" OnClick="BtnEditar_Click" Text="Agregar" CssClass="btn btn-primary"/>  --%>           
            </div>
        </div>
    

        <%} %>


</asp:Content>
