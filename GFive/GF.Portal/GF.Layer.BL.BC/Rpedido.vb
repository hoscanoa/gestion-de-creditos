Public Class Rpedido

    Public Shared Function AñadirEncabezado(ByVal BE_Pedido As Epedido) As Integer()
        Dim resultado() As Integer

        Dim options As New TransactionOptions
        '
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dpedido.AñadirEncabezado(BE_Pedido)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function

    Public Shared Function AñadirDetalle(ByVal BE_Pedido As Epedido) As Integer()
        Dim resultado() As Integer

        Dim options As New TransactionOptions
        '
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dpedido.AñadirDetalle(BE_Pedido)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function

    Public Function ActualizarSituacion(ByVal BE_Pedido As Epedido) As Integer()
        Dim resultado() As Integer

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dpedido.ActualizarSituacion(BE_Pedido)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using
        Return resultado

    End Function

    Public Function ListadoPedido() As List(Of PedidoRest)
        Dim resultado As New List(Of PedidoRest)
        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dpedido.ListadoPedido()
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using
        Return resultado

    End Function

End Class
