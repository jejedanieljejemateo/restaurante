using AjaxControlToolkit;
using Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilitarios;


namespace Logica
{
    public class CorePublico
    {
        public void Core_BT_Editar_Menu(FileUpload fu, String tbImagen, int tbId, int tbPrecio, String tbNombre,
            String tbDesc, ClientScriptManager cm, HttpServerUtility Server)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Editar_Menu(fu, tbImagen, tbId, tbPrecio, tbNombre, tbDesc, cm, Server);

        }

        public void Core_BT_Insertar_Menu(GridView GV_Platos, FileUpload fu, int tbPrecio, String tbNombre,
            String tbDescripcion, ClientScriptManager cm, HttpServerUtility Server)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Insertar_Menu(GV_Platos, fu, tbPrecio, tbNombre, tbDescripcion, cm, Server);

        }

        public void Core_BT_Borrar_Menu(GridView GV_Platos, int lbId)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Borrar_Menu(GV_Platos, lbId);

        }

        public void Core_BT_Editar_Mesas(int tbId, int tbSillas)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Editar_Mesas(tbId, tbSillas);

        }

        public void Core_BT_Insertar_Mesas(int tbSillas)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Insertar_Mesas(tbSillas);

        }

        public void Core_BT_Borrar_Mesas(int lbId)
        {
            DAOUsuario dao = new DAOUsuario();
            dao.DAO_BT_Borrar_Mesas(lbId);

        }
    }
}
