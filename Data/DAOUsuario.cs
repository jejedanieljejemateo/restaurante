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
using Npgsql;
using NpgsqlTypes;
using System.Configuration;
using System.IO;

namespace Data
{
    public class DAOUsuario
    {

        public DataTable loginUsuarios(EUsuaurio user)
        {
            DataTable usuarios = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_login", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_user_name", NpgsqlDbType.Varchar).Value = user.UserName;
                dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



                conection.Open();
                dataAdapter.Fill(usuarios);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return usuarios;
        }

        public DataTable cerrar_sesion(int id)
        {
            DataTable usuarios = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_logincerrar", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;



                conection.Open();
                dataAdapter.Fill(usuarios);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return usuarios;
        }


        public DataTable mostrarPlatos()
        {
            DataTable platos = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_platos", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(platos);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return platos;
        }

        public DataTable mostrarPlatos2(EPlato plato)
        {
            DataTable platos = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_platos2", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = plato.IdPlato;

                conection.Open();
                dataAdapter.Fill(platos);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return platos;
        }

        public DataTable mostrarIngredientes()
        {
            DataTable ingredientes = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_ingredientes", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(ingredientes);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return ingredientes;
        }

        public DataTable mostrarMesas()
        {
            DataTable mesas = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_mesas", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(mesas);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return mesas;
        }

        public DataTable mostrarReservas()
        {
            DataTable reservas = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_reservas", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(reservas);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return reservas;
        }

        public DataTable mostrarReservas2()
        {
            DataTable reservas = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_reservas2", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(reservas);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return reservas;
        }

        
        public DataTable mostrarIngre(EPlato plato)
        {
            DataTable platos = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_mostrar_pla_ingre", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = plato.IdPlato;

                conection.Open();
                dataAdapter.Fill(platos);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return platos;
        }

        public DataTable mostrarAlerta()
        {
            DataTable alerta = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_alerta", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(alerta);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return alerta;
        }
        public DataTable mostrarDisponible(EAgenda user)
        {
            DataTable agenda = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_usuario_disponible", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_user_name", NpgsqlDbType.Varchar).Value = user.Hora;



                conection.Open();
                dataAdapter.Fill(agenda);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return agenda;
        }

        public DataTable mostrarInfo()
        {
            DataTable info = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_informacion", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(info);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return info;
        }

        public DataTable opcionesReserva(EAgenda user)
        {
            DataTable opciones = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_opciones_reserva", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_user_id", NpgsqlDbType.Integer).Value = user.Personas;



                conection.Open();
                dataAdapter.Fill(opciones);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return opciones;
        }

        public DataTable opcionesPlatos(EAgenda user)
        {
            DataTable opciones = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_opciones_platos", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_reserva_id", NpgsqlDbType.Integer).Value = user.Personas;



                conection.Open();
                dataAdapter.Fill(opciones);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return opciones;
        }

        public DataTable platosCalificacion(EAgenda user)
        {
            DataTable opciones = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_mostrar_platos_calificacion", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_reserva_id", NpgsqlDbType.Integer).Value = user.Personas;



                conection.Open();
                dataAdapter.Fill(opciones);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return opciones;
        }

        public DataTable clientesCal(EPlato plato)
        {
            DataTable clientes = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_clientes_calificacion", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_plato_id", NpgsqlDbType.Integer).Value = plato.IdPlato;

                conection.Open();
                dataAdapter.Fill(clientes);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return clientes;
        }

        public DataTable mostrarTipo()
        {
            DataTable info = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_mostrar_tipo", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(info);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return info;
        }

        public DataTable obtenerReservaId2(EAgenda user)
        {
            DataTable id = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_reserva_id2", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_user_id", NpgsqlDbType.Integer).Value = user.Personas;



                conection.Open();
                dataAdapter.Fill(id);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return id;
        }

        public DataTable obtenerReservaId(EAgenda user)
        {
            DataTable id = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_reserva_id", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_user_id", NpgsqlDbType.Integer).Value = user.Personas;



                conection.Open();
                dataAdapter.Fill(id);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return id;
        }

        public DataTable mostrarMensajes()
        {
            DataTable msj = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_mostrar_mensajes", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(msj);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return msj;
        }

        public DataTable mostrarUsuarios()
        {
            DataTable msj = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_mostrar_usuarios", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(msj);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return msj;
        }

        public DataTable mostrarPlato1()
        {
            DataTable platos = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_platos_cal1", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(platos);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return platos;
        }

        public DataTable mostrarPlato2()
        {
            DataTable platos = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_platos_cal2", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(platos);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return platos;
        }

        public void userIpMac()
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                    conection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    conection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = conection;
                    cmd.CommandText = "select * from public.f_ip_mac(@ip,@mac,@id,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    string ip = HttpContext.Current.Session["ip"].ToString();
                    string mac = HttpContext.Current.Session["mac"].ToString();
                    int id = Convert.ToInt32(HttpContext.Current.Session["userId"]);

                    cmd.Parameters.Add(new NpgsqlParameter("@ip", ip));
                    cmd.Parameters.Add(new NpgsqlParameter("@mac", mac));
                    cmd.Parameters.Add(new NpgsqlParameter("@id", id));
                    int userId = Convert.ToInt32(System.Web.HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    conection.Close();

            }

            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void reserva(String personas2, String hora2, String fecha2)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_hacer_reserva(@personas,@hora,@fecha,@usuario,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    int id = Convert.ToInt32(HttpContext.Current.Session["userId"]);

                    string personas = personas2;
                    string hora = hora2;
                    string fecha = fecha2;

                    cmd.Parameters.Add(new NpgsqlParameter("@personas", personas));
                    cmd.Parameters.Add(new NpgsqlParameter("@hora", hora));
                    cmd.Parameters.Add(new NpgsqlParameter("@fecha", fecha));
                    cmd.Parameters.Add(new NpgsqlParameter("@usuario", id));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                    EAgenda encapsular = new EAgenda();
                    encapsular.Personas = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    DAOUsuario datos = new DAOUsuario();

                    DataTable data = datos.obtenerReservaId2(encapsular);

                    if (data.Rows.Count > 0)
                    {
                        HttpContext.Current.Session["reservaId"] = data.Rows[0]["id"].ToString();
                    }

                    HttpContext.Current.Session["reserva"] = "2";
                    HttpContext.Current.Response.Write("<script language=javascript>window.alert('Se ha registrado su reservación con éxito.');window.location='opciones.aspx#abajo';</script>");

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        
        public void DAO_BT_Registro(String userName, String nombre, String email, String pass, String tel, int cedula)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_registro(@nombre,@correo,@cedula,@telefono,@user_name,@clave,@rol_id,@estado_usuario,@estado_reserva)";
                    cmd.CommandType = CommandType.Text;

                    string tbNombre = nombre;
                    string tbCorreo = email;
                    string tbUser2 = userName;
                    string tbPass = pass;
                    string tbTel = tel;

                    int tbCedula = cedula;

                    int rol = 3;
                    int estUser = 1;
                    int estRes = 1;

                    cmd.Parameters.Add(new NpgsqlParameter("@nombre", tbNombre));
                    cmd.Parameters.Add(new NpgsqlParameter("@correo", tbCorreo));
                    cmd.Parameters.Add(new NpgsqlParameter("@cedula", tbCedula));
                    cmd.Parameters.Add(new NpgsqlParameter("@telefono", tbTel));
                    cmd.Parameters.Add(new NpgsqlParameter("@user_name", tbUser2));
                    cmd.Parameters.Add(new NpgsqlParameter("@clave", tbPass));
                    cmd.Parameters.Add(new NpgsqlParameter("@rol_id", rol));
                    cmd.Parameters.Add(new NpgsqlParameter("@estado_usuario", estUser));
                    cmd.Parameters.Add(new NpgsqlParameter("@estado_reserva", estRes));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                    HttpContext.Current.Response.Write("<script>alert('Te has registrado con éxito!');</script>");

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public DataTable mostrarAgenda(EAgenda user)
        {
            DataTable agenda = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("f_agenda", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_personas", NpgsqlDbType.Integer).Value = user.Personas;
                dataAdapter.SelectCommand.Parameters.Add("_hora", NpgsqlDbType.Varchar).Value = user.Hora;



                conection.Open();
                dataAdapter.Fill(agenda);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return agenda;
        }

        public void DAO_BT_Calificar(int cal, int id)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;

                    cmd.CommandText = "select * from public.f_calcular_calificacion(@id,@calificacion)";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.Add(new NpgsqlParameter("@id", id));
                    cmd.Parameters.Add(new NpgsqlParameter("@calificacion", cal));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();


                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
               
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Terminar_Cal()
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_terminar_calificacion(@id)";
                    cmd.CommandType = CommandType.Text;

                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@id", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();
                }
            }

            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Contacto_Enviar(String nombre, String email, String tel, String msj)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_contacto(@nombre,@email,@telefono,@mensaje)";
                    cmd.CommandType = CommandType.Text;
                    

                    cmd.Parameters.Add(new NpgsqlParameter("@nombre", nombre));
                    cmd.Parameters.Add(new NpgsqlParameter("@email", email));
                    cmd.Parameters.Add(new NpgsqlParameter("@telefono", tel));
                    cmd.Parameters.Add(new NpgsqlParameter("@mensaje", msj));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                    HttpContext.Current.Response.Write("<script>alert('Su mensaje ha sido enviado con éxito!');</script>");

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Eliminar_Reserva()
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;

                    cmd.CommandText = "select * from public.f_eliminar_reserva(@reserva_id)";
                    cmd.CommandType = CommandType.Text;

                    int id = Convert.ToInt32(HttpContext.Current.Session["reservaId"]);

                    cmd.Parameters.Add(new NpgsqlParameter("@reserva_id", id));


                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                    HttpContext.Current.Session["reserva"] = "1";
                    HttpContext.Current.Response.Redirect("opciones.aspx#abajo");

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Eliminar_Plato_Reserva(int id)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
        {
            using (NpgsqlConnection connection = new NpgsqlConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                connection.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                cmd.Connection = connection;

                cmd.CommandText = "select * from public.f_eliminar_plato_venta(@id,@reserva)";
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add(new NpgsqlParameter("@id", id));

                int id2 = Convert.ToInt32(HttpContext.Current.Session["reservaId"]);

                cmd.Parameters.Add(new NpgsqlParameter("@reserva", id2));


                cmd.ExecuteNonQuery();
                cmd.Dispose();
                connection.Close();

                HttpContext.Current.Response.Redirect("opciones.aspx#abajo");

            }
        }
        catch (Exception Ex)
        {
            throw Ex;
        }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }

        }

        public void DAO_BT_Agregar_Plato(int idplato, int cant, int prec)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_insertar_plato_reserva(@id_plato,@id_reserva,@precio_unit,@precio_tot,@cantidad,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    int idres = Convert.ToInt32(HttpContext.Current.Session["reservaId"]);

                    int total = cant * prec;

                    cmd.Parameters.Add(new NpgsqlParameter("@id_plato", idplato));
                    cmd.Parameters.Add(new NpgsqlParameter("@id_reserva", idres));
                    cmd.Parameters.Add(new NpgsqlParameter("@precio_unit", prec));
                    cmd.Parameters.Add(new NpgsqlParameter("@precio_tot", total));
                    cmd.Parameters.Add(new NpgsqlParameter("@cantidad", cant));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));


                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                    HttpContext.Current.Response.Write("<script language=javascript>window.alert('Se agregó el plato con éxito.');window.location='opciones.aspx#abajo';</script>");
                }
            }

            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }

        }

        public void DAO_BT_Editar_Info(String tbNombre, String tbMision, String tbVision, String tbQuienes,
            String tbEslogan, String tbTitulo1, String tbTitulo2, String tbTitulo3, String tbTexto1, String tbTexto2, String tbTexto3,
            String tbInfo, String tbCiudad, String tbDire, String tbMapa, String tbEmail)
        {

            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;

                    cmd.CommandText = "select * from public.f_modificar_info(@nombre_restaurante,@mision,@vision,@quienes,@eslogan,@titulo1,@texto1,@titulo2,@texto2,@titulo3,@texto3,@info_ubicacion,@ciudad,@direccion,@mapa,@email,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.Add(new NpgsqlParameter("@nombre_restaurante", tbNombre));
                    cmd.Parameters.Add(new NpgsqlParameter("@mision", tbMision));
                    cmd.Parameters.Add(new NpgsqlParameter("@vision", tbVision));
                    cmd.Parameters.Add(new NpgsqlParameter("@quienes", tbQuienes));
                    cmd.Parameters.Add(new NpgsqlParameter("@eslogan", tbEslogan));
                    cmd.Parameters.Add(new NpgsqlParameter("@titulo1", tbTitulo1));
                    cmd.Parameters.Add(new NpgsqlParameter("@titulo2", tbTitulo2));
                    cmd.Parameters.Add(new NpgsqlParameter("@titulo3", tbTitulo3));
                    cmd.Parameters.Add(new NpgsqlParameter("@texto1", tbTexto1));
                    cmd.Parameters.Add(new NpgsqlParameter("@texto2", tbTexto2));
                    cmd.Parameters.Add(new NpgsqlParameter("@texto3", tbTexto3));
                    cmd.Parameters.Add(new NpgsqlParameter("@info_ubicacion", tbInfo));
                    cmd.Parameters.Add(new NpgsqlParameter("@ciudad", tbCiudad));
                    cmd.Parameters.Add(new NpgsqlParameter("@direccion", tbDire));
                    cmd.Parameters.Add(new NpgsqlParameter("@mapa", tbMapa));
                    cmd.Parameters.Add(new NpgsqlParameter("@email", tbEmail));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }   

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }

        }

        public void DAO_BT_Editar_tipo_Info(String tbNombre, int tbPrecio)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;

                    cmd.CommandText = "select * from public.f_modificar_tipo(@nombre,@precio,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.Add(new NpgsqlParameter("@nombre", tbNombre));
                    cmd.Parameters.Add(new NpgsqlParameter("@precio", tbPrecio));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }   

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Editar_Ingre(int tbId, double tbCant, double tbMin, String tbNombre,
            String tbDesc, String tbUni)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;

                    cmd.CommandText = "select * from public.f_modificar_ingredientes(@id,@nombre,@cantidad,@descripcion,@minimo,@unidad,@modified_by)";
                    cmd.CommandType = CommandType.Text;


                    cmd.Parameters.Add(new NpgsqlParameter("@id", tbId));
                    cmd.Parameters.Add(new NpgsqlParameter("@nombre", tbNombre));
                    cmd.Parameters.Add(new NpgsqlParameter("@cantidad", tbCant));
                    cmd.Parameters.Add(new NpgsqlParameter("@descripcion", tbDesc));
                    cmd.Parameters.Add(new NpgsqlParameter("@minimo", tbMin));
                    cmd.Parameters.Add(new NpgsqlParameter("@unidad", tbUni));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));


                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Insertar_Ingre(double tbCant, double tbMin, String tbNombre,
            String tbDesc, String tbUni)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_insertar_ingredientes(@nombre,@cantidad,@descripcion,@minimo,@unidad,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.Add(new NpgsqlParameter("@nombre", tbNombre));
                    cmd.Parameters.Add(new NpgsqlParameter("@cantidad", tbCant));
                    cmd.Parameters.Add(new NpgsqlParameter("@descripcion", tbDesc));
                    cmd.Parameters.Add(new NpgsqlParameter("@minimo", tbMin));
                    cmd.Parameters.Add(new NpgsqlParameter("@unidad", tbUni));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Borrar_Ingre(int lbId)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_eliminar_ingredientes(@id,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.Add(new NpgsqlParameter("@id", lbId));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();
                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Editar_Menu(FileUpload fu, String tbImagen, int tbId, int tbPrecio, String tbNombre,
            String tbDesc, ClientScriptManager cm, HttpServerUtility Server)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;

                    cmd.CommandText = "select * from public.f_modificar_platos(@id,@nombre,@precio,@descripcion,@url_imagen,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    

                    if (fu.HasFile == true)
                    {
                        String nombreArchivo = System.IO.Path.GetFileName(fu.PostedFile.FileName);
                        string extension = System.IO.Path.GetExtension(fu.PostedFile.FileName);
                        string saveLocation = (Server.MapPath("~\\Presentacion\\images\\platos") + "\\" + nombreArchivo);

                        if ((extension.Equals(".jpg") || extension.Equals(".jpeg") || extension.Equals(".png")))
                        {
                            string fileName = Path.GetFileName(fu.PostedFile.FileName);
                            fu.PostedFile.SaveAs(Server.MapPath("~\\Presentacion\\images\\platos\\") + fileName);
                            cmd.Parameters.Add(new NpgsqlParameter("@url_imagen", fileName));
                        }
                        else
                        {
                            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Tipo de archivo no válido');</script>");
                            return;
                        }


                    }
                    else
                    {
                        
                        cmd.Parameters.Add(new NpgsqlParameter("@url_imagen", tbImagen));
                    }


                    

                    cmd.Parameters.Add(new NpgsqlParameter("@id", tbId));
                    cmd.Parameters.Add(new NpgsqlParameter("@nombre", tbNombre));
                    cmd.Parameters.Add(new NpgsqlParameter("@precio", tbPrecio));
                    cmd.Parameters.Add(new NpgsqlParameter("@descripcion", tbDesc));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Insertar_Menu(GridView GV_Platos, FileUpload fu, int tbPrecio, String tbNombre,
            String tbDescripcion, ClientScriptManager cm, HttpServerUtility Server)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_insertar_platos(@nombre,@precio,@descripcion,@calificacion,@url_imagen,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    

                    if (fu.HasFile == true)
                    {

                        
                        String nombreArchivo = System.IO.Path.GetFileName(fu.PostedFile.FileName);
                        string extension = System.IO.Path.GetExtension(fu.PostedFile.FileName);
                        string saveLocation = (Server.MapPath("~\\Presentacion\\images\\platos") + "\\" + nombreArchivo);

                        if ((extension.Equals(".jpg") || extension.Equals(".jpeg") || extension.Equals(".png")))
                        {
                            string fileName = Path.GetFileName(fu.PostedFile.FileName);
                            fu.PostedFile.SaveAs(Server.MapPath("~\\Presentacion\\images\\platos\\") + fileName);
                            cmd.Parameters.Add(new NpgsqlParameter("@url_imagen", fileName));
                        }
                        else
                        {
                            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Tipo de archivo no válido');</script>");
                            return;
                        }


                    }
                    else
                    {
                        cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('No se ha cargado la imagen');</script>");
                        return;
                    }


                    int calif = 0;

                    cmd.Parameters.Add(new NpgsqlParameter("@nombre", tbNombre));
                    cmd.Parameters.Add(new NpgsqlParameter("@precio", tbPrecio));
                    cmd.Parameters.Add(new NpgsqlParameter("@descripcion", tbDescripcion));
                    cmd.Parameters.Add(new NpgsqlParameter("@calificacion", calif));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                    GV_Platos.DataBind();

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Borrar_Menu(GridView GV_Platos, int lbId)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_eliminar_platos(@id,@modified_by)";
                    cmd.CommandType = CommandType.Text;


                    cmd.Parameters.Add(new NpgsqlParameter("@id", lbId));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                    GV_Platos.DataBind();
                    HttpContext.Current.Response.Redirect("menu.aspx");
                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Editar_Mesas(int tbId, int tbSillas)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;

                    cmd.CommandText = "select * from public.f_modificar_mesas(@id,@sillas,@modified_by)";
                    cmd.CommandType = CommandType.Text;


                    cmd.Parameters.Add(new NpgsqlParameter("@id", tbId));
                    cmd.Parameters.Add(new NpgsqlParameter("@sillas", tbSillas));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));


                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Insertar_Mesas(int tbSillas)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_insertar_mesas(@sillas,@estado_mesa,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    int tbEstado = 1;

                    cmd.Parameters.Add(new NpgsqlParameter("@sillas", tbSillas));
                    cmd.Parameters.Add(new NpgsqlParameter("@estado_mesa", tbEstado));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();


                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Borrar_Mesas(int lbId)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_eliminar_mesas(@id,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.Add(new NpgsqlParameter("@id", lbId));
                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();
                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void PageLoadPanelPlato(DropDownList FDDL2_Ingrediente)
        {
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

        using (NpgsqlConnection connection = new NpgsqlConnection())
            {
                connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                connection.Open();
                NpgsqlCommand cmd = new NpgsqlCommand();
                cmd.Connection = connection;
                NpgsqlCommand command = new NpgsqlCommand("SELECT nombre FROM ingrediente ORDER BY nombre", connection);
                NpgsqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    FDDL2_Ingrediente.Items.Add((string)dr["nombre"]);
                }
            }

        }

        public void DAO_BT_Insertar_Ingre_Plato(double tbCant, String tbIngre)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_insertar_ingre_pla(@plato_id,@ingrediente_id,@cantidad,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    
                    int tbId = Convert.ToInt32(HttpContext.Current.Session["platoIngre"]);

                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);

                    cmd.Parameters.Add(new NpgsqlParameter("@plato_id", tbId));
                    cmd.Parameters.Add(new NpgsqlParameter("@ingrediente_id", tbIngre));
                    cmd.Parameters.Add(new NpgsqlParameter("@cantidad", tbCant));
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                    HttpContext.Current.Response.Redirect("plato.aspx");

                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Borrar_Ingre_Plato(int lbId)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_eliminar_ingre_pla(@id,@modified_by)";
                    cmd.CommandType = CommandType.Text;

                    int userId = Convert.ToInt32(HttpContext.Current.Session["userId"]);

                    cmd.Parameters.Add(new NpgsqlParameter("@id", lbId));
                    cmd.Parameters.Add(new NpgsqlParameter("@modified_by", userId));

                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                    HttpContext.Current.Response.Redirect("plato.aspx");
                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Desbloquear_Usuario(String nombre)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_usuario_desbloquear(@id)";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.Add(new NpgsqlParameter("@id", nombre));


                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();
                }
            }

            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_Si_Asistio(String nombre)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_usuario_si_asistio(@nombre)";
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.Add(new NpgsqlParameter("@nombre", nombre));


                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                }
            }

            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }

        public void DAO_BT_No_Asistio(String nombre)
        {
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ConnectionString);

            try
            {

                using (NpgsqlConnection connection = new NpgsqlConnection())
                {
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings["MyPrimeraConexion"].ToString();
                    connection.Open();
                    NpgsqlCommand cmd = new NpgsqlCommand();
                    cmd.Connection = connection;
                    cmd.CommandText = "select * from public.f_usuario_no_asistio(@nombre)";
                    cmd.CommandType = CommandType.Text;

                    
                    cmd.Parameters.Add(new NpgsqlParameter("@nombre", nombre));


                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();

                }
            }

            catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }


    }
}
