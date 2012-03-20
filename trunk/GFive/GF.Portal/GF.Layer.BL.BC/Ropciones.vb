Public Class Ropciones

    Public Shared Function SeleccionarTodoXEstado(ByVal descEmpresa As String) As List(Of Eopciones)
        Dim opciones As List(Of Eopciones) = Nothing

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                opciones = Dopciones.SeleccionarTodoXEstado(descEmpresa)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return opciones
    End Function
    Public Shared Function SeleccionarTodoXModuloSubModulo(ByVal idModulo As Int32, ByVal idPerfil As Int32) As List(Of Eopciones)
        Dim opciones As List(Of Eopciones) = Nothing

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                opciones = Dopciones.SeleccionarTodoXModuloSubModulo(idModulo, idPerfil)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return opciones
    End Function

End Class
