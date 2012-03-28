Public Class Dpedido
    Private Shared cadena As String = DconnectionManager.GetCadena()

    Public Shared Function AñadirEncabezado(ByVal BE_Pedido As Epedido) As Integer()
        Dim resultado(1) As Integer
        Dim retorno As Int32 = 0
        Dim filas As Int32 = 0


        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_pedidoEncabezado_add", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@ped_id", SqlDbType.VarChar, 55).Value = BE_Pedido.ped_id
                cmd.Parameters.Add("@ped_cli_ruc", SqlDbType.VarChar, 55).Value = BE_Pedido.ped_cli_ruc
                cmd.Parameters.Add("@ped_fecha", SqlDbType.VarChar, 55).Value = BE_Pedido.ped_fecha
                cmd.Parameters.Add("@ped_total", SqlDbType.Decimal).Value = BE_Pedido.ped_total
                cmd.Parameters.Add("@situacion", SqlDbType.VarChar, 55).Value = BE_Pedido.situacion
                cmd.Parameters.Add("@estado", SqlDbType.Char, 1).Value = BE_Pedido.estado
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = BE_Pedido.idUsuario
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

    Public Shared Function AñadirDetalle(ByVal BE_Pedido As Epedido) As Integer()
        Dim resultado(1) As Integer
        Dim retorno As Int32 = 0
        Dim filas As Int32 = 0


        Using cn As New SqlConnection(cadena)
            Using cmd As New SqlCommand("usp_pedidoDetalle_add", cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@ped_id", SqlDbType.VarChar, 55).Value = BE_Pedido.ped_id
                cmd.Parameters.Add("@ped_cli_ruc", SqlDbType.VarChar, 55).Value = BE_Pedido.ped_cli_ruc
                cmd.Parameters.Add("@ped_pro_id", SqlDbType.VarChar, 55).Value = BE_Pedido.ped_pro_id
                cmd.Parameters.Add("@ped_precio", SqlDbType.Decimal, 55).Value = BE_Pedido.ped_precio
                cmd.Parameters.Add("@ped_cantidad", SqlDbType.Decimal).Value = BE_Pedido.ped_cantidad
                cmd.Parameters.Add("@situacion", SqlDbType.VarChar, 55).Value = BE_Pedido.situacion
                cmd.Parameters.Add("@estado", SqlDbType.Char, 1).Value = BE_Pedido.estado
                cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = BE_Pedido.idUsuario
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
End Class
