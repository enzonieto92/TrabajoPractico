using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleFacturas
    {

        public DetalleFacturas()
        {
        }

        public DetalleFacturas(Facturas nroFacturas_Df, Productos codProducto_Df, Caracteristicas codCaracteristicas_Df, Colores codColor_Df, decimal precioUnitario_Df, int cantidad_Df)
        {
            NroFacturas_Df1 = nroFacturas_Df;
            CodProducto_Df1 = codProducto_Df;
            CodCaracteristicas_Df1 = codCaracteristicas_Df;
            CodColor_Df1 = codColor_Df;
            PrecioUnitario_Df1 = precioUnitario_Df;
            Cantidad_Df1 = cantidad_Df;
        }

        private Facturas NroFacturas_Df = new Facturas();
        private Productos CodProducto_Df = new Productos();
        private Caracteristicas CodCaracteristicas_Df = new Caracteristicas();
        private Colores CodColor_Df = new Colores();
        private decimal PrecioUnitario_Df;
        private int Cantidad_Df;

        public Facturas NroFacturas_Df1 { get => NroFacturas_Df; set => NroFacturas_Df = value; }
        public Productos CodProducto_Df1 { get => CodProducto_Df; set => CodProducto_Df = value; }
        public Caracteristicas CodCaracteristicas_Df1 { get => CodCaracteristicas_Df; set => CodCaracteristicas_Df = value; }
        public Colores CodColor_Df1 { get => CodColor_Df; set => CodColor_Df = value; }
        public decimal PrecioUnitario_Df1 { get => PrecioUnitario_Df; set => PrecioUnitario_Df = value; }
        public int Cantidad_Df1 { get => Cantidad_Df; set => Cantidad_Df = value; }
    }
}
