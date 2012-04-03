Imports GF.Layer.BL.BE
Imports GF.Layer.BL.BC

Partial Public Class bienvenida
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                If Session("pUsuario") IsNot Nothing Then
                    Dim pUsuario As Eusuario = CType(Session("pUsuario"), Eusuario)
                    Me.Master.mostrarMenu = True
                    Me.Master.idUsuario = pUsuario.idUsuario
                    Me.Master.descUsuario = pUsuario.usuario.Trim.ToUpper
                    Me.Master.idPerfilUsuario = pUsuario.idPerfilUsuario
                End If
            Catch ex As Exception
                Response.Redirect(ConfigurationManager.AppSettings("cerrar").ToString)
            End Try
        End If
    End Sub

End Class