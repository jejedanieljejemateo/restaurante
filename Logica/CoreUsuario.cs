using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Utilitarios;
using Data;
using System.Configuration;
using System.Net.NetworkInformation;
using AjaxControlToolkit;

namespace Logica
{
    public class CoreUsuario
    {

        public string[] autenticate(String userName, String clave)
        {
            EUsuaurio encapsular = new EUsuaurio();
            encapsular.UserName = userName.ToString();
            encapsular.Clave = clave.ToString();

           //string ipAddress = HttpContext.Current.Request.UserHostAddress;
           //encapsular.Mac = Utilidades.Mac.GetMAC(ref ipAddress);
           //encapsular.Ip = ipAddress;

           string hol = encapsular.Mac;

           string mac = "sadada";
           string ip = "adasda";
           string userId = null;
           string user = null;
           string rolid = null;
           string reserva = null;
           string estado_user = null;
           string fechaReserva = null;
           string horaReserva = null;
           string reservaId = null;
           string sesiones_activas=null;
           string fecha_bloqueo=null;
           string redirect = null;
           string mensaje = null;
           int sesiones=0;
           string intentos=null;
           string clav=null;
        int inten;
            DAOUsuario datos = new DAOUsuario();

            DataTable data = datos.loginUsuarios(encapsular);
            if (data.Rows.Count > 0){
                

                userId= data.Rows[0]["id"].ToString();
                user = data.Rows[0]["nombre"].ToString();
                rolid = data.Rows[0]["rol_id"].ToString();
                reserva = data.Rows[0]["estado_reserva"].ToString();
                estado_user = data.Rows[0]["estado_usuario"].ToString();
                fechaReserva = data.Rows[0]["fecha"].ToString();
                horaReserva = data.Rows[0]["h_sal"].ToString();
                reservaId = data.Rows[0]["id_reserva"].ToString();
                sesiones_activas = data.Rows[0]["sesiones_activas"].ToString();
                fecha_bloqueo = data.Rows[0]["fecha_desbloqueo"].ToString();
                clav = data.Rows[0]["clave"].ToString();
                intentos = data.Rows[0]["numero_intentos"].ToString();
                HttpContext.Current.Session["asd"] = sesiones_activas; HttpContext.Current.Session["qwe"] = fecha_bloqueo;


                //datos.userIpMac();
                inten=int.Parse(intentos);
                sesiones=int.Parse(sesiones_activas);
                DateTime fecha = DateTime.Parse(fecha_bloqueo);
                if (clav == clave)
                {
                    if (fecha < DateTime.Now)
                    {
                        if (sesiones < 3)
                        {
                            if (inten <= 3)
                            {
                                if (rolid.ToString().Equals("1"))
                                {
                                    redirect = "panel/menu.aspx";
                                }
                                else if (rolid.ToString().Equals("2"))
                                {
                                    redirect = "panel/ventas.aspx";
                                }
                                else if (rolid.ToString().Equals("3"))
                                {
                                    redirect = "perfil.aspx#abajo";
                                }
                            }
                            else
                            {
                                redirect = null;
                                mensaje = "numero de intentos exedidos";
                                mac = "sadada";
                                ip = "adasda";
                                userId = null;
                                user = null;
                                rolid = null;
                                reserva = null;
                                estado_user = null;
                                fechaReserva = null;
                                horaReserva = null;
                                reservaId = null;
                                sesiones_activas = null;
                                fecha_bloqueo = null;
                                redirect = null;
                                sesiones = 0;
                                clav = null;
                            }
                        }
                        else
                        {
                            redirect = null;
                            mensaje = "se a exedido el numero de sesiones activas";
                            mac = "sadada";
                            ip = "adasda";
                            userId = null;
                            user = null;
                            rolid = null;
                            reserva = null;
                            estado_user = null;
                            fechaReserva = null;
                            horaReserva = null;
                            reservaId = null;
                            sesiones_activas = null;
                            fecha_bloqueo = null;
                            redirect = null;
                            sesiones = 0;
                            clav = null;

                        }
                    }
                    else
                    {
                        redirect = null;
                        mensaje = "continua bloqueado por exeso de intentos";
                        mac = "sadada";
                        ip = "adasda";
                        userId = null;
                        user = null;
                        rolid = null;
                        reserva = null;
                        estado_user = null;
                        fechaReserva = null;
                        horaReserva = null;
                        reservaId = null;
                        sesiones_activas = null;
                        fecha_bloqueo = null;
                    }
                }else
                {
                    redirect = null;
                    mensaje = "clave incorrecta :v";
                    mac = "sadada";
                    ip = "adasda";
                    userId = null;
                    user = null;
                    rolid = null;
                    reserva = null;
                    estado_user = null;
                    fechaReserva = null;
                    horaReserva = null;
                    reservaId = null;
                    sesiones_activas = null;
                    fecha_bloqueo = null;
                }
                }
            string[] perfil = {ip,mac,userId,user,rolid,reserva,estado_user,fechaReserva,horaReserva,reservaId,redirect,mensaje};
            /*
            perfil[1] = mac;
            perfil[2] = userId;
            perfil[3] = user;
            perfil[4] = rolid;
            perfil[5] = reserva;
            perfil[6] = estado_user;
            perfil[7] = fechaReserva;
            perfil[8] = horaReserva;
            perfil[9] = reservaId;
            perfil[10] = redirect;
            */

            return perfil;
        }
       

        
       
        public string Core_BT_Registro(String userName, String nombre, String email, String pass, String tel, int cedula, object rolId)
        {
            string a=null;
            if (rolId != null)
            {

               a="<script>alert('Error: Ya estás registrado!');</script>";
            }
            else
            {

                EAgenda encapsular = new EAgenda();
                encapsular.Hora = userName.ToString();
                DAOUsuario datos = new DAOUsuario();

                DataTable data = datos.mostrarDisponible(encapsular);

                if (data.Rows.Count > 0)
                {
                   a="<script>alert('Error: Ya existe una cuenta con el mismo nombre de usuario!');</script>";
                }
                else
                {
                    DAOUsuario dao = new DAOUsuario();
                    dao.DAO_BT_Registro(userName,nombre,email,pass,tel,cedula);
                }

            }
            return a;
        }
        public void Core_BT_Contacto_Enviar(String nombre, String email, String tel, String msj)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Contacto_Enviar(nombre,email,tel,msj);
        }
        public void Core_BT_Editar_Info(String tbNombre, String tbMision, String tbVision, String tbQuienes,
            String tbEslogan, String tbTitulo1, String tbTitulo2, String tbTitulo3, String tbTexto1, String tbTexto2, String tbTexto3,
            String tbInfo, String tbCiudad, String tbDire, String tbMapa, String tbEmail)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Editar_Info(tbNombre, tbMision, tbVision, tbQuienes, tbEslogan, tbTitulo1, tbTitulo2, tbTitulo3,
            tbTexto1, tbTexto2, tbTexto3, tbInfo, tbCiudad, tbDire, tbMapa, tbEmail);
        }

        public void Core_BT_Editar_tipo_Info(String tbNombre, int tbPrecio)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Editar_tipo_Info(tbNombre,tbPrecio);

        }

        

        



        public void Core_Obtener_Informe_Inventario(DataRow fila, DataTable personaInformacion)
        {
            DAOUsuario datos2 = new DAOUsuario();

            DataTable Intermedio = datos2.mostrarIngredientes();

            for (int i = 0; i < Intermedio.Rows.Count; i++)
            {
                fila = personaInformacion.NewRow();

                fila["nombre"] = Intermedio.Rows[i]["nombre"].ToString();
                fila["unidad"] = Intermedio.Rows[i]["unidad"].ToString();
                fila["cantidad"] = double.Parse(Intermedio.Rows[i]["cantidad"].ToString());
                fila["minimo"] = double.Parse(Intermedio.Rows[i]["minimo"].ToString());
                personaInformacion.Rows.Add(fila);
            }
        }

        public void Core_Obtener_Informe_Ventas(DataRow fila, DataTable personaInformacion)
        {

            DAOUsuario datos2 = new DAOUsuario();

            DataTable Intermedio = datos2.mostrarReservas();

            for (int i = 0; i < Intermedio.Rows.Count; i++)
            {
                fila = personaInformacion.NewRow();

                fila["nombre"] = Intermedio.Rows[i]["nombre"].ToString();
                fila["fecha_final"] = DateTime.Parse(Intermedio.Rows[i]["fecha_final"].ToString());
                fila["fecha_inicial"] = DateTime.Parse(Intermedio.Rows[i]["fecha_inicial"].ToString());
                fila["fecha_salida"] = DateTime.Parse(Intermedio.Rows[i]["fecha_salida"].ToString());
                fila["numero_de_personas"] = int.Parse(Intermedio.Rows[i]["numero_de_personas"].ToString());
                fila["precio_total"] = int.Parse(Intermedio.Rows[i]["precio_total"].ToString());
                personaInformacion.Rows.Add(fila);
            }
        }

        public void Core_BT_Desbloquear_Usuario(String nombre)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Desbloquear_Usuario(nombre);

        }

        public string PageLoadLogin(object user)
        {
            string redirect = null;
            if (user != null)
            {
                redirect="perfil.aspx#abajo";
            }
            return redirect;
        }
        public string PageloadAutenticar(object user)
        {
            string redirect = null;
            if (user == null)
            {
                redirect = "login.aspx#abajo";
            }
            return redirect;
        }

        public string PageLoadAutenticarPanel(object user, object rolId)
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
            return redirect;
        }

        public string PageLoadAutenticarPanel2(Object user, Object rolId)
        {
            string redirect = null;
            if (user == null)
            {
                redirect = "/Presentacion/login.aspx";
            }
            if (rolId.ToString().Equals("1"))
            {
                redirect = "/Presentacion/panel/menu.aspx";
            }
            if (rolId.ToString().Equals("3"))
            {
                redirect = "/Presentacion/inicio.aspx";
            }
            return redirect;
        }

        public string[] PageLoadMaster(Label iniciar, LinkButton cerrar, Label perfil, object user)
        {
            DAOUsuario datos = new DAOUsuario();
            DataTable dt = datos.mostrarInfo();
            string nombre_restaurante=null;
            string mision=null;         
            string vision = null;
            string quienes = null;
            string eslogan = null;
            string titulo1 = null;
            string texto1 = null;
            string titulo2 = null;
            string texto2 = null;
            string titulo3 = null;
            string texto3 = null;
            string info_ubicacion = null;
            string ciudad = null;
            string direccion = null;
            string email = null;
            string mapa = null;
            if (dt.Rows.Count > 0)
            {
                nombre_restaurante = dt.Rows[0]["nombre_restaurante"].ToString();
                mision = dt.Rows[0]["mision"].ToString();
                vision = dt.Rows[0]["vision"].ToString();
                quienes = dt.Rows[0]["quienes"].ToString();
                eslogan = dt.Rows[0]["eslogan"].ToString();
                titulo1 = dt.Rows[0]["titulo1"].ToString();
                texto1 = dt.Rows[0]["texto1"].ToString();
                titulo2 = dt.Rows[0]["titulo2"].ToString();
                texto2 = dt.Rows[0]["texto2"].ToString();
                titulo3 = dt.Rows[0]["titulo3"].ToString();
                texto3 = dt.Rows[0]["texto3"].ToString();
                info_ubicacion = dt.Rows[0]["info_ubicacion"].ToString();
                ciudad = dt.Rows[0]["ciudad"].ToString();
                direccion = dt.Rows[0]["direccion"].ToString();
                mapa = dt.Rows[0]["mapa"].ToString();
                email = dt.Rows[0]["email"].ToString();
            }
            string[] retorno = {nombre_restaurante,mision,vision,quienes,eslogan,titulo1,texto1,titulo2,texto2,titulo3,texto3,info_ubicacion,direccion,ciudad,mapa,email}; 
           /* retorno[0]=nombre_restaurante;
            retorno[1]=mision;
            retorno[2]=vision;
            retorno[3]=quienes;
            retorno[4]=eslogan;
            retorno[5]=titulo1;
            retorno[6]=texto1;
            retorno[7]=titulo2;
            retorno[8]=texto2;
            retorno[9]=titulo3;
            retorno[10]=texto3;
            retorno[11]=info_ubicacion;
            retorno[12]=ciudad;
            retorno[13]=direccion;
            retorno[14]=mapa;
            retorno[15]=email;*/


            if (user == null)
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
            return retorno;
        }

       


        }

}