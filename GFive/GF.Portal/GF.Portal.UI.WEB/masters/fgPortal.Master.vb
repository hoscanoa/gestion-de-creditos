Imports GF.Layer.BL.BC
Imports GF.Layer.BL.BE

Partial Public Class fgPortal
    Inherits System.Web.UI.MasterPage

    Public WriteOnly Property showMenu() As Boolean
        Set(ByVal value As Boolean)
            mnuPrincipal.Visible = value
        End Set
    End Property
    Public Property mostrarMenu() As Boolean
        Get
            If Session("mostrarMenu") Is Nothing Then
                Return False
            Else
                Return CType(Session("mostrarMenu"), Boolean)
            End If
        End Get
        Set(ByVal value As Boolean)
            Session("mostrarMenu") = value
        End Set
    End Property
    Public Property idUsuario() As Int32
        Get
            If Session("idUsuario") Is Nothing Then
                Return 0
            Else
                Return CType(Session("idUsuario"), Int32)
            End If
        End Get
        Set(ByVal value As Int32)
            Session("idUsuario") = value
        End Set
    End Property
    Public Property descUsuario() As String
        Get
            Return lnkUsuario.Text
        End Get
        Set(ByVal value As String)
            lnkUsuario.Text = value.ToUpper
        End Set
    End Property
    Public Property idPerfilUsuario() As Int32
        Get
            If Session("idPerfilUsuario") Is Nothing Then
                Return 0
            Else
                Return CType(Session("idPerfilUsuario"), Int32)
            End If
        End Get
        Set(ByVal value As Int32)
            Session("idPerfilUsuario") = value
        End Set
    End Property
    
    Public Property sFG() As EGFive
        Get
            Return Session("sFG")
        End Get
        Set(ByVal value As EGFive)
            Session("sFG") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        cargarSession()
        If Not IsPostBack Then
            If mostrarMenu Then mnuModulo(1)
            lblFechaValor.Text = System.DateTime.Now.ToShortDateString
        End If
    End Sub

    Public Sub cargarSession()
        Try
            Dim pUsuario As New Eusuario
            pUsuario = CType(Session("pUsuario"), Eusuario)
            If pUsuario IsNot Nothing Then
                idUsuario = pUsuario.idUsuario
                descUsuario = pUsuario.usuario.ToUpper
            Else
                Response.Redirect(ConfigurationManager.AppSettings("cerrar").ToString)
            End If
        Catch ex As Exception
            Response.Redirect(ConfigurationManager.AppSettings("cerrar").ToString)
        End Try
    End Sub
    Private Sub mnuModulo(ByVal vModulo As Int32)
        Dim modulos As List(Of Emodulos) = Rmodulos.SeleccionarTodo(False, vModulo)
        For Each mnu As Emodulos In modulos
            Dim objMn As New MenuItem
            objMn.Value = mnu.idModulo
            objMn.Text = ""
            mnuPrincipal.Items.Add(objMn)
            mnuSubModulo(objMn, vModulo)
        Next
    End Sub
    Private Sub mnuSubModulo(ByRef mnu As MenuItem, ByVal vModulo As Int32)
        Dim submodulos As List(Of EsubModulo) = Rsubmodulos.SeleccionarTodoXModulo(False, vModulo, CType(Me.idPerfilUsuario, Int32))
        Dim opciones As List(Of Eopciones) = Ropciones.SeleccionarTodoXModuloSubModulo(vModulo, CType(Me.idPerfilUsuario, Int32))
        For Each submnu As EsubModulo In submodulos
            Dim objMn As New MenuItem
            objMn.Value = submnu.idSubModulo
            objMn.Text = submnu.descSubModulo
            If submnu.direccionUrl.Trim.Length > 0 Then objMn.NavigateUrl = submnu.direccionUrl
            mnu.ChildItems.Add(objMn)
            If Not opciones Is Nothing Then
                mnuOpciones(objMn, opciones, submnu.idSubModulo)
            End If
        Next
    End Sub
    Private Sub mnuOpciones(ByRef mnu As MenuItem, ByVal lstOpc As List(Of Eopciones), ByVal idSubModulo As Int32)
        For Each opc As Eopciones In lstOpc
            If opc.idSubModulo.Equals(idSubModulo) Then
                Dim objMn As New MenuItem
                objMn.Value = opc.idOpcion
                objMn.Text = opc.descOpcion
                objMn.NavigateUrl = ObtenerRuta(opc.direccionUrl)
                mnu.ChildItems.Add(objMn)
            End If
        Next
    End Sub
    Private Function ObtenerRuta(ByVal pagina As String) As String
        Dim ruta As String = Nothing
        ruta = pagina
        Return ruta
    End Function
    Protected Sub lnkUsuario_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkUsuario.Click
        Dim ruta As String = ConfigurationManager.AppSettings("cerrar").ToString
        Response.Redirect(ruta)
    End Sub

End Class