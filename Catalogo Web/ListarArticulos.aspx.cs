using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;
using BusinessLayers;

namespace Catalogo_Web
{
    public partial class ListarArticulos : System.Web.UI.Page
    {
        public List<Articulo> ArticulosList { get; set; }
        protected List<Articulo> ListaFiltrada = new List<Articulo>();
        protected ArticuloNegocio negocio = new ArticuloNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                ArticulosList = negocio.ListarArticulos();
                if (!IsPostBack)
                {
                    Repeater.DataSource = ArticulosList;
                    Repeater.DataBind();
                }else
                {
                    Repeater.DataSource = ListaFiltrada;
                    Repeater.DataBind();
                }
                    
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        protected void textBoxBusqueda_TextChanged(object sender, EventArgs e)
        {
            {
                ArticulosList = negocio.ListarArticulos();
                if (textBoxBusqueda.Text == "")
                {
                    Repeater.DataSource = ArticulosList;
                    Repeater.DataBind();
                    Session.Add(Session.SessionID + "Busqueda", ArticulosList);
                }
                else
                {

                    ListaFiltrada = ArticulosList.FindAll(k => k.Descripcion.ToLower().Contains(textBoxBusqueda.Text.ToLower())
                    || k.Nombre.ToLower().Contains(textBoxBusqueda.Text.ToLower())
                    || k.IdMarca.Descripcion.ToLower().Contains(textBoxBusqueda.Text.ToLower())
                    || k.IdCategoria.Descripcion.ToLower().Contains(textBoxBusqueda.Text.ToLower()));
                    Session.Add(Session.SessionID + "Busqueda", ListaFiltrada);
                    Repeater.DataSource = ListaFiltrada;
                    Repeater.DataBind();
                }
            }
        }

        protected void btnArgumento_Command(object sender, CommandEventArgs e)
        {
            Carrito carro = new Carrito();
            Articulo articulo = new Articulo();
            try
            {
                var articuloSelec = Convert.ToInt32(((Button)sender).CommandArgument);
                articulo = ArticulosList.Find(J => J.Id == articuloSelec);
                if (Session[Session.SessionID + "articulo"] != null)
                {
                    carro = (Carrito)Session[Session.SessionID + "articulo"];
                }
                if (!carro.carro.Exists(A => A.Id == articulo.Id))
                {
                    carro.carro.Add(articulo);
                    carro.cantArticulo++;
                    carro.precioTotal += articulo.Precio;
                    Session.Add(Session.SessionID + "articulo", carro);
                }
                Response.Redirect("ListarArticulos.aspx");


            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}