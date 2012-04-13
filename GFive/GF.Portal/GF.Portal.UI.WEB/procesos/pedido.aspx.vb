Imports GF.Layer.BL.BC
Imports GF.Layer.BL.BE
Imports GF.Portal.UI.WEB.WSProducto
Imports GF.Portal.UI.WEB.WSCliente
Imports RESTServices

Partial Public Class pedido
    Inherits System.Web.UI.Page

    Private pedidoE As List(Of Epedido) = Nothing
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.CacheControl = "no-cache"
        Response.AddHeader("Pragma", "no-cache")
        Response.Expires = -1
        '***********************************************************'
        If Not IsPostBack Then
            'cargarDatos()
            Session("lista") = pedidoE
            Session("Modo") = 0
        End If
    End Sub

    Private Sub cargarDatos()
        Dim usuario As New Eusuario
        Dim servicio As New WSProducto.WSProductoStock
        Dim producto As String = String.Empty
        usuario = Session("pUsuario")

        producto = servicio.ProductoStock(producto)
        Session("lista") = producto
        If producto IsNot Nothing Then
            gvwLista.DataSource = producto
            gvwLista.DataBind()
        End If
    End Sub

    Protected Sub btnAceptar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnAceptar.Click
        Dim servicio As New WSCliente.WSClienteObtener
        Dim cliente As String = String.Empty
        Dim jsmensaje As String = String.Empty

        cliente = txtRuc.Value.ToUpper

        cliente = servicio.ClienteObtener(cliente)

        lblCliente.Text = cliente

    End Sub

    Protected Sub btnAgregar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnAgregar.Click
        Dim usuario As New Eusuario
        Dim servicio As New WSProducto.WSProductoStock
        Dim producto As String = String.Empty
        Dim stock As Integer = 0
        Dim descripcion As String = String.Empty
        usuario = Session("pUsuario")
        Dim jsmensaje As String = String.Empty
        Dim pedidoF As New List(Of Epedido)


        pedidoF = Session("lista")
        If pedidoF Is Nothing Then
            pedidoF = New List(Of Epedido)
        End If

        producto = txtProductoID.Value.ToUpper

        stock = servicio.ProductoStock(producto)
        descripcion = servicio.ProductoObtener(producto)
        lblDescripcion.Text = descripcion.ToUpper
        lblDescripcion.DataBind()

        If producto IsNot Nothing Then
            If stock <= CType(txtCantidad.Value, Integer) Then
                jsmensaje = "<script>javascript:alert('El producto no tiene stock suficiente o esta en cero.');</script>)"
            Else
                Dim pedido As New Epedido
                pedido.ped_id = txtPedidoId.Value.ToUpper
                pedido.ped_cli_ruc = txtRuc.Value.ToUpper
                pedido.ped_pro_id = txtProductoID.Value.ToUpper
                pedido.pro_descripcion = lblDescripcion.Text.ToUpper
                pedido.ped_cantidad = txtCantidad.Value
                pedido.ped_precio = txtPrecio.Value
                pedido.ped_subTotal = pedido.ped_cantidad * pedido.ped_precio
                pedido.situacion = "PENDIENTE"
                pedido.estado = 1
                pedido.idUsuario = usuario.idUsuario

                pedidoF.Add(pedido)
                Session("lista") = pedidoF
                If pedidoF IsNot Nothing Then
                    calculoTotal()
                    gvwLista.DataSource = pedidoF
                    gvwLista.DataBind()
                End If
            End If
        End If
        Controls.Add(New LiteralControl(jsmensaje))
    End Sub

    Protected Sub btnGrabar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnGrabar.Click
        Dim usuario As New Eusuario
        Dim producto As String = String.Empty
        usuario = Session("pUsuario")
        Dim jsmensaje As String = String.Empty
        Dim resultado() As Integer


        'Insertar Pedido Encabezado
        Dim pedido As Epedido = Nothing
        pedido = New Epedido
        pedido.ped_id = txtPedidoId.Value.ToUpper
        pedido.ped_cli_ruc = txtRuc.Value.ToUpper
        pedido.ped_fecha = Calendar1.SelectedDate.ToShortDateString
        pedido.ped_total = CType(lblTotal.Text, Decimal)
        pedido.situacion = "PENDIENTE"
        pedido.estado = 1
        pedido.idUsuario = usuario.idUsuario
        resultado = Rpedido.AñadirEncabezado(pedido)


        'Insertar Pedido Detalle
        Dim pedidoF As New List(Of Epedido)

        pedidoF = Session("lista")
        If pedidoF IsNot Nothing Then
            For Each ped As Epedido In pedidoF
                resultado = Rpedido.AñadirDetalle(ped)
            Next
        End If

        '(0) filas afectadas
        '(1) Tipo de resultado
        If resultado(0) > 0 Then
            If resultado(1) = 1 Then
                jsmensaje = "<script>javascript:alert('El registro se grabo satisfactoriamente.');</script>)"
                'Me.limpiarDatos()
            End If
        Else
            'Si no existen filas afectadas
            If resultado(1) = 2 Then
                jsmensaje = "<script>javascript:alert('El registro se encuentra duplicado, verifique.');</script>)"
            Else
                jsmensaje = "<script>javascript:alert('No se pudo grabar este registro.');</script>)"
            End If
        End If
        Controls.Add(New LiteralControl(jsmensaje))
    End Sub

    Private Sub CalculoTotal()
        Dim suma As Decimal = 0
        Dim pedidoF As New List(Of Epedido)
        pedidoF = Session("lista")

        If pedidoF IsNot Nothing Then
            For Each ped As Epedido In pedidoF
                suma = suma + ped.ped_subTotal
            Next
        End If
        lblTotal.Text = suma
        lblTotal.DataBind()
    End Sub

    Protected Sub btnLimpiar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnLimpiar.Click
        txtPedidoId.Value = ""
        txtRuc.Value = ""
        lblCliente.Text = ""
        Calendar1.SelectedDate = Today()
        txtProductoID.Value = ""
        lblDescripcion.Text = ""
        txtCantidad.Value = ""
        txtPrecio.Value = ""
        lblTotal.Text = ""
        gvwLista.DataSource = Nothing
        gvwLista.DataBind()
        Session("Modo") = 0
    End Sub

    Private Sub btnListar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnListar.Click
        Response.Redirect("~/procesos/ListaPedido.aspx")
    End Sub

    Private Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim objEnviar As New RESTServices.Pedido
        objEnviar.EnviarPedidos()
    End Sub
End Class