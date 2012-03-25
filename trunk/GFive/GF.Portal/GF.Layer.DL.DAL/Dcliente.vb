Public Class Dcliente
    Private Shared cadena As String = DconnectionManager.GetCadena()

    Public Shared Function SeleccionarTodo() As List(Of Ecliente)

        Dim clientes As List(Of Ecliente) = Nothing

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_cliente_sel", cn)
                cmd.CommandType = CommandType.StoredProcedure
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            clientes = New List(Of Ecliente)
                            Dim cliente As Ecliente = Nothing 'tipo 
                            Do While dr.Read
                                cliente = New Ecliente( _
                                    dr.GetString(dr.GetOrdinal("cli_ruc")), _
                                    dr.GetString(dr.GetOrdinal("cli_razonSocial")), _
                                    dr.GetString(dr.GetOrdinal("cli_direccion")), _
                                    dr.GetString(dr.GetOrdinal("estado")), _
                                    dr.GetInt32(dr.GetOrdinal("idUsuario")))
                                clientes.Add(cliente)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return clientes
    End Function

    Public Shared Function Añadir(ByVal BE_Cliente As Ecliente) As Integer()
        Dim resultado(1) As Integer
        Dim retorno As Int32 = 0
        Dim filas As Int32 = 0


        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_cliente_add", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@cli_ruc", SqlDbType.VarChar, 55).Value = BE_Cliente.cli_ruc
                cmd.Parameters.Add("@cli_razonSocial", SqlDbType.VarChar, 55).Value = BE_Cliente.cli_razonSocial
                cmd.Parameters.Add("@cli_direccion", SqlDbType.VarChar, 55).Value = BE_Cliente.cli_direccion
                cmd.Parameters.Add("@estado", SqlDbType.Char, 1).Value = BE_Cliente.estado
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = BE_Cliente.idUsuario
                cmd.Parameters.Add("@resultado", SqlDbType.Int).Direction = ParameterDirection.ReturnValue
                Try
                    cn.Open()
                    filas = cmd.ExecuteNonQuery()
                    retorno = CType(cmd.Parameters("@resultado").Value, Int32)
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        resultado(0) = filas
        resultado(1) = retorno

        Return resultado
    End Function

    Public Shared Function Editar(ByVal BE_Cliente As Ecliente) As Integer()
        Dim resultado(1) As Integer
        Dim retorno As Int32 = 0
        Dim filas As Int32 = 0

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_cliente_edit", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@cli_ruc", SqlDbType.VarChar, 55).Value = BE_Cliente.cli_ruc
                cmd.Parameters.Add("@cli_razonSocial", SqlDbType.VarChar, 55).Value = BE_Cliente.cli_razonSocial
                cmd.Parameters.Add("@cli_direccion", SqlDbType.VarChar, 55).Value = BE_Cliente.cli_direccion
                cmd.Parameters.Add("@estado", SqlDbType.Char, 1).Value = BE_Cliente.estado
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = BE_Cliente.idUsuario
                cmd.Parameters.Add("@resultado", SqlDbType.Int).Direction = ParameterDirection.ReturnValue
                Try
                    cn.Open()
                    filas = cmd.ExecuteNonQuery()
                    retorno = CType(cmd.Parameters("@resultado").Value, Int32)
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        resultado(0) = filas
        resultado(1) = retorno
        Return resultado
    End Function

    Public Shared Function Eliminar(ByVal BE_Cliente As Ecliente) As Boolean
        Dim resultado As Boolean = False

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_cliente_del", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@cli_ruc", SqlDbType.VarChar, 55).Value = BE_Cliente.cli_ruc
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = BE_Cliente.idUsuario
                Try
                    cn.Open()
                    cmd.ExecuteNonQuery()
                    resultado = True
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return resultado
    End Function

    Public Shared Function Buscar(ByVal BE_Cliente As Ecliente) As List(Of Ecliente)
        Dim clientes As List(Of Ecliente) = Nothing

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_cliente_find", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@cli_razonSocial", SqlDbType.VarChar, 55).Value = BE_Cliente.cli_razonSocial                
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            clientes = New List(Of Ecliente)
                            Dim cliente As Ecliente = Nothing 'tipo 
                            Do While dr.Read
                                cliente = New Ecliente( _
                                    dr.GetString(dr.GetOrdinal("cli_ruc")), _
                                    dr.GetString(dr.GetOrdinal("cli_razonSocial")), _
                                    dr.GetString(dr.GetOrdinal("cli_direccion")), _
                                    dr.GetString(dr.GetOrdinal("estado")), _
                                    dr.GetInt32(dr.GetOrdinal("idUsuario")))
                                clientes.Add(cliente)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return clientes
    End Function

    Public Function Obtener(ByVal idCliente As String) As String
        Dim cliente As String = String.Empty

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_cliente_obtener", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@cli_ruc", SqlDbType.VarChar, 55).Value = idCliente
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            Do While dr.Read
                                cliente = dr.GetValue(dr.GetOrdinal("cli_RazonSocial"))
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return cliente
    End Function
End Class
