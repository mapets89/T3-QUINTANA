using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayers;
using ClassLibrary;

namespace Catalogo_Web
{
    public partial class CarritoCompras : System.Web.UI.Page
    {
        List<Articulo> listaArticulo1 = new List<Articulo>();
        Carrito carrito = new Carrito();
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
            try
            {
                if (Session[Session.SessionID + "articulo"] != null)
                {
                    carrito = (Carrito)Session[Session.SessionID + "articulo"];
                    totalLabel.Text = "$ " + carrito.precioTotal.ToString();
                    dgvCarritoCompras.DataSource = carrito.carro;
                    dgvCarritoCompras.DataBind();
                }
                 

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void dgvCarritoCompras_RowCommand(object sender, GridViewCommandEventArgs gridViewEvent)
        {
            int index = Convert.ToInt32(gridViewEvent.CommandArgument);
            int idArticulo = Convert.ToInt32(dgvCarritoCompras.Rows[index].Cells[1].Text);
            Articulo articulo = carrito.carro.Find(A => A.Id == idArticulo);
            if (Session[Session.SessionID + "precio"] == null || articulo.Id != (int)Session[Session.SessionID + "idSelec"])
            {
                articulo.Precio /= articulo.Cant;
                Session.Add(Session.SessionID + "precio", articulo.Precio);
                Session.Add(Session.SessionID + "idSelec", articulo.Id);
            }
            decimal precioAux = (decimal)Session[Session.SessionID + "precio"];
            switch (gridViewEvent.CommandName)
            {
                case "Eliminar":
                    
                    carrito.carro.Remove(articulo);
                    carrito.cantArticulo--;
                    carrito.precioTotal-=articulo.Precio * articulo.Cant;
                    Session.Add(Session.SessionID + "articulo", carrito);
                    break;
                case "Add":
                    articulo.Cant++;
                    carrito.precioTotal += precioAux;
                    articulo.Precio = articulo.Cant * precioAux;
                    break;
                case "Rest":
                    if (articulo.Cant > 1)
                    {
                        articulo.Cant--;
                        articulo.Precio = precioAux * articulo.Cant;
                        carrito.precioTotal -= precioAux;
                    }
                    break;
            }

            /* if (gridViewEvent.CommandName == "Eliminar")
             {
                 int index = Convert.ToInt32(gridViewEvent.CommandArgument);
                 int idArticulo = Convert.ToInt32(dgvCarritoCompras.Rows[index].Cells[1].Text);
                 Articulo articulo = carrito.carro.Find(A => A.Id == idArticulo);
                 carrito.carro.Remove(articulo);
                 Response.Redirect("CarritoCompras.aspx");
             }
             else if (gridViewEvent.CommandName == "Add")
             {
                 int index = Convert.ToInt32(gridViewEvent.CommandArgument);
                 int idArticulo = Convert.ToInt32(dgvCarritoCompras.Rows[index].Cells[1].Text);
                 Articulo articulo = carrito.carro.Find(A => A.Id == idArticulo);
                 articulo.Cant++;
             }*/
            Response.Redirect("CarritoCompras.aspx");
        }
    }

}