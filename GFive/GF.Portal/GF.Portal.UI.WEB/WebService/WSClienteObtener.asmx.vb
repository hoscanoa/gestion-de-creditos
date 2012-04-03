Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class WSClienteObtener
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
       Return "Hello World"
    End Function

    <WebMethod()> _
    Public Function ClienteObtener(ByVal idCliente As String) As String
        Dim cliente As String = String.Empty
        Dim objBC As New GF.Layer.BL.BC.Rcliente
        cliente = objBC.Obtener(idCliente)
        Return cliente
    End Function


End Class