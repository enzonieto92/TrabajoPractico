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
        private int i_Cantidad;
        private float f_Precio;

        public Productos()
        {
        }

        public Productos(int i_IdProducto, string s_Nombre, int i_Cantidad, float f_Precio)
        {
            this.i_IdProducto = i_IdProducto;
            this.s_Nombre = s_Nombre;
            this.i_Cantidad = i_Cantidad;
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

        public int Cantidad
        {
            get { return i_Cantidad; }
            set { i_Cantidad = value; }
        }

        public float Precio
        {
            get { return f_Precio; }
            set { f_Precio = value; }
        }
    }
}