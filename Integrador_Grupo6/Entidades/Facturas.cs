using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Facturas
    {

        public Facturas()
        {
        }

        private int NroFactura_Fa;
        private Usuario DNI_Fa = new Usuario();
        private MetodoDeEnvio CodMetodoEnvio_Fa = new MetodoDeEnvio();
        private MetodoDePago CodMetodoPago_Fa = new MetodoDePago();
        private DateTime Fecha_Fa;
        private string DireccionEntrega_Fa;
        private decimal Total_Fa;


    }
}
