using AjaxControlToolkit;
using Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.WebControls;
using Utilitarios;

namespace Logica
{
    public class CorePlatos
    {
        public string PageLoadPanelPlato(object user, object rolId, object platoIngre)
        {
            string redirect = null;
            if (user == null)
            {
                redirect = "/Presentacion/login.aspx";
            }
            if (rolId.ToString().Equals("2"))
            {
                redirect = "/Presentacion/panel/ventas.aspx";
            }
            if (rolId.ToString().Equals("3"))
            {
                redirect = "/Presentacion/inicio.aspx";
            }
            if (platoIngre == null)
            {
                redirect = "menu.aspx";
            }
            return redirect;

        }

        public DataTable PageLoadPanelPlato2(object platoIngre)
        {

            DAOUsuario datos = new DAOUsuario();
            int uid = Convert.ToInt32(platoIngre);

            EPlato encapsular = new EPlato();
            encapsular.IdPlato = uid;

            DataTable data = datos.mostrarIngre(encapsular);

            //DAOUsuario dao = new DAOUsuario();
            //dao.PageLoadPanelPlato(FDDL2_Ingrediente);

            return data;

        }
        public EPlato PageLoadPlato(EPlato plato, Rating Rating1)
        {
            if (plato.IdPlato == null || plato.Descrip == null || plato.Precio == null || plato.ImagenUrl == null)
            {
                plato.Redirec = "menu.aspx";
            }
            else
            {
                DAOUsuario datos = new DAOUsuario();
                int uid = plato.IdPlato;

                plato.Datos = datos.mostrarPlatos2(plato);
                plato.Datos2 = datos.clientesCal(plato);

                Rating1.CurrentRating = Convert.ToInt32(plato.Datos.Rows[0]["calificacion"]);

                if (Rating1.CurrentRating != 0)
                {
                    plato.Rating = string.Format("{1} Clientes han puntuado. Promedio: {0:0.0}", plato.Datos.Rows[0]["calificacion"], plato.Datos2.Rows[0]["clientes"]);
                }
                else
                {
                    plato.Rating = "No hay puntuaciones para este plato.";
                }
            }
            return plato;

        }

        public void Core_BT_Agregar_Plato(int idplato, int cant, int prec)
        {
            int reserva = Convert.ToInt32(HttpContext.Current.Session["reserva"]);

            if (HttpContext.Current.Session["user"] == null)
            {
                HttpContext.Current.Response.Redirect("login.aspx");

            }
            else if (reserva == 2)
            {
                DAOUsuario dao = new DAOUsuario();
                dao.DAO_BT_Agregar_Plato(idplato, cant, prec);

            }
            else
            {
                HttpContext.Current.Response.Redirect("reserva.aspx#abajo");
            }

        }
        public void Core_BT_Editar_Ingre(int tbId, double tbCant, double tbMin, String tbNombre,
            String tbDesc, String tbUni)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Editar_Ingre(tbId, tbCant, tbMin, tbNombre, tbDesc, tbUni);

        }

        public void Core_BT_Insertar_Ingre(double tbCant, double tbMin, String tbNombre,
            String tbDesc, String tbUni)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Insertar_Ingre(tbCant, tbMin, tbNombre, tbDesc, tbUni);

        }

        public void Core_BT_Borrar_Ingre(int lbId)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Borrar_Ingre(lbId);

        }
        public void Core_BT_Insertar_Ingre_Plato(double tbCant, String tbIngre)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Insertar_Ingre_Plato(tbCant, tbIngre);

        }
        public void Core_BT_Borrar_Ingre_Plato(int lbId)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Borrar_Ingre_Plato(lbId);

        }
    }
}
