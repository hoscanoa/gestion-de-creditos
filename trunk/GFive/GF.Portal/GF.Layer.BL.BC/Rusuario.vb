Public Class Rusuario

    'Public Shared Function SeleccionarTodo() As List(Of Eusuarios)
    '    Dim usuarios As List(Of Eusuarios) = Nothing

    '    Dim options As New TransactionOptions
    '    options.IsolationLevel = IsolationLevel.ReadCommitted
    '    options.Timeout = New TimeSpan(0, 2, 0)

    '    Using scope As New TransactionScope(TransactionScopeOption.Required, options)
    '        Try
    '            usuarios = Dusuarios.SeleccionarTodo(scope)
    '        Catch ex As Exception
    '            Throw
    '        End Try
    '    End Using

    '    Return usuarios
    'End Function
    'Public Shared Function TraerUno(ByVal codigo As String) As Eusuarios
    '    Dim usuario As Eusuarios = Nothing

    '    Dim options As New TransactionOptions
    '    options.IsolationLevel = IsolationLevel.ReadCommitted
    '    options.Timeout = New TimeSpan(0, 2, 0)

    '    Using scope As New TransactionScope(TransactionScopeOption.Required, options)
    '        Try
    '            usuario = Dusuarios.TraerUno(scope, codigo)
    '            scope.Complete()
    '        Catch ex As Exception
    '            Throw
    '        End Try
    '    End Using

    '    Return usuario
    'End Function
    'Public Shared Function NuevoCodigo() As String
    '    Dim codigo As String = Nothing

    '    Dim options As New TransactionOptions
    '    options.IsolationLevel = IsolationLevel.ReadCommitted
    '    options.Timeout = New TimeSpan(0, 2, 0)

    '    Using scope As New TransactionScope(TransactionScopeOption.Required, options)
    '        Try
    '            codigo = Dusuarios.NuevoCodigo(scope)
    '            scope.Complete()
    '        Catch ex As Exception
    '            Throw
    '        End Try
    '    End Using

    '    Return codigo
    'End Function
    'Public Shared Sub Guardar(ByVal accion As String, ByVal codigo As String, ByVal codPersonal As String, _
    '                           ByVal nombre As String, ByVal login As String, ByVal clave As String, _
    '                           ByVal observacion As String, ByVal arrPerfiles As ArrayList)
    '    Dim options As New TransactionOptions
    '    options.IsolationLevel = IsolationLevel.ReadCommitted
    '    options.Timeout = New TimeSpan(0, 2, 0)

    '    Using scope As New TransactionScope(TransactionScopeOption.Required, options)
    '        Try
    '            If accion = "A" Then
    '                Dusuarios.Insertar(scope, codigo, codPersonal, nombre, login, clave, observacion)
    '            ElseIf accion = "E" Then
    '                Dusuarios.Actualizar(scope, codigo, codPersonal, nombre, login, clave, observacion)
    '            End If
    '            Dperfiles.Insertar(scope, codigo, arrPerfiles)
    '            scope.Complete()
    '        Catch ex As Exception
    '            Throw
    '        End Try
    '    End Using
    'End Sub
    'Public Shared Sub Eliminar(ByVal codigo As String)
    '    Dim options As New TransactionOptions

    '    options.IsolationLevel = IsolationLevel.ReadCommitted
    '    options.Timeout = New TimeSpan(0, 2, 0)

    '    Using scope As New TransactionScope(TransactionScopeOption.Required, options)
    '        Try
    '            Dusuarios.Eliminar(scope, codigo)
    '            scope.Complete()
    '        Catch ex As Exception
    '            Throw
    '        End Try
    '    End Using
    'End Sub

    Public Shared Function comprobarUsuario(ByRef pUsuario As Eusuario) As Int32
        Dim resultado As Int32 = 0

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dusuario.comprobarUsuario(pUsuario)
                scope.Complete()
                'CESAR
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function
    Public Shared Function Añadir(ByVal empresa As String, ByVal pUsuario As Eusuario) As Boolean
        Dim resultado As Boolean = False

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dusuario.Añadir(empresa, pUsuario)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function
    Public Shared Function Editar(ByVal empresa As String, ByVal pUsuario As Eusuario) As Boolean
        Dim resultado As Boolean = False

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dusuario.Editar(empresa, pUsuario)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function
    'Public Shared Function TraerPerfilesXUsuario(ByVal login As String, ByVal contraseña As String, ByRef mensaje As String) As ArrayList
    '    Dim arrPerfiles As ArrayList = Nothing

    '    Dim options As New TransactionOptions
    '    options.IsolationLevel = IsolationLevel.ReadCommitted
    '    options.Timeout = New TimeSpan(0, 2, 0)

    '    Using scope As New TransactionScope(TransactionScopeOption.Required, options)
    '        Try
    '            arrPerfiles = Dusuarios.TraerPerfilesXUsuario(scope, login, contraseña, mensaje)
    '            scope.Complete()
    '        Catch ex As Exception
    '            Throw
    '        End Try
    '    End Using

    '    Return arrPerfiles
    'End Function


    'Private Shared usuario As New Eusuarios
    'Public Shared Function Filtrar(ByVal usuarios As List(Of Eusuarios), ByVal filtro As String) As List(Of Eusuarios)
    '    If IsNumeric(filtro) Then
    '        usuario.usrccodigo = filtro
    '        Return usuarios.FindAll(AddressOf CondicionFiltrarCodigo)
    '    Else
    '        usuario.usrcnombre = filtro
    '        Return usuarios.FindAll(AddressOf CondicionFiltrarDescripcion)
    '    End If
    'End Function
    'Public Shared Function CondicionFiltrarCodigo(ByVal c As Eusuarios) As Boolean
    '    Return c.usrccodigo Like usuario.usrccodigo + "*"
    'End Function
    'Public Shared Function CondicionFiltrarDescripcion(ByVal c As Eusuarios) As Boolean
    '    Return c.usrcnombre Like "*" + usuario.usrcnombre + "*"
    'End Function

End Class
