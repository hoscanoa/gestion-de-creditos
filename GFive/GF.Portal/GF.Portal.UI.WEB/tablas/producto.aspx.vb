Imports GF.Layer.BL.BC
Imports GF.Layer.BL.BE

Partial Public Class producto
    Inherits System.Web.UI.Page

    Private productos As List(Of Eproducto) = Nothing

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
        productos = Rproducto.SeleccionarTodo(False)
        Session("lista") = productos
        If productos IsNot Nothing Then
            gvwLista.DataSource = productos
            gvwLista.DataBind()
        End If
    End Sub

    Protected Sub imgEliminar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgEliminar.Click
        Dim producto As New Eproducto
        For Each lst As GridViewRow In gvwLista.Rows
            If CType(lst.Cells(3).FindControl("chkEliminar"), CheckBox).Checked Then
                producto.pro_id = CType(lst.Cells(0).FindControl("lnkCodigo"), LinkButton).CommandArgument
                producto.pro_id = Me.Master.idUsuario
                Rproducto.Eliminar(producto)
            End If
        Next
        cargarDatos()
    End Sub

    Protected Sub imgExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles imgExportar.Click
        productos = Session("lista")
        If Not productos Is Nothing Then
            Dim fileName As String = "Consulta{0}.xls"
            fileName = String.Format(fileName, DateTime.Now.ToShortDateString())
            Dim Response As HttpResponse = HttpContext.Current.Response
            Response.ContentType = "application/vnd.ms-excel"
            Response.Charset = "UTF-8"
            Response.ContentEncoding = System.Text.Encoding.Default
            Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName)
            Response.Write("pro_id")
            Response.Write(vbTab)
            Response.Write("pro_descripcion")
            Response.Write(vbTab)
            Response.Write("pro_costo")
            Response.Write(vbTab)
            Response.Write("Estado")
            Response.Write(vbTab)
            Response.Write(vbCrLf)
            Dim value As String
            For Each accion In productos
                value = accion.pro_id
                Response.Write(value)
                Response.Write(vbTab)
                value = accion.pro_descripcion
                Response.Write(value)
                Response.Write(vbTab)
                value = accion.pro_costo
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
            'Me.Editar()
        End If
    End Sub

    Private Sub Agregar()
        Dim producto As New Eproducto
        Dim usuario As New Eusuario
        Dim resultado() As Integer
        Dim jsmensaje As String = String.Empty

        usuario = Session("pUsuario")

        producto.pro_id = CType(Me.txtId.Value.ToUpper, String)
        producto.pro_descripcion = CType(Me.txtDescripcion.Value.ToUpper, String)
        producto.pro_costo = CType(Me.txtCosto.Value.ToUpper, Decimal)
        producto.estado = 1
        producto.idUsuario = usuario.idUsuario
        resultado = Rproducto.Añadir(producto)

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
        Dim producto As New Eproducto
        Dim productoF As New List(Of Eproducto)
        Dim intFila As String = String.Empty
        With gvwLista
            intFila = CType(gvwLista.Rows(id).Cells(0).FindControl("lnkCodigo"), LinkButton).CommandArgument
        End With

        productoF = Session("lista")
        If Not productoF Is Nothing Then
            For Each producto In productoF
                If producto.pro_id = intFila Then
                    Session("Modo") = 1
                    Session("pro_id") = producto.pro_id
                    Me.txtId.Value = producto.pro_id
                    Me.txtDescripcion.Value = producto.pro_descripcion
                    Me.txtCosto.Value = producto.pro_costo
                End If
            Next
        End If
    End Sub

    Private Sub Editar()
        Dim producto As New Eproducto
        Dim usuario As New Eusuario
        Dim resultado() As Integer
        Dim jsmensaje As String = String.Empty

        usuario = Session("pUsuario")
        producto.pro_id = Session("pro_id")

        producto.pro_descripcion = CType(Me.txtDescripcion.Value.ToUpper, String)
        producto.pro_costo = CType(Me.txtCosto.Value.ToUpper, Decimal)
        producto.estado = 1
        producto.idUsuario = usuario.idUsuario

        resultado = Rproducto.Editar(producto)

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
            Dim producto As New Eproducto
            producto.pro_descripcion = txtBuscar.Value
            productos = Rproducto.Buscar(producto)
            Session("lista") = productos
            If productos IsNot Nothing Then
                gvwLista.DataSource = productos
                gvwLista.DataBind()
            End If
        End If
    End Sub

    Private Sub limpiarDatos()
        Session("Modo") = 0
        Me.txtId.Value = ""
        Me.txtDescripcion.Value = ""
        Me.txtBuscar.Value = ""
        Me.txtCosto.Value = ""
        cargarDatos()
        txtId.Focus()
    End Sub

    Protected Sub btnLimpiar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLimpiar.Click
        limpiarDatos()
    End Sub
End Class