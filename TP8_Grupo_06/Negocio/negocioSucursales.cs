using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
using System.Data;


namespace Negocio
{
    public class negocioSucursales
    {
        public bool AgregarSucursal(string nombre, string descripcion, int idProvincia, string direccion)
        {
            int filaAfectada = 0;
            Sucursal suc = new Sucursal();
            suc.Nombre = nombre;
            suc.Descripcion = descripcion;
            suc.IdProvincia = idProvincia;
            suc.Direccion = direccion;
            datosSucursal datos = new datosSucursal();
            if (datos.existeSucursal(suc) == false)
            {
                filaAfectada = datos.agregarSucursal(suc);
            }

            if (filaAfectada == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public DataTable ListarSucursales()
        {
            datosSucursal ds = new datosSucursal();

            return ds.TablaSucursales();
        }

        public DataTable ObtenerSucursal(string id)
        {
            datosSucursal ds = new datosSucursal();
            Sucursal suc = new Sucursal();
            DataTable tabla;

            suc.Id = Convert.ToInt32(id);

            tabla = ds.DatosSucursal(suc);

            return tabla;
        }
        public bool eliminarSucursal(int idSucursal)
        {
            datosSucursal dao = new datosSucursal();
            Sucursal suc = new Sucursal();
            suc.Id = idSucursal;
            int op = dao.EliminarSucursal(suc);
            if (op == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
