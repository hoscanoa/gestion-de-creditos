Public Class Dsubmodulo
    Private Shared cadena As String = DconnectionManager.GetCadena()

    Public Shared Function SeleccionarTodoXModulo(ByVal idModulo As Int32, ByVal idPerfil As Int32) As List(Of EsubModulo)
        Dim submodulos As List(Of EsubModulo) = Nothing

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_subModulo_selXModulo", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@idModulo", SqlDbType.Int).Value = idModulo
                cmd.Parameters.Add("@idPerfil", SqlDbType.Int).Value = idPerfil
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            submodulos = New List(Of EsubModulo)
                            Dim submodulo As EsubModulo = Nothing
                            Do While dr.Read
                                submodulo = New EsubModulo( _
                                    dr.GetInt32(dr.GetOrdinal("idModulo")), _
                                    dr.GetInt32(dr.GetOrdinal("idSubModulo")), _
                                    dr.GetString(dr.GetOrdinal("descSubModulo")), _
                                    dr.GetString(dr.GetOrdinal("direccionUrl")))
                                submodulos.Add(submodulo)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return submodulos
    End Function

End Class

