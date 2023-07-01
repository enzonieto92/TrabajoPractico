using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Dao;
using Entidades;


namespace Negocio
{
    public class NegocioDetalleFactura
    {
        DAOdetalleFactura dDF = new DAOdetalleFactura();
        public DataTable getTabla(String nroFactura)
        {
            return dDF.getTabla(nroFactura);
        }

        public decimal getTotalProductosVendidos(string consulta)
        {
            decimal cantidad = dDF.getTotalProductosVendidos(consulta);
            return cantidad;
        }

        public bool insertarDetalles(String codProducto, String codCaracteristica, String color, Decimal precioUn, int cantidad)
        {
            DetalleFacturas df = new DetalleFacturas();

            df.CodProducto_Df1.CodProducto_Pr1 = codProducto;
            df.CodCaracteristicas_Df1.Cod_Caracteristica_Car1 = codCaracteristica;
            df.CodColor_Df1.Cod_Color_Co1 = color;
            df.Cantidad_Df1 = cantidad;
            df.PrecioUnitario_Df1 = precioUn;

            int cantfilas = dDF.agregarDetalleFacturas(df);

            if (cantfilas >= 1)
                return true;
            else
                return false;
        }
    }

    
}
