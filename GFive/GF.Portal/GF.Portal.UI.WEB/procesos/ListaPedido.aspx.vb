Imports GF.Layer.BL.BC
Imports GF.Layer.BL.BE
Imports RESTServices

Partial Public Class ListaPedido
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.CacheControl = "no-cache"
        Response.AddHeader("Pragma", "no-cache")
        Response.Expires = -1
        '***********************************************************'
        If Not IsPostBack Then
            cargarDatos()
            'Session("lista") = pedidoE
            'Session("Modo") = 0
        End If
    End Sub

    Public Sub cargarDatos()
        Dim pedidoF As New PedidoList
        Dim objPedidoBC As New RESTServices.Pedido
        pedidoF = objPedidoBC.ObtenerPedidos()
        gvwLista.DataSource = pedidoF
        gvwLista.DataBind()
    End Sub

End Class