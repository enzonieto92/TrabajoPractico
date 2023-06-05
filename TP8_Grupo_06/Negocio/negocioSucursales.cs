﻿using System;
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
                return false;

        }
    }
}