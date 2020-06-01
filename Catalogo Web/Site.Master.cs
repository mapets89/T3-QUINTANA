using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;

namespace Catalogo_Web
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Carrito carro = new Carrito();
            try
            {
                
                if (!IsPostBack && Session[Session.SessionID + "articulo"]==null)
                {
                    CantCarrito.Text = "0";
                    Session.Add(Session.SessionID + "articulo", carro);
                    CantCarrito.BackColor = System.Drawing.Color.Transparent; 

                }
                else
                {
                    carro = (Carrito)Session[Session.SessionID + "articulo"];
                    CantCarrito.Text = carro.cantArticulo.ToString();
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        
    }
}