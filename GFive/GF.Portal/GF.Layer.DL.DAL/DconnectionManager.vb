Public Class DconnectionManager
    Private Shared CadCon As String

    'Obtenemos la cadena de conexión que se encuentra en el web.config	
    Public Shared Function GetCadena() As String
        Return ConfigurationManager.ConnectionStrings("GFive").ConnectionString
    End Function
    
End Class
