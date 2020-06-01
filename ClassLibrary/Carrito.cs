using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class Carrito
    {
        public List<Articulo> carro { get; set; }
        public int cantArticulo { get; set; }
        public decimal precioTotal { get; set; }
        
        public Carrito()
        {
            carro = new List<Articulo>();
            cantArticulo = 0;
            precioTotal = 0;
        }
    }
}
