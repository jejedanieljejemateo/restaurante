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
    public class CoreReserva
    {
        public void PageLoadReserva(DropDownList personas, DropDownList hora, String fechas, Label iniciar, LinkButton cerrar, Label perfil)
        {

            if (HttpContext.Current.Session["personas"] == null)
            {
                HttpContext.Current.Session["personas"] = 1;
            }
            else
            {
                HttpContext.Current.Session["personas"] = personas.SelectedItem.Value;
            }
            if (HttpContext.Current.Session["hora"] == null)
            {
                HttpContext.Current.Session["hora"] = "12:00:00-05";
            }
            else
            {
                HttpContext.Current.Session["hora"] = hora.SelectedItem.Value;
            }

            EAgenda encapsular = new EAgenda();
            encapsular.Personas = Convert.ToInt32(HttpContext.Current.Session["personas"]);
            encapsular.Hora = Convert.ToString(HttpContext.Current.Session["hora"]);
            DAOUsuario datos = new DAOUsuario();

            DataTable data = datos.mostrarAgenda(encapsular);

            if (data.Rows.Count > 0)
            {
                string dates = "''";
                for (int i = 0; i < data.Rows.Count; i++)
                {
                    string cont = data.Rows[i]["fecha_reserva"].ToString();
                    DateTime dt = DateTime.Parse(cont);
                    cont = dt.ToString("dd-MM-yyyy");

                    dates = dates + ",'" + cont + "'";
                }
                fechas = "[" + dates + "]";

            }



            if (HttpContext.Current.Session["user"] == null)
            {
                iniciar.Visible = true;
                cerrar.Visible = false;
                perfil.Visible = false;
            }
            else
            {
                iniciar.Visible = false;
                cerrar.Visible = true;
                perfil.Visible = true;
            }

        }


        public string PageLoadOpciones(object userId, object reserva)
        {
            string redirect = null;
            if (userId == null)
            {
                redirect = "login.aspx";
            }
            if (reserva.ToString().Equals("1"))
            {
                redirect = "reserva.aspx#abajo";
            }
            return redirect;
        }

        public DataTable PageLoadOpciones2(object userId)
        {

            EAgenda encapsular = new EAgenda();
            encapsular.Personas = Convert.ToInt32(userId);
            DAOUsuario datos = new DAOUsuario();

            DataTable data = datos.opcionesReserva(encapsular);

            return data;
        }

        public DataTable PageLoadOpciones3(object reservaId)
        {

            EAgenda encapsular2 = new EAgenda();
            encapsular2.Personas = Convert.ToInt32(reservaId);
            DAOUsuario datos2 = new DAOUsuario();

            DataTable data2 = datos2.opcionesPlatos(encapsular2);

            return data2;

        }
        public void Core_BT_Eliminar_Plato_Reserva(int id)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Eliminar_Plato_Reserva(id);
        }
        public void Core_BT_Eliminar_Reserva()
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Eliminar_Reserva();
        }

        public void Core_Obtener_Informe_Reserva(DataRow fila, DataTable personaInformacion)
        {

            EAgenda encapsular = new EAgenda();
            encapsular.Personas = Convert.ToInt32(HttpContext.Current.Session["userId"]);
            DAOUsuario datos2 = new DAOUsuario();

            DataTable Intermedio = datos2.obtenerReservaId(encapsular);

            for (int i = 0; i < Intermedio.Rows.Count; i++)
            {
                fila = personaInformacion.NewRow();

                fila["cant_personas"] = int.Parse(Intermedio.Rows[i]["cant_personas"].ToString());
                fila["precio_total"] = int.Parse(Intermedio.Rows[i]["precio_total"].ToString());
                fila["fecha"] = DateTime.Parse(Intermedio.Rows[i]["fecha"].ToString());
                fila["h_ini"] = DateTime.Parse(Intermedio.Rows[i]["h_ini"].ToString());
                fila["nombre_res"] = HttpContext.Current.Session["nombreRest"].ToString();
                fila["nombre_user"] = HttpContext.Current.Session["user"].ToString();
                fila["ciudad"] = HttpContext.Current.Session["ciudad"].ToString();
                fila["direccion"] = HttpContext.Current.Session["direccion"].ToString();
                fila["nombre_plato"] = Intermedio.Rows[i]["nombre_plato"].ToString();
                fila["precio_unit"] = int.Parse(Intermedio.Rows[i]["precio_unit"].ToString());
                fila["cantidad"] = int.Parse(Intermedio.Rows[i]["cantidad"].ToString());
                fila["precio_total_plato"] = int.Parse(Intermedio.Rows[i]["precio_total_plato"].ToString());
                personaInformacion.Rows.Add(fila);
            }
        }
        public void Core_BT_Reserva(String personas, String hora, String fecha)
        {
            int reserva = Convert.ToInt32(HttpContext.Current.Session["reserva"]);
            int estado = Convert.ToInt32(HttpContext.Current.Session["estado_user"]);

            if (HttpContext.Current.Session["user"] == null)
            {
                HttpContext.Current.Response.Redirect("login.aspx");

            }
            else if (reserva == 3)
            {
                HttpContext.Current.Response.Write("<script language=javascript>window.alert('Hace falta la calificación de platos.');window.location='calificacion.aspx#abajo';</script>");
            }
            else if (estado == 2)
            {
                HttpContext.Current.Response.Write("<script language=javascript>window.alert('Su cuenta está bloqueada. Para activarla envíenos un mensaje con los motivos de su inasistencia.');window.location='contacto.aspx#abajo';</script>");
            }
            else if (reserva == 1)
            {

                DAOUsuario datos = new DAOUsuario();
                datos.reserva(personas, hora, fecha);
            }
            else
            {
                HttpContext.Current.Response.Write("<script language=javascript>window.alert('Ya existe una reservación.');window.location='opciones.aspx#abajo';</script>");
            }
        }
        public void Core_BT_No_Asistio(String nombre)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_No_Asistio(nombre);

        }
        public void Core_BT_Si_Asistio(String nombre)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Si_Asistio(nombre);

        }

        public string PageLoadCalificacion(object reserva, object reservaId)
        {
            string redirect = null;

            if (reserva.ToString().Equals("1"))
            {
                redirect = "reserva.aspx#abajo";
            }
            if (reserva.ToString().Equals("2"))
            {
                //Response.Write("<script language=javascript>window.alert('Aún no puedes calificar los platos.');window.location='perfil.aspx#abajo';</script>");
            }

            return redirect;
        }
        public DataTable PageLoadCalificacion2(object reservaId)
        {

            EAgenda encapsular2 = new EAgenda();
            encapsular2.Personas = Convert.ToInt32(reservaId);
            DAOUsuario datos2 = new DAOUsuario();

            DataTable data2 = datos2.platosCalificacion(encapsular2);

            return data2;

        }
        public void Core_BT_Calificar(int cal, int id)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Calificar(cal, id);
        }

        public void Core_BT_Terminar_Cal()
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Terminar_Cal();
        }
    }
}
