using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace principalForm
{
    public class Productos
    {
        private int i_IdProducto;
        private string s_Nombre;
        private string s_Cantidad;
        private float f_Precio;

        public Productos()
        {
        }

        public Productos(int i_IdProducto, string s_Nombre, string s_Cantidad, float f_Precio)
        {
            this.i_IdProducto = i_IdProducto;
            this.s_Nombre = s_Nombre;
            this.s_Cantidad = s_Cantidad;
            this.f_Precio = f_Precio;
        }

        public int IdProducto
        {
            get { return i_IdProducto; }
            set { i_IdProducto = value; }
        }
        public string Nombre
        {
            get { return s_Nombre; }
            set { s_Nombre = value; }
        }

        public string Cantidad
        {
            get { return s_Cantidad; }
            set { s_Cantidad = value; }
        }

        public float Precio
        {
            get { return f_Precio; }
            set { f_Precio = value; }
        }
    }
}