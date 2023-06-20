using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class CaracteristicasXproductoXcolores
    {
        public CaracteristicasXproductoXcolores()
        {
        }

        public CaracteristicasXproductoXcolores(Productos codProductos_CXPXC, Caracteristicas codCaracteristicas_CXPXC, Colores codColor_CXPXC, int stock_CXPXC)
        {
            CodProductos_CXPXC1 = codProductos_CXPXC;
            CodCaracteristicas_CXPXC1 = codCaracteristicas_CXPXC;
            CodColor_CXPXC1 = codColor_CXPXC;
            Stock_CXPXC1 = stock_CXPXC;
        }

        private Productos CodProductos_CXPXC = new Productos();
        private Caracteristicas CodCaracteristicas_CXPXC = new Caracteristicas();
        private Colores CodColor_CXPXC = new Colores();
        private int Stock_CXPXC;

        public Productos CodProductos_CXPXC1 { get => CodProductos_CXPXC; set => CodProductos_CXPXC = value; }
        public Caracteristicas CodCaracteristicas_CXPXC1 { get => CodCaracteristicas_CXPXC; set => CodCaracteristicas_CXPXC = value; }
        public Colores CodColor_CXPXC1 { get => CodColor_CXPXC; set => CodColor_CXPXC = value; }
        public int Stock_CXPXC1 { get => Stock_CXPXC; set => Stock_CXPXC = value; }
    }
}
