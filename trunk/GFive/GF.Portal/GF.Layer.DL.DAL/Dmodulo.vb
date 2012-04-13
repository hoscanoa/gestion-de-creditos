
'El menú de opciones es formado dinamicamente desde la base de datos

Public Class Dmodulo
    Private Shared cadena As String = DconnectionManager.GetCadena()

    Public Shared Function SeleccionarTodo(ByVal idModulo As Int32) As List(Of Emodulos)
        Dim modulos As List(Of Emodulos) = Nothing

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_modulo_selXid", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@idModulo", SqlDbType.Int).Value = idModulo
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            modulos = New List(Of Emodulos)
                            Dim modulo As Emodulos = Nothing

                            'Lectura de...
                            Do While dr.Read
                                modulo = New Emodulos( _
                                    dr.GetInt32(dr.GetOrdinal("idModulo")), _
                                    dr.GetString(dr.GetOrdinal("descModulo")))
                                modulos.Add(modulo)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return modulos
    End Function

End Class
