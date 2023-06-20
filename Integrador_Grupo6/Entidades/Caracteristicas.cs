using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Caracteristicas
    {

        public Caracteristicas()
        {
        }

        public Caracteristicas(string cod_Caracteristica_Car, string nombre_Car)
        {
            Cod_Caracteristica_Car1 = cod_Caracteristica_Car;
            Nombre_Car1 = nombre_Car;
        }

        private string Cod_Caracteristica_Car;
        private string Nombre_Car;

        public string Cod_Caracteristica_Car1 { get => Cod_Caracteristica_Car; set => Cod_Caracteristica_Car = value; }
        public string Nombre_Car1 { get => Nombre_Car; set => Nombre_Car = value; }
    }
}
