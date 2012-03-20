Public Class Rpersonal

    Public Shared Function SeleccionarTodo(ByVal descEmpresa As String, ByVal DisplaySelect As Boolean) As List(Of Epersonal)
        Dim personals As List(Of Epersonal) = Nothing

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                personals = Dpersonal.SeleccionarTodo(descEmpresa)
                If personals Is Nothing Then personals = New List(Of Epersonal)
                If DisplaySelect Then personals.Insert(0, New Epersonal("00", "-- SELECIONAR --"))
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return personals
    End Function
    'Public Shared Function SeleccionarXEstado(ByVal DisplaySelect As Boolean) As List(Of Epersonal)
    '    Dim personals As List(Of Epersonal) = Nothing

    '    Dim options As New TransactionOptions
    '    options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
    '    options.Timeout = New TimeSpan(0, 2, 0)

    '    Using scope As New TransactionScope(TransactionScopeOption.Required, options)
    '        Try
    '            personals = Dpersonal.SeleccionarXEstado
    '            If personals Is Nothing Then personals = New List(Of Epersonal)
    '            If DisplaySelect Then personals.Insert(0, New Epersonal("00", "-- SELECIONAR --"))
    '            scope.Complete()
    '        Catch ex As Exception
    '            Throw
    '        End Try
    '    End Using

    '    Return personals
    'End Function
    Public Shared Function Añadir(ByVal descEmpresa As String, ByVal pPersonal As Epersonal, ByRef idPersonal As Int32) As Boolean
        Dim resultado As Boolean = False

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dpersonal.Añadir(descEmpresa, pPersonal, idPersonal)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function
    Public Shared Function Editar(ByVal descEmpresa As String, ByVal ppersonal As Epersonal) As Boolean
        Dim resultado As Boolean = False

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dpersonal.Editar(descEmpresa, ppersonal)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function
    Public Shared Function Eliminar(ByVal descEmpresa As String, ByVal ppersonal As Epersonal) As Boolean
        Dim resultado As Boolean = False

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dpersonal.Eliminar(descEmpresa, ppersonal)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function

End Class
