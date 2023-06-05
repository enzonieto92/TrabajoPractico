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
    public class negocioProvincias
    {

        public DataTable getProvincias()
        {
            datosProvincia datos = new datosProvincia();

                return datos.getTablaProvincias();
        }
    }
}
