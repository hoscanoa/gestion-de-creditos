Public Class Rmodulos

    Public Shared Function SeleccionarTodo(ByVal DisplaySelect As Boolean, ByVal idModulo As Int32) As List(Of Emodulos)
        Dim modulos As List(Of Emodulos) = Nothing

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                modulos = Dmodulo.SeleccionarTodo(idModulo)
                If modulos Is Nothing Then modulos = New List(Of Emodulos)
                If DisplaySelect Then modulos.Insert(0, New Emodulos("00", "-- SELECIONAR --"))
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return modulos
    End Function

End Class