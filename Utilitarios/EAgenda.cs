using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class EAgenda
    {
        //
        // TODO: Add constructor logic here
        //
        private Int32 personas;

        public Int32 Personas
        {
            get { return personas; }
            set { personas = value; }
        }

        private String hora;

        public String Hora
        {
            get { return hora; }
            set { hora = value; }
        }
    }
}