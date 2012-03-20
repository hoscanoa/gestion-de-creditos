Public Class DconnectionManager
    Private Shared CadCon As String

    Public Shared Function GetCadena() As String
        Return ConfigurationManager.ConnectionStrings("GFive").ConnectionString
    End Function
    
End Class
