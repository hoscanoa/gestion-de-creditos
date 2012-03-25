Public Class Dproducto
    Private Shared cadena As String = DconnectionManager.GetCadena()

    Public Shared Function SeleccionarTodo() As List(Of Eproducto)

        Dim productos As List(Of Eproducto) = Nothing

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_producto_sel", cn)
                cmd.CommandType = CommandType.StoredProcedure
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            productos = New List(Of Eproducto)
                            Dim producto As Eproducto = Nothing 'tipo 
                            Do While dr.Read
                                producto = New Eproducto( _
                                    dr.GetString(dr.GetOrdinal("pro_id")), _
                                    dr.GetString(dr.GetOrdinal("pro_descripcion")), _
                                    dr.GetDecimal(dr.GetOrdinal("pro_costo")), _
                                    dr.GetString(dr.GetOrdinal("estado")), _
                                    dr.GetInt32(dr.GetOrdinal("idUsuario")))
                                productos.Add(producto)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return productos
    End Function

    Public Shared Function Añadir(ByVal BE_Producto As Eproducto) As Integer()
        Dim resultado(1) As Integer
        Dim retorno As Int32 = 0
        Dim filas As Int32 = 0


        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_producto_add", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@pro_id", SqlDbType.VarChar, 55).Value = BE_Producto.pro_id
                cmd.Parameters.Add("@pro_descripcion", SqlDbType.VarChar, 55).Value = BE_Producto.pro_descripcion
                cmd.Parameters.Add("@pro_costo", SqlDbType.Decimal).Value = BE_Producto.pro_costo
                cmd.Parameters.Add("@estado", SqlDbType.Char, 1).Value = BE_Producto.estado
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = BE_Producto.idUsuario
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

    Public Shared Function Editar(ByVal BE_Producto As Eproducto) As Integer()
        Dim resultado(1) As Integer
        Dim retorno As Int32 = 0
        Dim filas As Int32 = 0

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_producto_edit", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@pro_id", SqlDbType.VarChar, 55).Value = BE_Producto.pro_id
                cmd.Parameters.Add("@pro_descripcion", SqlDbType.VarChar, 55).Value = BE_Producto.pro_descripcion
                cmd.Parameters.Add("@pro_costo", SqlDbType.Decimal, 55).Value = BE_Producto.pro_costo
                cmd.Parameters.Add("@estado", SqlDbType.Char, 1).Value = BE_Producto.estado
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = BE_Producto.idUsuario
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

    Public Shared Function Eliminar(ByVal BE_Producto As Eproducto) As Boolean
        Dim resultado As Boolean = False

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_cliente_del", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@cli_ruc", SqlDbType.VarChar, 55).Value = BE_Producto.pro_id
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = BE_Producto.idUsuario
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

    Public Shared Function Buscar(ByVal BE_Producto As Eproducto) As List(Of Eproducto)
        Dim productos As List(Of Eproducto) = Nothing

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_producto_find", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@pro_descripcion", SqlDbType.VarChar, 55).Value = BE_Producto.pro_descripcion
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            productos = New List(Of Eproducto)
                            Dim producto As Eproducto = Nothing 'tipo 
                            Do While dr.Read
                                producto = New Eproducto( _
                                    dr.GetString(dr.GetOrdinal("pro_id")), _
                                    dr.GetString(dr.GetOrdinal("pro_descripcion")), _
                                    dr.GetDecimal(dr.GetOrdinal("pro_costo")), _
                                    dr.GetString(dr.GetOrdinal("estado")), _
                                    dr.GetInt32(dr.GetOrdinal("idUsuario")))
                                productos.Add(producto)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return productos
    End Function

    Public Function Stock(ByVal idProducto As String) As String

        Dim producto As String = String.Empty

        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_producto_stock", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@pro_id", SqlDbType.VarChar, 55).Value = idProducto
                Try
                    cn.Open()
                    Using dr As SqlDataReader = cmd.ExecuteReader(CommandBehavior.SingleResult Or CommandBehavior.CloseConnection)
                        If dr.HasRows Then
                            Do While dr.Read
                                producto = CType(dr.GetValue(dr.GetOrdinal("pro_stock")), String)
                            Loop
                            dr.Close()
                        End If
                    End Using
                Catch ex As Exception
                    Throw
                End Try
            End Using
        End Using

        Return producto
    End Function


End Class
