<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarritoCompras.aspx.cs" Inherits="Catalogo_Web.CarritoCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">

        <style>
            .oculto {
                display: none;
            }

            .precioTotal {
                font-size: 30px;
                text-align: right;
                color:azure;
                font-family: Peralta;
                border-style:none;
                border:none;
            }

            .datosDgv {
                font-family: Cinzel;
                color:black;
                font-size: 15px;
                margin-bottom:0px;
            
            }


            .sumaResta{
                width:20px;
                height:20px;
            }

            .eliminar{
                width:30px;
                height:25px;
            }

            .header{
                text-align:center;
                color:white;
            }

            .sinItems{
                margin-top:15rem;
                margin-bottom:15rem;
                font-size:40px;
                color:darkcyan;
                border:none;
                text-align:center;
                font-family:Henny;
            }

            @font-face {
                font-family: 'Cinzel';
                src: url(fonts/CinzelDecorative-Bold.ttf);
            }

            @font-face {
                font-family: 'Peralta';
                src: url(fonts/Peralta-Regular.ttf);
            }

            @font-face {
                font-family: 'Henny';
                src: url(fonts/HennyPenny-Regular.ttf);
            }

        </style>

        <asp:GridView CssClass="table table-borderless btn-dark text-center datosDgv" ID="dgvCarritoCompras" runat="server" AutoGenerateColumns="false" OnRowCommand="dgvCarritoCompras_RowCommand">
            <Columns>
                <asp:ButtonField HeaderText="Opcion" ItemStyle-CssClass="oculto" HeaderStyle-CssClass="oculto" />
                <asp:BoundField HeaderText="Id" DataField="id" ItemStyle-CssClass="oculto" HeaderStyle-CssClass="oculto" />
                <asp:BoundField HeaderText="Producto" HeaderStyle-CssClass="header" DataField="Nombre" ItemStyle-CssClass="alert-info datosDgv" />
                <asp:BoundField HeaderText="Descripcion" HeaderStyle-CssClass="header" DataField="Descripcion" ItemStyle-CssClass="alert-info datosDgv" />
                <asp:BoundField HeaderText="Cantidad" HeaderStyle-CssClass="header" DataField="Cant" ItemStyle-CssClass="alert-info datosDgv" />
                <asp:BoundField HeaderText="Subtotal" HeaderStyle-CssClass="header" DataField="Precio" ItemStyle-CssClass="alert-info datosDgv" />
                <asp:ButtonField ButtonType="Image" ControlStyle-BorderStyle="None" ImageUrl="~/Icons/plus.png"  CommandName="Add" ControlStyle-CssClass="sumaResta" ItemStyle-CssClass="alert-info" />
                <asp:ButtonField ButtonType="Image" ControlStyle-BorderStyle="None" ImageUrl="~/Icons/substract.png" CommandName="Rest" ControlStyle-CssClass="sumaResta" ItemStyle-CssClass="alert-info" />
                <asp:ButtonField ButtonType="Image" ControlStyle-BorderStyle="None" ImageUrl="~/Icons/delete.png" CommandName="Eliminar" ControlStyle-CssClass="eliminar" ItemStyle-CssClass="alert-info" />
            </Columns>
        </asp:GridView>
        <asp:Label CssClass="precioTotal btn-info" ID="totalLabel" runat="server"></asp:Label>
        <asp:Label CssClass="" ID="sinItemLabel" runat="server"></asp:Label>
    </div>
</asp:Content>
