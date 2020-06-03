<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListarArticulos.aspx.cs" Inherits="Catalogo_Web.ListarArticulos" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .button-add {
            float: left;
            position: relative;
            left: 28%;
            color: midnightblue;
            font-size: 15px;
            font-family: Rammet;
        }

        .textbox {
            margin-top: 2rem;
            margin-bottom: 2rem;
            margin-left:10px
        }

        .cardCustom {
            max-height: 300px;
            min-height: 300px;
        }

        .articuloTit{
            font-size:25px;
            text-align:center;
            font-family:Bungee;
        }

        .articuloDesc{
            margin-top:2rem;
            font-size:15px;
            text-align:center;
            font-family:Cinzel;
        }

        .articuloPrec{
            margin-top:2rem;
            font-size:23px;
            text-align:center;
            font-family:Peralta;
        }


        @font-face {
            font-family: 'Rammet';
            src: url(fonts/RammettoOne-Regular.ttf);
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'Bungee';
            src: url(fonts/BungeeInline-Regular.ttf);
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'Cinzel';
            src: url(fonts/CinzelDecorative-Bold.ttf);
        }
         @font-face {
            font-family: 'Peralta';
            src: url(fonts/Peralta-Regular.ttf);
        }
        

    </style>

    <asp:TextBox CssClass="textbox" runat="server" AutoPostBack="true" ID="textBoxBusqueda" OnTextChanged="textBoxBusqueda_TextChanged" />
    <div class="card-columns" style="margin-left: 10px; margin-right: 10px; column-count: 3;">

        <asp:Repeater runat="server" ID="Repeater">
            <ItemTemplate>
                <div class="card body">
                    <h5 class="card-title articuloTit"><%#Eval("Nombre")%></h5>
                    <div>
                        <img src="<%#Eval("ImagenUrl")%>" class="card-img-top cardCustom" alt="...">
                        <p class="card-text articuloPrec">$ <%#Eval("Precio")%></p>
                        <p class="card-text articuloDesc"><%#Eval("Descripcion")%></p>
                    </div>
                    <asp:Button CssClass="button-add btn btn-toolbar" ID="btnArgumento" Text="Añadir al Carrito" runat="server" CommandArgument='<%#Eval("Id")%>' OnCommand="btnArgumento_Command" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
