Imports Microsoft.VisualBasic

Public Class clsFecha
    Public Shared Function GetFormatoFechaPeru(ByVal strFecha As String) As String
        Try
            Dim strResultado As String = String.Empty
            If strFecha.Trim <> String.Empty Then
                strFecha = strFecha.Substring(0, 8) 'OJO: Solo selecciona los 8 caracteres YYYYMMDD
                Dim strA As String = String.Empty 'Año
                Dim strM As String = String.Empty 'Mes
                Dim strD As String = String.Empty 'Dia

                strA = strFecha.Substring(0, 4)
                strM = strFecha.Substring(4, 2)
                strD = strFecha.Substring(6, 2)

                strResultado = strD & "/" & strM & "/" & strA
            End If

            Return strResultado
        Catch ex As Exception
            Throw
        End Try
    End Function

    Public Shared Function GetFecha8(ByVal strFecha As String) As String
        Try
            Dim strResultado As String = String.Empty
            If strFecha.Trim <> String.Empty Then
                strFecha = strFecha.Substring(0, 10) 'OJO: Solo selecciona los 10 caracteres DD/MM/YYYY
                Dim strA As String = String.Empty 'Año
                Dim strM As String = String.Empty 'Mes
                Dim strD As String = String.Empty 'Dia

                strD = strFecha.Substring(0, 2)
                strM = strFecha.Substring(3, 2)
                strA = strFecha.Substring(6, 4)

                strResultado = strA & strM & strD
            End If
            Return strResultado

        Catch ex As Exception
            Throw
        End Try
    End Function
End Class
