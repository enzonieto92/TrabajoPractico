using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        private string DNI_Us;
        private string Email_Us;
        private string Nombre_Us;
        private string Apellido_Us;
        private DateTime FechaNacimineto_Us;
        private string Telefono_Us;
        private string Usuario_Us;
        private string Contraseña_Us;
        private int Tipo_Us;
        private bool Estado_Us;

        public Usuario()
        {
        }

        public Usuario(string dni_Us, string email_Us, string nombre_Us, string apellido_Us, DateTime fechaNacimiento_Us, string telefono_Us, string usuario_Us, string contraseña_Us, int tipo_Us, bool estado_Us)
        {
            this.DNI_Us = dni_Us;
            this.Email_Us = email_Us;
            this.Nombre_Us = nombre_Us;
            this.Apellido_Us = apellido_Us;
            this.FechaNacimineto_Us = fechaNacimiento_Us;
            this.Telefono_Us = telefono_Us;
            this.Usuario_Us = usuario_Us;
            this.Contraseña_Us = contraseña_Us;
            this.Tipo_Us = tipo_Us;
            this.Estado_Us = estado_Us;
        }

        public string DNI_Us1 { get => DNI_Us; set => DNI_Us = value; }
        public string Email_Us1 { get => Email_Us; set => Email_Us = value; }
        public string Nombre_Us1 { get => Nombre_Us; set => Nombre_Us = value; }
        public string Apellido_Us1 { get => Apellido_Us; set => Apellido_Us = value; }
        public DateTime FechaNacimineto_Us1 { get => FechaNacimineto_Us; set => FechaNacimineto_Us = value; }
        public string Telefono_Us1 { get => Telefono_Us; set => Telefono_Us = value; }
        public string Usuario_Us1 { get => Usuario_Us; set => Usuario_Us = value; }
        public string Contraseña_Us1 { get => Contraseña_Us; set => Contraseña_Us = value; }
        public int Tipo_Us1 { get => Tipo_Us; set => Tipo_Us = value; }
        public bool Estado_Us1 { get => Estado_Us; set => Estado_Us = value; }
    }
}
