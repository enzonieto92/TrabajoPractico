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
    public class NegocioFactura
    {
        DAOfactura df = new DAOfactura();
        public DataTable getTabla()
        {
            return df.getTabla();
        }
        public DataTable filtrar(string txt)
        {
            return df.getFiltro(txt);
        }
        public DataTable getTablaFecha(string consulta)
        {
            return df.getTablaFecha(consulta);
        }
        public decimal getTotalRecaudado(string consulta)
        {
            decimal cantidad = df.getTotalRecaudado(consulta);
            return cantidad;
        }
        public DataTable getTablav2(string dni)
        {
            Facturas f = new Facturas();
            f.DNI_Fa1.DNI_Us1 = dni;
            return df.getTablav2(f);
        }

        public bool agregarFactura(String dni, String metodoPago, String metodoEnvio, String direccionEntrega, decimal Total)
        {
            int cantFilas = 0;

            Facturas fac = new Facturas();
            fac.DNI_Fa1.DNI_Us1 = dni;
            fac.CodMetodoPago_Fa1.CodMetPago_Pa1 = metodoPago;
            fac.CodMetodoEnvio_Fa1.CodMetEnvio_En1 = metodoEnvio;
            fac.DireccionEntrega_Fa1 = direccionEntrega;
            fac.Total_Fa1 = Total;

            cantFilas = df.agregarFactura(fac);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
    }
}
