Public Class Dpersonal

    Public Shared Function SeleccionarTodo(ByVal descEmpresa As String) As List(Of Epersonal)
        Dim personals As List(Of Epersonal) = Nothing

        Using cn As New SqlConnection(ConfigurationManager.ConnectionStrings(descEmpresa).ConnectionString)
            Using cmd As New SqlCommand("usp_personal_sel", cn)
                cmd.CommandType = CommandType.StoredProcedure
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            personals = New List(Of Epersonal)
                            Dim persona As Epersonal = Nothing
                            Do While dr.Read
                                persona = New Epersonal( _
                                    dr.GetInt32(dr.GetOrdinal("idPersonal")), _
                                    dr.GetInt32(dr.GetOrdinal("idTpoDcmto")), _
                                    dr.GetString(dr.GetOrdinal("descTpoDcmto")), _
                                    dr.GetString(dr.GetOrdinal("nroDcmto")), _
                                    dr.GetString(dr.GetOrdinal("nombre")), _
                                    dr.GetString(dr.GetOrdinal("apePaterno")), _
                                    dr.GetString(dr.GetOrdinal("apeMaterno")), _
                                    dr.GetString(dr.GetOrdinal("descripcion")), _
                                    dr.GetString(dr.GetOrdinal("areaTrabajo")), _
                                    dr.GetString(dr.GetOrdinal("telefonoFijo")), _
                                    dr.GetString(dr.GetOrdinal("telefonoCelular")), _
                                    dr.GetString(dr.GetOrdinal("email")), _
                                    dr.GetString(dr.GetOrdinal("fchRegistro")), _
                                    dr.GetString(dr.GetOrdinal("fchCaducacion")), _
                                    dr.GetString(dr.GetOrdinal("estado")), _
                                    dr.GetInt32(dr.GetOrdinal("idPerfilUsuario")), _
                                    dr.GetString(dr.GetOrdinal("descPerfilUsuario")), _
                                    dr.GetInt32(dr.GetOrdinal("idUsuario")), _
                                    dr.GetString(dr.GetOrdinal("usuario")), _
                                dr.GetString(dr.GetOrdinal("contraseña")))
                                personals.Add(persona)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return personals
    End Function
    Public Shared Function Añadir(ByVal descEmpresa As String, ByVal pPersonal As Epersonal, ByRef idPersonal As Int32) As Boolean
        Dim resultado As Boolean = False

        Using cn As New SqlConnection(ConfigurationManager.ConnectionStrings(descEmpresa).ConnectionString)
            Using cmd As New SqlCommand("usp_personal_add", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@idTpoDcmto", SqlDbType.Int).Value = pPersonal.EtpoDocmto.idTpoDcmto
                cmd.Parameters.Add("@nroDcmto", SqlDbType.VarChar, 55).Value = pPersonal.nroDcmto
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar, 55).Value = pPersonal.nombre
                cmd.Parameters.Add("@apePaterno", SqlDbType.VarChar, 55).Value = pPersonal.apePaterno
                cmd.Parameters.Add("@apeMaterno", SqlDbType.VarChar, 55).Value = pPersonal.apeMaterno
                cmd.Parameters.Add("@descripcion", SqlDbType.VarChar, 55).Value = pPersonal.descripcion
                cmd.Parameters.Add("@areaTrabajo", SqlDbType.VarChar, 55).Value = pPersonal.areaTrabajo
                cmd.Parameters.Add("@telefonoFijo", SqlDbType.VarChar, 11).Value = pPersonal.telefonoFijo
                cmd.Parameters.Add("@telefonoCelular", SqlDbType.VarChar, 11).Value = pPersonal.telefonoCelular
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 55).Value = pPersonal.email
                cmd.Parameters.Add("@fchRegistro", SqlDbType.VarChar, 10).Value = pPersonal.fchRegistro
                cmd.Parameters.Add("@fchCaducacion", SqlDbType.VarChar, 10).Value = pPersonal.fchCaducacion
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = pPersonal.idUsuario
                cmd.Parameters.Add("@idPersonal", SqlDbType.Int).Direction = ParameterDirection.Output
                Try
                    cn.Open()
                    cmd.ExecuteNonQuery()
                    idPersonal = CType(cmd.Parameters("@idPersonal").Value, Int32)
                    resultado = True
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return resultado
    End Function
    Public Shared Function Editar(ByVal descEmpresa As String, ByVal pPersonal As Epersonal) As Boolean
        Dim resultado As Boolean = False

        Using cn As New SqlConnection(ConfigurationManager.ConnectionStrings(descEmpresa).ConnectionString)
            Using cmd As New SqlCommand("usp_personal_edit", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@idPersonal", SqlDbType.Int).Value = pPersonal.idPersonal
                cmd.Parameters.Add("@idTpoDcmto", SqlDbType.Int).Value = pPersonal.EtpoDocmto.idTpoDcmto
                cmd.Parameters.Add("@nroDcmto", SqlDbType.VarChar, 55).Value = pPersonal.nroDcmto
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar, 55).Value = pPersonal.nombre
                cmd.Parameters.Add("@apePaterno", SqlDbType.VarChar, 55).Value = pPersonal.apePaterno
                cmd.Parameters.Add("@apeMaterno", SqlDbType.VarChar, 55).Value = pPersonal.apeMaterno
                cmd.Parameters.Add("@descripcion", SqlDbType.VarChar, 55).Value = pPersonal.descripcion
                cmd.Parameters.Add("@areaTrabajo", SqlDbType.VarChar, 55).Value = pPersonal.areaTrabajo
                cmd.Parameters.Add("@telefonoFijo", SqlDbType.VarChar, 11).Value = pPersonal.telefonoFijo
                cmd.Parameters.Add("@telefonoCelular", SqlDbType.VarChar, 11).Value = pPersonal.telefonoCelular
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 55).Value = pPersonal.email
                cmd.Parameters.Add("@fchRegistro", SqlDbType.VarChar, 10).Value = pPersonal.fchRegistro
                cmd.Parameters.Add("@fchCaducacion", SqlDbType.VarChar, 10).Value = pPersonal.fchCaducacion
                cmd.Parameters.Add("@estado", SqlDbType.Char, 1).Value = pPersonal.estado
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = pPersonal.idUsuario
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
    Public Shared Function Eliminar(ByVal descEmpresa As String, ByVal pPersonal As Epersonal) As Boolean
        Dim resultado As Boolean = False

        Using cn As New SqlConnection(ConfigurationManager.ConnectionStrings(descEmpresa).ConnectionString)
            Using cmd As New SqlCommand("usp_personal_del", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@idPersonal", SqlDbType.Int).Value = pPersonal.idPersonal
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = pPersonal.idUsuario
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

End Class
