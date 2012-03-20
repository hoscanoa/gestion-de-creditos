Public Class Rproducto

    Public Shared Function SeleccionarTodo(ByVal DisplaySelect As Boolean) As List(Of Eproducto)
        Dim productos As List(Of Eproducto) = Nothing

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                productos = Dproducto.SeleccionarTodo()
                If productos Is Nothing Then productos = New List(Of Eproducto)
                If DisplaySelect Then productos.Insert(0, New Eproducto("00", "-- SELECIONAR --"))
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return productos
    End Function

    Public Shared Function Añadir(ByVal BE_Producto As Eproducto) As Integer()
        Dim resultado() As Integer

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dproducto.Añadir(BE_Producto)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function

    Public Shared Function Editar(ByVal BE_Producto As Eproducto) As Integer()
        Dim resultado() As Integer

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dproducto.Editar(BE_Producto)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function

    Public Shared Function Eliminar(ByVal BE_Producto As Eproducto) As Boolean
        Dim resultado As Boolean = False

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                resultado = Dproducto.Eliminar(BE_Producto)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return resultado
    End Function

    Public Shared Function Buscar(ByVal BE_Producto As Eproducto) As List(Of Eproducto)
        Dim productos As List(Of Eproducto) = Nothing

        Dim options As New TransactionOptions
        options.IsolationLevel = Transactions.IsolationLevel.ReadCommitted
        options.Timeout = New TimeSpan(0, 2, 0)

        Using scope As New TransactionScope(TransactionScopeOption.Required, options)
            Try
                productos = Dproducto.Buscar(BE_Producto)
                If productos Is Nothing Then productos = New List(Of Eproducto)
                scope.Complete()
            Catch ex As Exception
                Throw
            End Try
        End Using

        Return productos
    End Function
End Class
