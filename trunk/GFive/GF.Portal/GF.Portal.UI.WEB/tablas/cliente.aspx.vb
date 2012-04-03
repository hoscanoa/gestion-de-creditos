Imports GF.Layer.BL.BC
Imports GF.Layer.BL.BE

Partial Public Class cliente
    Inherits System.Web.UI.Page

    Private clientes As List(Of Ecliente) = Nothing

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.CacheControl = "no-cache"
        Response.AddHeader("Pragma", "no-cache")
        Response.Expires = -1
        '***********************************************************'
        If Not IsPostBack Then
            cargarDatos()
            Session("Modo") = 0
        End If
    End Sub

    Private Sub cargarDatos()
        Dim usuario As New Eusuario
        usuario = Session("pUsuario")
        clientes = Rcliente.SeleccionarTodo(False)
        Session("lista") = clientes
        If clientes IsNot Nothing Then
            gvwLista.DataSource = clientes
            gvwLista.DataBind()
        End If
    End Sub

    Protected Sub imgEliminar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgEliminar.Click
        Dim cliente As New Ecliente
        For Each lst As GridViewRow In gvwLista.Rows
            If CType(lst.Cells(3).FindControl("chkEliminar"), CheckBox).Checked Then
                cliente.cli_ruc = CType(lst.Cells(0).FindControl("lnkCodigo"), LinkButton).CommandArgument
                cliente.idUsuario = Me.Master.idUsuario
                Rcliente.Eliminar(cliente)
            End If
        Next
        cargarDatos()
    End Sub

    Protected Sub imgExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles imgExportar.Click
        clientes = Session("lista")
        If Not clientes Is Nothing Then
            Dim fileName As String = "Consulta{0}.xls"
            fileName = String.Format(fileName, DateTime.Now.ToShortDateString())
            Dim Response As HttpResponse = HttpContext.Current.Response
            Response.ContentType = "application/vnd.ms-excel"
            Response.Charset = "UTF-8"
            Response.ContentEncoding = System.Text.Encoding.Default
            Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName)
            Response.Write("Cli_Ruc")
            Response.Write(vbTab)
            Response.Write("Cli_RazonSocial")
            Response.Write(vbTab)
            Response.Write("Cli_Direccion")
            Response.Write(vbTab)
            Response.Write("Estado")
            Response.Write(vbTab)
            Response.Write(vbCrLf)
            Dim value As String
            For Each accion In clientes
                value = accion.cli_ruc
                Response.Write(value)
                Response.Write(vbTab)
                value = accion.cli_razonSocial
                Response.Write(value)
                Response.Write(vbTab)
                value = accion.cli_direccion
                Response.Write(value)
                Response.Write(vbTab)
                value = accion.desEstado
                Response.Write(value)
                Response.Write(vbCrLf)
            Next
            Response.End()
        Else
            Dim jsMensaje As String = Nothing
            jsMensaje = "<script>javascript:alert(' La consulta no pudo ser procesada. Por favor inténtelo de nuevo.');</script>)"
            Controls.Add(New LiteralControl(jsMensaje))
        End If
    End Sub

    Protected Sub btnGuardar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGuardar.Click
        If Session("Modo") = 0 Then
            Me.Agregar()
        ElseIf Session("Modo") = 1 Then
            Me.Editar()
        End If
    End Sub

    Private Sub Agregar()
        Dim cliente As New Ecliente
        Dim usuario As New Eusuario
        Dim resultado() As Integer
        Dim jsmensaje As String = String.Empty

        usuario = Session("pUsuario")

        cliente.cli_ruc = CType(Me.txtRuc.Value.ToUpper, String)
        cliente.cli_razonSocial = CType(Me.txtRazonSocial.Value.ToUpper, String)
        cliente.cli_direccion = CType(Me.txtDireccion.Value.ToUpper, String)
        cliente.estado = 1
        cliente.idUsuario = usuario.idUsuario
        resultado = Rcliente.Añadir(cliente)

        '(0) filas afectadas
        '(1) Tipo de resultado
        If resultado(0) > 0 Then
            If resultado(1) = 1 Then
                jsmensaje = "<script>javascript:alert('El registro se grabo satisfactoriamente.');</script>)"
                Me.limpiarDatos()
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

    Protected Sub gvwLista_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvwLista.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes.Add("OnMouseOver", "Resaltar_On(this);")
            e.Row.Attributes.Add("OnMouseOut", "Resaltar_Off(this);")
        End If
    End Sub

    Protected Sub gvwLista_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvwLista.RowEditing
        Dim id As Integer = e.NewEditIndex
        Dim cliente As New Ecliente
        Dim clienteF As New List(Of Ecliente)
        Dim intCliente As String = String.Empty
        With gvwLista
            intCliente = CType(gvwLista.Rows(id).Cells(0).FindControl("lnkCodigo"), LinkButton).CommandArgument
        End With

        clienteF = Session("lista")
        If Not clienteF Is Nothing Then
            For Each cliente In clienteF
                If cliente.cli_ruc = intCliente Then
                    Session("Modo") = 1
                    Session("cli_ruc") = cliente.cli_ruc
                    Me.txtRuc.Value = cliente.cli_ruc
                    Me.txtRazonSocial.Value = cliente.cli_razonSocial
                    Me.txtDireccion.Value = cliente.cli_direccion
                End If
            Next
        End If
    End Sub

    Private Sub Editar()
        Dim cliente As New Ecliente
        Dim usuario As New Eusuario
        Dim resultado() As Integer
        Dim jsmensaje As String = String.Empty

        usuario = Session("pUsuario")
        cliente.cli_ruc = Session("cli_Ruc")

        cliente.cli_razonSocial = CType(Me.txtRazonSocial.Value.ToUpper, String)
        cliente.cli_direccion = CType(Me.txtDireccion.Value.ToUpper, String)
        cliente.estado = 1
        cliente.idUsuario = usuario.idUsuario
        
        resultado = Rcliente.Editar(cliente)

        '(0) filas afectadas
        '(1) Tipo de resultado
        If resultado(0) > 0 Then
            If resultado(1) = 1 Then
                jsmensaje = "<script>javascript:alert('El registro se modifico satisfactoriamente.');</script>)"
            ElseIf resultado(1) = 2 Then
                jsmensaje = "<script>javascript:alert('El registro se modificó, pero NO el nombre.');</script>)"
            End If
            Me.limpiarDatos()
        Else
            'Si no existen filas afectadas
            If resultado(1) = 2 Then
                jsmensaje = "<script>javascript:alert('No se pudo modificar este registro.');</script>)"
            End If
        End If
        Controls.Add(New LiteralControl(jsmensaje))
    End Sub

    Protected Sub imgBuscar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBuscar.Click
        If txtBuscar.Value <> String.Empty Then
            Dim cliente As New Ecliente            
            cliente.cli_razonSocial = txtBuscar.Value
            clientes = Rcliente.Buscar(cliente)
            Session("lista") = clientes
            If clientes IsNot Nothing Then
                gvwLista.DataSource = clientes
                gvwLista.DataBind()
            End If
        End If
    End Sub

    Private Sub limpiarDatos()
        Session("Modo") = 0
        Me.txtRuc.Value = ""
        Me.txtRazonSocial.Value = ""
        Me.txtBuscar.Value = ""
        Me.txtDireccion.Value = ""
        cargarDatos()
        txtRuc.Focus()
    End Sub

    Protected Sub btnLimpiar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLimpiar.Click
        limpiarDatos()
    End Sub
End Class