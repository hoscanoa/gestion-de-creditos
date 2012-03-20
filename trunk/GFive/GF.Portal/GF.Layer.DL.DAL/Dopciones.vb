Public Class Dopciones
    Private Shared cadena As String = DconnectionManager.GetCadena()

    Public Shared Function SeleccionarTodoXEstado(ByVal descEmpresa As String) As List(Of Eopciones)
        Dim opciones As List(Of Eopciones) = Nothing

        Using cn As New SqlConnection(ConfigurationManager.ConnectionStrings(descEmpresa).ConnectionString)
            Using cmd As New SqlCommand("usp_opcion_selXEstado", cn)
                cmd.CommandType = CommandType.StoredProcedure
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            opciones = New List(Of Eopciones)
                            Dim opcion As Eopciones = Nothing
                            Do While dr.Read
                                opcion = New Eopciones( _
                                    dr.GetInt32(dr.GetOrdinal("idModulo")), _
                                    dr.GetInt32(dr.GetOrdinal("idSubModulo")), _
                                    dr.GetInt32(dr.GetOrdinal("idOpcion")), _
                                    dr.GetString(dr.GetOrdinal("descModulo")), _
                                    dr.GetString(dr.GetOrdinal("descSubModulo")), _
                                    dr.GetString(dr.GetOrdinal("descOpcion")))
                                opciones.Add(opcion)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return opciones
    End Function

    'Recuperamos las opciones por modulo y submodulos para cada usuario segun perfil
    Public Shared Function SeleccionarTodoXModuloSubModulo(ByVal idModulo As Int32, ByVal idPerfil As Int32) As List(Of Eopciones)
        Dim opciones As List(Of Eopciones) = Nothing

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_opcion_selXModuloXSubModulo", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@idModulo", SqlDbType.Int).Value = idModulo
                cmd.Parameters.Add("@idPerfil", SqlDbType.Int).Value = idPerfil
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            opciones = New List(Of Eopciones)
                            Dim opcion As Eopciones = Nothing
                            Do While dr.Read
                                opcion = New Eopciones( _
                                    dr.GetInt32(dr.GetOrdinal("idSubModulo")), _
                                    dr.GetInt32(dr.GetOrdinal("idOpcion")), _
                                    dr.GetString(dr.GetOrdinal("descOpcion")), _
                                    dr.GetString(dr.GetOrdinal("direccionUrl")))
                                opciones.Add(opcion)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return opciones
    End Function

End Class
