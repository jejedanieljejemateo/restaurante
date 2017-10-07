using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Utilitarios
{
    public class EPlato
    {
        private int idplato;

        public int IdPlato
        {
            get { return idplato; }
            set { idplato = value; }
        }
        private string descrip;

        public string Descrip
        {
            get { return descrip; }
            set { descrip = value; }
        }
        private int precio;

        public int Precio
        {
            get { return precio; }
            set { precio = value; }
        }
        private string imagenUrl;

        public string ImagenUrl
        {
            get { return imagenUrl; }
            set { imagenUrl = value; }
        }
        private string rating;

        public string Rating
        {
            get { return rating; }
            set { rating = value; }
        }
        private string mensaje;

        public string Mensaje
        {
            get { return mensaje; }
            set { mensaje = value; }
        }
        private string redirec;

        public string Redirec
        {
            get { return redirec; }
            set { redirec = value; }
        }
        private DataTable datos;

        public DataTable Datos
        {
            get { return datos; }
            set { datos = value; }
        }
        private DataTable datos2;

        public DataTable Datos2
        {
            get { return datos2; }
            set { datos2 = value; }
        }
    }
}
