using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Sucursal
    {
        private int id;
        private string nombre;
        private string descripcion;
        private int idHorario;
        private int idProvincia;
        private string direccion;
        private string URLimagen;
        public Sucursal()
        {

        }

        public int get
        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Descripcion { get => descripcion; set => descripcion = value; }
        public int IdHorario { get => idHorario; set => idHorario = value; }
        public int IdProvincia { get => idProvincia; set => idProvincia = value; }
        public string Direccion { get => direccion; set => direccion = value; }
        public string URLimagen1 { get => URLimagen; set => URLimagen = value; }
    }
}
