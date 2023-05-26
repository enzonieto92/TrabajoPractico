using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace TP7_Grupo_Nro_06
{
    public class gestionSucursales
    {
        private int i_IdSucursal;
        private String s_NombreSucursal;
        private String s_DescripcionSucursal;

        public gestionSucursales(int i_IdSucursal, String s_NombreSucursal, String s_DescripcionSucursal)
        {
            this.i_IdSucursal = i_IdSucursal;
            this.s_NombreSucursal = s_NombreSucursal;
            this.s_DescripcionSucursal = s_DescripcionSucursal;
        }
        public int idSucursal
        {
            get { return i_IdSucursal; }
            set { i_IdSucursal = value; }
        }
        public String NombreSucursal
        {
            get { return s_NombreSucursal; }
            set { s_NombreSucursal = value; }
        }
        public String descripcionSucursal
        {
            get { return s_DescripcionSucursal; }
            set { s_DescripcionSucursal = value; }
        }
    }
}