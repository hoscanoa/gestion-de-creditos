Imports System.Transactions

Public Class Rsubmodulos

    Public Shared Function SeleccionarTodoXModulo(ByVal DisplaySelect As Boolean, ByVal idModulo As Int32, _
                                                  ByVal idPerfil As Int32) As List(Of EsubModulo)
        Dim submodulos As List(Of EsubModulo) = Nothing

        Dim options As New TransactionOptions
        options.IsolationLevel = IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                submodulos = Dsubmodulo.SeleccionarTodoXModulo(idModulo, idPerfil)
                If submodulos Is Nothing Then submodulos = New List(Of EsubModulo)
                If DisplaySelect Then submodulos.Insert(0, New EsubModulo("00", "-- SELECIONAR --"))
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return submodulos
    End Function

End Class
