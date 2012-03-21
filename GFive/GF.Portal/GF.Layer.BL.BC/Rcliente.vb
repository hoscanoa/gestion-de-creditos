Public Class Rcliente

    Public Shared Function SeleccionarTodo(ByVal DisplaySelect As Boolean) As List(Of Ecliente)
        Dim clientes As List(Of Ecliente) = Nothing

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                clientes = Dcliente.SeleccionarTodo()
                If clientes Is Nothing Then clientes = New List(Of Ecliente)
                If DisplaySelect Then clientes.Insert(0, New Ecliente("00", "-- SELECIONAR --"))
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return clientes
    End Function

    Public Shared Function Añadir(ByVal BE_Cliente As Ecliente) As Integer()
        Dim resultado() As Integer

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dcliente.Añadir(BE_Cliente)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function

    Public Shared Function Editar(ByVal BE_Cliente As Ecliente) As Integer()
        Dim resultado() As Integer

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dcliente.Editar(BE_Cliente)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function

    Public Shared Function Eliminar(ByVal BE_Cliente As Ecliente) As Boolean
        Dim resultado As Boolean = False

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dcliente.Eliminar(BE_Cliente)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function

    Public Shared Function Buscar(ByVal BE_Cliente As Ecliente) As List(Of Ecliente)
        Dim clientes As List(Of Ecliente) = Nothing

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                clientes = Dcliente.Buscar(BE_Cliente)
                If clientes Is Nothing Then clientes = New List(Of Ecliente)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return clientes
    End Function

    Public Function Obtener(ByVal idCliente As String) As String
        Dim Dcliente As New Dcliente
        Dim cliente As String = String.Empty

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                cliente = Dcliente.Obtener(idCliente)
                If cliente Is Nothing Then cliente = String.Empty
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return cliente
    End Function

End Class
