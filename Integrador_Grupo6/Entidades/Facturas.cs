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

        public Facturas(int nroFactura_Fa, Usuario dNI_Fa, MetodoDeEnvio codMetodoEnvio_Fa, MetodoDePago codMetodoPago_Fa, DateTime fecha_Fa, string direccionEntrega_Fa, decimal total_Fa)
        {
            NroFactura_Fa1 = nroFactura_Fa;
            DNI_Fa1 = dNI_Fa;
            CodMetodoEnvio_Fa1 = codMetodoEnvio_Fa;
            CodMetodoPago_Fa1 = codMetodoPago_Fa;
            Fecha_Fa1 = fecha_Fa;
            DireccionEntrega_Fa1 = direccionEntrega_Fa;
            Total_Fa1 = total_Fa;
        }

        private int NroFactura_Fa;
        private Usuario DNI_Fa = new Usuario();
        private MetodoDeEnvio CodMetodoEnvio_Fa = new MetodoDeEnvio();
        private MetodoDePago CodMetodoPago_Fa = new MetodoDePago();
        private DateTime Fecha_Fa;
        private string DireccionEntrega_Fa;
        private decimal Total_Fa;

        public int NroFactura_Fa1 { get => NroFactura_Fa; set => NroFactura_Fa = value; }
        public Usuario DNI_Fa1 { get => DNI_Fa; set => DNI_Fa = value; }
        public MetodoDeEnvio CodMetodoEnvio_Fa1 { get => CodMetodoEnvio_Fa; set => CodMetodoEnvio_Fa = value; }
        public MetodoDePago CodMetodoPago_Fa1 { get => CodMetodoPago_Fa; set => CodMetodoPago_Fa = value; }
        public DateTime Fecha_Fa1 { get => Fecha_Fa; set => Fecha_Fa = value; }
        public string DireccionEntrega_Fa1 { get => DireccionEntrega_Fa; set => DireccionEntrega_Fa = value; }
        public decimal Total_Fa1 { get => Total_Fa; set => Total_Fa = value; }
    }
}
