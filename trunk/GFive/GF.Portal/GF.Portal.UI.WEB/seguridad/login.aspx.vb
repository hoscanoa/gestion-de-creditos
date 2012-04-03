Imports GF.Layer.BL.BC
Imports GF.Layer.BL.BE

Partial Public Class login
    Inherits System.Web.UI.Page

    Dim Evolta As EGFive = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.CacheControl = "no-cache"
        Response.AddHeader("Pragma", "no-cache")
        Response.Expires = -1
        '***********************************************************'
        If Not IsPostBack Then
            txtfecha.Text = System.DateTime.Now.ToShortDateString
        End If
    End Sub

    Protected Sub btnEntrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEntrar.Click
        If txtUsuario.Text.Length > 0 OrElse txtContraseña.Text.Length > 0 Then
            Dim pUsuario As Eusuario = Nothing
            pUsuario = New Eusuario
            With pUsuario
                .usuario = txtUsuario.Text.Trim
                .contraseña = txtContraseña.Text.Trim
            End With
            If pUsuario IsNot Nothing Then
                If Rusuario.comprobarUsuario(pUsuario) Then
                    Session("pUsuario") = pUsuario
                    Response.Redirect("~/seguridad/bienvenida.aspx")
                Else
                    lblMsgError.Text = pUsuario.mensaje
                    upMensaje.Update()
                End If
            End If
        End If
    End Sub

End Class