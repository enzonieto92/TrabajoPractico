using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
     public class Productos
     {

        public Productos()
        {

        }

        public Productos(string codProducto_Pr, Marcas codMarcas_Pr, Categorias codCategoria_Pr, string nombre_Pr, string descripcion_Pr, decimal precioUnitario_Pr, string urlImagen_Pr, bool estado_Pr)
        {
            CodProducto_Pr = codProducto_Pr;
            CodMarcas_Pr = codMarcas_Pr;
            CodCategoria_Pr = codCategoria_Pr;
            Nombre_Pr = nombre_Pr;
            Descripcion_Pr = descripcion_Pr;
            PrecioUnitario_Pr = precioUnitario_Pr;
            UrlImagen_Pr = urlImagen_Pr;
            this.estado_Pr = estado_Pr;
        }

        private string CodProducto_Pr;
        private Marcas CodMarcas_Pr = new Marcas();
        private Categorias CodCategoria_Pr = new Categorias();
        private string Nombre_Pr;
        private string Descripcion_Pr;
        private decimal PrecioUnitario_Pr;
        private string UrlImagen_Pr;
        private bool estado_Pr;

        public string CodProducto_Pr1 { get => CodProducto_Pr; set => CodProducto_Pr = value; }
        public Marcas CodMarcas_Pr1 { get => CodMarcas_Pr; set => CodMarcas_Pr = value; }
        public Categorias CodCategoria_Pr1 { get => CodCategoria_Pr; set => CodCategoria_Pr = value; }
        public string Nombre_Pr1 { get => Nombre_Pr; set => Nombre_Pr = value; }
        public string Descripcion_Pr1 { get => Descripcion_Pr; set => Descripcion_Pr = value; }
        public decimal PrecioUnitario_Pr1 { get => PrecioUnitario_Pr; set => PrecioUnitario_Pr = value; }
        public string UrlImagen_Pr1 { get => UrlImagen_Pr; set => UrlImagen_Pr = value; }
        public bool Estado_Pr { get => estado_Pr; set => estado_Pr = value; }
    }
}
