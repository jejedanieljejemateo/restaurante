using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class EUsuaurio
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
        private String userName;

        public String UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        private String clave;

        public String Clave
        {
            get { return clave; }
            set { clave = value; }
        }
        private String ip;

        public String Ip
        {
            get { return ip; }
            set { ip = value; }
        }

        private String mac;

        public String Mac
        {
            get { return mac; }
            set { mac = value; }
        }
    }
}
