Public Class Dusuario
    Private Shared cadena As String = DconnectionManager.GetCadena()

    'Public Shared Function SeleccionarTodo() As List(Of Eusuario)
    '    Dim usuarios As List(Of Eusuario) = Nothing

    '    Using cn As New SqlConnection(ConfigurationManager.ConnectionStrings("BDEvolta").ConnectionString)
    '        Using cmd As New SqlCommand("up_modulo_selXid", cn)
    '            cmd.CommandType = CommandType.Text
    '            Try
    '                cn.Open()
    '                Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
    '                    If dr.HasRows Then
    '                        usuarios = New List(Of Eusuario)
    '                        Dim usuario As Eusuario = Nothing
    '                        Do While dr.Read
    '                            usuario = New Eusuario( _
    '                                dr.GetString(dr.GetOrdinal("usrccodigo")), _
    '                                dr.GetString(dr.GetOrdinal("usrcnombre")), _
    '                                dr.GetString(dr.GetOrdinal("usrclogin")))
    '                            usuarios.Add(usuario)
    '                        Loop
    '                        dr.Close()
    '                    End If
    '                End Using
    '            Catch ex As Exception
    '                Throw
    '            End Try
    '        End Using
    '    End Using

    '    Return usuarios
    'End Function
    'Public Shared Function TraerUno(ByVal scope As TransactionScope, ByVal codigo As String) As Eusuarios
    '    Dim usuario As Eusuarios = Nothing

    '    Using cn As New OracleConnection(ConfigurationManager.ConnectionStrings("CNM").ConnectionString)
    '        Dim sentencia As New Text.StringBuilder
    '        sentencia.Append("SELECT usrccodigo, perccodigo, usrcnombre, usrclogin, NVL(usrcclave,' ') usrcclave, NVL(usrvobserva, ' ') AS usrvobserva")
    '        sentencia.Append(" FROM cnmdb.siusuario t")
    '        sentencia.Append(" WHERE usrccodigo ='" & codigo & "'")

    '        Using cmd As New OracleCommand(sentencia.ToString, cn)
    '            cmd.CommandType = CommandType.Text
    '            Try
    '                cn.Open()
    '                Using dr As OracleDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
    '                    If dr.HasRows Then
    '                        dr.Read()
    '                        usuario = New Eusuarios( _
    '                                dr.GetString(dr.GetOrdinal("usrccodigo")), _
    '                                dr.GetString(dr.GetOrdinal("perccodigo")), _
    '                                dr.GetString(dr.GetOrdinal("usrcnombre")), _
    '                                dr.GetString(dr.GetOrdinal("usrclogin")), _
    '                                dr.GetString(dr.GetOrdinal("usrcclave")), _
    '                                dr.GetString(dr.GetOrdinal("usrvobserva")))
    '                        dr.Close()
    '                    End If
    '                End Using
    '            Catch ex As Exception
    '                Throw
    '            End Try
    '            sentencia.Length = 0
    '        End Using
    '    End Using

    '    Return usuario
    'End Function
    'Public Shared Function NuevoCodigo(ByVal scope As TransactionScope) As String
    '    Dim codigo As String = Nothing
    '    Using cn As New OracleConnection(ConfigurationManager.ConnectionStrings("CNM").ConnectionString)
    '        Using cmd As New OracleCommand("SELECT TRIM(TO_CHAR(MAX(usrccodigo) + 1,'099999')) FROM cnmdb.siusuario t", cn)
    '            cmd.CommandType = CommandType.Text
    '            Try
    '                cn.Open()
    '                codigo = CType(cmd.ExecuteScalar, String)
    '            Catch ex As Exception
    '                Throw
    '            End Try
    '        End Using
    '    End Using

    '    Return codigo
    'End Function
    'Public Shared Sub Insertar(ByVal scope As TransactionScope, ByVal codigo As String, ByVal codPersonal As String, _
    '                           ByVal nombre As String, ByVal login As String, ByVal clave As String, ByVal observacion As String)
    '    Using cn As New OracleConnection(ConfigurationManager.ConnectionStrings("CNM").ConnectionString)
    '        Dim sentencia As New Text.StringBuilder
    '        'sentencia.Append("CREATE USER " + login + " IDENTIFIED BY '" + clave + "'")

    '        sentencia.Append("INSERT INTO cnmdb.siusuario t")
    '        sentencia.Append(" (usrccodigo, perccodigo, usrcnombre, usrclogin, usrvobserva)")
    '        sentencia.Append(" VALUES('" & codigo & "','" & codPersonal & "','" & nombre & "','" & login & "','" & observacion & "')")

    '        Using cmd As New OracleCommand(sentencia.ToString, cn)
    '            cmd.CommandType = CommandType.Text
    '            Try
    '                cn.Open()
    '                cmd.ExecuteNonQuery()
    '            Catch ex As Exception
    '                Throw
    '            End Try
    '            sentencia.Length = 0
    '        End Using
    '    End Using
    'End Sub
    'Public Shared Sub Actualizar(ByVal scope As TransactionScope, ByVal codigo As String, ByVal codPersonal As String, _
    '                             ByVal nombre As String, ByVal login As String, ByVal clave As String, ByVal observacion As String)
    '    Using cn As New OracleConnection(ConfigurationManager.ConnectionStrings("CNM").ConnectionString)
    '        Dim sentencia As New Text.StringBuilder
    '        sentencia.Append("UPDATE cnmdb.siusuario t")
    '        sentencia.Append(" SET  usrcnombre='" & nombre & "', usrclogin='" & login & "',")
    '        sentencia.Append("      usrvobserva='" & observacion & "'")
    '        sentencia.Append(" WHERE usrccodigo='" & codigo & "' AND perccodigo='" & codPersonal & "'")

    '        Using cmd As New OracleCommand(sentencia.ToString, cn)
    '            cmd.CommandType = CommandType.Text
    '            Try
    '                cn.Open()
    '                cmd.ExecuteNonQuery()
    '            Catch ex As Exception
    '                Throw
    '            End Try
    '            sentencia.Length = 0
    '        End Using
    '    End Using
    'End Sub
    'Public Shared Sub Eliminar(ByVal scope As TransactionScope, ByVal codigo As String)
    '    Using cn As New OracleConnection(ConfigurationManager.ConnectionStrings("CNM").ConnectionString)
    '        Dim sentencia As New Text.StringBuilder
    '        sentencia.Append("DELETE FROM cnmdb.siusuario t")
    '        sentencia.Append(" WHERE usrccodigo='" & codigo & "'")

    '        Using cmd As New OracleCommand(sentencia.ToString, cn)
    '            cmd.CommandType = CommandType.Text
    '            Try
    '                cn.Open()
    '                cmd.ExecuteNonQuery()
    '            Catch ex As Exception
    '                Throw
    '            End Try
    '            sentencia.Length = 0
    '        End Using
    '    End Using
    'End Sub

    Public Shared Function comprobarUsuario(ByRef pUsuario As Eusuario) As Int32       
        Dim resultado As Int32 = 0

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_comprobarUsuario", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@usuario", SqlDbType.VarChar, 55).Value = pUsuario.usuario
                cmd.Parameters.Add("@contraseña", SqlDbType.VarChar, 55).Value = pUsuario.contraseña
                cmd.Parameters.Add("@mensaje", SqlDbType.VarChar, 55).Direction = ParameterDirection.Output
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Direction = ParameterDirection.Output
                cmd.Parameters.Add("@resultado", SqlDbType.Int).Direction = ParameterDirection.ReturnValue
                cmd.Parameters.Add("@idPerfilUsuario", SqlDbType.Int).Direction = ParameterDirection.Output
                Try
                    cn.Open()
                    cmd.ExecuteNonQuery()
                    resultado = CType(cmd.Parameters("@resultado").Value, Int32)
                    pUsuario.idUsuario = CType(cmd.Parameters("@idUsuario").Value, Int32)
                    pUsuario.mensaje = CType(cmd.Parameters("@mensaje").Value, String)
                    pUsuario.idPerfilUsuario = CType(cmd.Parameters("@idPerfilUsuario").Value, Int32)
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return resultado
    End Function
    'Public Shared Function TraerPerfilesXUsuario(ByVal scope As TransactionScope, ByVal login As String, _
    '                                             ByVal contraseña As String, ByRef mensaje As String) As ArrayList
    '    Dim arrPerfiles As ArrayList = Nothing
    '    Dim cnm As String = "Data Source=PRODUCCION;User ID='" & login & "';Password='" & contraseña & "';"

    '    'Using cn As New OracleConnection(cnm)
    '    Using cn As New OracleConnection(ConfigurationManager.ConnectionStrings("CNM").ConnectionString)
    '        Dim sentencia As New Text.StringBuilder
    '        sentencia.Append("SELECT DISTINCT prfccodigo")
    '        sentencia.Append(" FROM cnmdb.siperfusu")
    '        sentencia.Append(" WHERE usrccodigo = (")
    '        sentencia.Append(" 	    SELECT usrccodigo")
    '        sentencia.Append(" 	    FROM cnmdb.siusuario")
    '        sentencia.Append(" 	    WHERE usrclogin ='" & login & "')")

    '        Using cmd As New OracleCommand(sentencia.ToString, cn)
    '            cmd.CommandType = CommandType.Text
    '            Try
    '                cn.Open()
    '                Using dr As OracleDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
    '                    If dr.HasRows Then
    '                        arrPerfiles = New ArrayList
    '                        Do While dr.Read
    '                            arrPerfiles.Add(dr.GetString(dr.GetOrdinal("prfccodigo")))
    '                        Loop
    '                        dr.Close()
    '                    Else
    '                        mensaje = "No tiene asignado ningún Perfil."
    '                    End If
    '                End Using
    '            Catch ex As Exception
    '                mensaje = "Usuario no valido. Verifique sus datos."
    '            End Try
    '            sentencia.Length = 0
    '        End Using
    '    End Using

    '    Return arrPerfiles
    'End Function
    Public Shared Function Añadir(ByVal empresa As String, ByVal pUsuario As Eusuario) As Boolean
        Dim resultado As Boolean = False

        Using cn As New SqlConnection(ConfigurationManager.ConnectionStrings(empresa).ConnectionString)
            Using cmd As New SqlCommand("usp_usuario_add", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@idPerfilUsuario", SqlDbType.Int).Value = pUsuario.idPerfilUsuario
                cmd.Parameters.Add("@idPersonal", SqlDbType.Int).Value = pUsuario.idPersonal
                cmd.Parameters.Add("@usuario", SqlDbType.VarChar, 55).Value = pUsuario.usuario
                cmd.Parameters.Add("@contraseña", SqlDbType.VarChar, 55).Value = pUsuario.contraseña
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = pUsuario.idUsuario
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
    Public Shared Function Editar(ByVal empresa As String, ByVal pUsuario As Eusuario) As Boolean
        Dim resultado As Boolean = False

        Using cn As New SqlConnection(ConfigurationManager.ConnectionStrings(empresa).ConnectionString)
            Using cmd As New SqlCommand("usp_usuario_edit", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@idPerfilUsuario", SqlDbType.Int).Value = pUsuario.idPerfilUsuario
                cmd.Parameters.Add("@idPersonal", SqlDbType.VarChar, 55).Value = pUsuario.idPersonal
                'cmd.Parameters.Add("@id", SqlDbType.VarChar, 55).Value = pUsuario.id
                cmd.Parameters.Add("@usuario", SqlDbType.VarChar, 55).Value = pUsuario.usuario
                cmd.Parameters.Add("@contraseña", SqlDbType.VarChar, 55).Value = pUsuario.contraseña
                cmd.Parameters.Add("@idUsuario", SqlDbType.VarChar, 55).Value = pUsuario.idUsuario
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
