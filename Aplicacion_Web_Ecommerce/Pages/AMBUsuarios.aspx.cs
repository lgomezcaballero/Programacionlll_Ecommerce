﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Aplicacion_Web_Ecommerce.Pages
{

    public partial class AMBUsuarios : System.Web.UI.Page
    {
    public long id;
    public string tipo;
        protected void Page_Load(object sender, EventArgs e)
        {



            if (Session["TeLogueaste"] == null)
            {
                Session.Add("error", "Debe loguearse para acceder a esta pagina");
                Response.Redirect("ErrorLogin.aspx", false);
            }

            else
            {

                if (Session["Admin"] == null)
                {
                    Session.Add("error", "solo los administradores pueden acceder a esta pagina");
                    Response.Redirect("ErrorAcceso.aspx", false);
                }

                else
                {

                    //Estam parte es para cargar las dropdowns
                    //Pais dropdownlist
                    List<Pais> listapaises = new List<Pais>();
                    PaisNegocio paisNegocio = new PaisNegocio();
                    Usuario usuario = new Usuario();

                    //TP lean

                    if (!IsPostBack)
                    {
                        List<Provincia> listaprovincia = new List<Provincia>();
                    ProvinciaNegocio provinciaNegocio = new ProvinciaNegocio();
                    listaprovincia = provinciaNegocio.listar();
                    Session.Add("listaprovincia", listaprovincia);

                    //Esto es para el dropdownlist de localidad
                    List<Localidad> listalocalidad = new List<Localidad>();
                    LocalidadNegocio localidadNegocio = new LocalidadNegocio();
                    listalocalidad = localidadNegocio.listar();
                    Session.Add("listalocalidad", listalocalidad);


                    listapaises = paisNegocio.listar();
                    DropDownListPaises.DataSource = listapaises;
                    DropDownListPaises.DataTextField = "NombrePais";
                    DropDownListPaises.DataValueField = "ID";
                    DropDownListPaises.DataBind();

                    //Esto precarga las provincias solo por primera vez
                    int ID = int.Parse(DropDownListPaises.SelectedItem.Value);
                    DropDownListProvincia.DataSource = ((List<Provincia>)Session["listaprovincia"]).FindAll(x => x.Pais.ID == ID);
                    DropDownListProvincia.DataValueField = "ID";
                    DropDownListProvincia.DataTextField = "NombreProvincia";
                    DropDownListProvincia.DataBind();

                    //Esto precarga las localidades solo por primera vez
                    int idLocalidad = int.Parse(DropDownListProvincia.SelectedItem.Value);

                    DropDownListLocalidad.DataSource = ((List<Localidad>)Session["listalocalidad"]).FindAll(x => x.Provincia.ID == ID);
                    DropDownListLocalidad.DataValueField = "ID";
                    DropDownListLocalidad.DataTextField = "NombreLocalidad";
                    DropDownListLocalidad.DataBind();


                        if (Request.QueryString["ID"] != null && Request.QueryString["Type"] != null)
                        {
                            tipo = Request.QueryString["Type"];
                            id = long.Parse(Request.QueryString["ID"]);
                        }
                        if (Request.QueryString["Type"] == "a")
                            tipo = Request.QueryString["Type"];
                        if (tipo == "e")
                        {
                            /*
                            //Con esta funciom obtine el articulo que se busca
                            provincia = obtenerProvincia(id);
                            //Esto lo que hace es precargar los datos con el articulo que se quiere modificar
                             setearCamposModificarPais(pais);*/
                        }

                        if (Request.QueryString["Type"] == "d")
                        {
                            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                            usuarioNegocio.eliminarUsuario(id);
                            Response.Redirect("ListarUsuarios.aspx", false);
                        }
                    }
                }
            }
        }


        protected void DropDownListPaises_SelectedIndexChanged(object sender, EventArgs e)
        {

            int id = int.Parse(DropDownListPaises.SelectedItem.Value);

            //Esta es la dropdown de provincia

            DropDownListProvincia.DataSource = ((List<Provincia>)Session["listaprovincia"]).FindAll(x => x.Pais.ID == id);
            //if(DropDownListProvincia.DataSource[)
            //{

            //}
            DropDownListProvincia.DataValueField = "ID";
            DropDownListProvincia.DataTextField = "NombreProvincia";
            DropDownListProvincia.DataBind();
            string nombre = DropDownListProvincia.SelectedItem.Value;


        }


        protected void DropDownListProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {

            int id = int.Parse(DropDownListProvincia.SelectedItem.Value);

            DropDownListLocalidad.DataSource = ((List<Localidad>)Session["listalocalidad"]).FindAll(x => x.Provincia.ID == id);
            DropDownListLocalidad.DataValueField = "ID";
            DropDownListLocalidad.DataTextField = "NombreLocalidad";
            DropDownListLocalidad.DataBind();
            //string nombre = DropDownListLocalidad.SelectedItem.Value;
        }

        protected void BtnAgregarUsuario_Click(object sender, EventArgs e)
        {


            if (CompletarCampos() == false)
            {
                LabelErrorCampos.Text = "Complete todos los campos";
            }

            else
            {
                if (ValidarDni() == true)
                {
                    LabelErrorCampos.Text = "El dni que ingreso ya existe";
                }


                else
                {
                    //Esto valida que usuario el usuario que se ingresar no este repetido en la base
                    if (validarUsuario(TextBoxNombreUsuario.Text) == true)
                    {
                        LabelErrorCampos.Text = "Ese nombre de usuario ya esta en uso, intente con otro nombre";
                    }

                    else
                    {
                        //Valido que la contraseña se escriba bien las dos veces
                        if (validarContraseña(TextBoxContraseña.Text, TextBoxRepetirContraseña.Text) == true)
                        {

                            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                            Usuario usuario = new Usuario();


                            ContactoNegocio contactoNegocio = new ContactoNegocio();


                            //Datos Usuario
                            usuario.Apellidos = txtApellidos.Text;
                            usuario.Nombres = TxtNombres.Text;
                            usuario.DNI = TextBoxDni.Text;
                            usuario.NombreUsuario = TextBoxNombreUsuario.Text;
                            usuario.Contraseña = TextBoxContraseña.Text;


                            //Tipo Usuario
                            //Esto se carga de manera automatica
                            usuario.TipoUsuario = new TipoUsuario();
                            usuario.TipoUsuario.ID = 2; // 2 = Normal 1 = Admin


                            //Datos Contacto falta que de alguna forma guarde esto
                            usuario.Contacto = new Contacto();
                            //usuario.Contacto.ID = como hago para obtener el id del usuario?

                            usuario.Contacto.Email = TextBoxEmail.Text;
                            usuario.Contacto.Telefono = TextBoxTelefono.Text;

                            //contactoNegocio.agregarContacto(usuario.Contacto);

                            //Localidad
                            usuario.Localidad = new Localidad();
                            usuario.Localidad.ID = int.Parse(DropDownListLocalidad.SelectedItem.Value);


                            //Localidad > Provincia
                            //usuario.Localidad.Provincia = new Provincia();
                            //usuario.Localidad.Provincia.ID = int.Parse(DropDownListProvincia.SelectedItem.Value);
                            //Localidad > Provincia > Pais
                            // usuario.Localidad.Provincia.Pais = new Pais();
                            //usuario.Localidad.Provincia.Pais.ID = byte.Parse(DropDownListProvincia.SelectedItem.Value);


                            //Agrego el usuario a la base
                            usuarioNegocio.agregarUsuario(usuario);

                        }

                        else
                        {
                            LabelErrorCampos.Text = "Las contraseñas ingresadas no coinciden";
                        }


                    }



                }

            }




        }


        protected bool CompletarCampos()
        {
            if (txtApellidos.Text == "" ||
                TxtNombres.Text == "" ||
                TextBoxDni.Text == "" ||
                TextBoxNombreUsuario.Text == "" ||
                TextBoxContraseña.Text == "" ||
                TextBoxRepetirContraseña.Text == "" ||
                TextBoxEmail.Text == "" ||
                TextBoxTelefono.Text == "")
            {
                return false;
            }

            else
            {
                return true;
            }
        }

        //Este metodo valida que la contraseña este escrita bien las dos veces
        protected bool validarContraseña(string Contraseña, string ConstraseñaRepetida)
        {
            if (Contraseña == ConstraseñaRepetida)
            { return true; }

            return false;
        }

        //esto lo dejo para despues 
        //protected bool MailExiste(string Email)
        //{
        //   List<Usuario> usuarioList = new List<Usuario>();     
        //   UsuarioNegocio usuarioNegocio = new UsuarioNegocio();



        //}

        protected bool validarUsuario(string NombreDeUsuario)
        {
            List<Usuario> usuarios = new List<Usuario>();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            usuarios = usuarioNegocio.listar();
            foreach (Usuario usuario in usuarios)
            {
                if (usuario.NombreUsuario == NombreDeUsuario)
                {
                    return true;
                }
            }

            return false;
        }


        protected bool ValidarDni()
        {
            List<Usuario> usuarios = new List<Usuario>();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            usuarios = usuarioNegocio.listar();

            foreach (Usuario usuario in usuarios)
            {
                if (TextBoxDni.Text == usuario.DNI)
                {
                    return true;
                }
            }

            return false;
        }

        /*
        protected bool ValidaEmail()
        {
            List<Usuario> usuarios = new List<Usuario>();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            usuarios = usuarioNegocio.listar();

            foreach (Usuario usuario in usuarios)
            {
                if (TxtEmail.Text == usuario.)
                {
                    return true;
                }
            }

            return false;
        }*/
    }
}