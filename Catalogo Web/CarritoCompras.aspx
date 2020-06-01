<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarritoCompras.aspx.cs" Inherits="Catalogo_Web.CarritoCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">

        <style>
            .oculto {
                display: none;
            }

            .precioTotal {
                margin-top: 2rem;
                font-size: 23px;
                text-align: center;
                font-family: Peralta;
            }

            @font-face {
                font-family: 'Peralta';
                src: url(fonts/Peralta-Regular.ttf);
            }
        </style>

        <asp:GridView CssClass="table" ID="dgvCarritoCompras" runat="server" AutoGenerateColumns="false" OnRowCommand="dgvCarritoCompras_RowCommand" Width="447px">
            <Columns>
                <asp:ButtonField HeaderText="Opcion" ButtonType="Link" Text="Seleccionar" CommandName="Select" />
                <asp:BoundField HeaderText="Id" DataField="id" ItemStyle-CssClass="oculto" HeaderStyle-CssClass="oculto" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Caracteristicas" DataField="Descripcion" />
                <asp:ButtonField HeaderText="Eliminar" ButtonType="Button" Text="Elminar" CommandName="Eliminar" />
                <asp:ButtonField ButtonType="Button" Text="+" CommandName="Add" />
                <asp:ButtonField ButtonType="Button" Text="-" CommandName="Rest" />
                <asp:BoundField HeaderText="Cantidad" DataField="Cant" />
                <asp:BoundField HeaderText="Subtotal" DataField="Precio" />
            </Columns>
        </asp:GridView>
        <asp:Label CssClass="precioTotal" ID="totalLabel" runat="server"></asp:Label>
    </div>
</asp:Content>
