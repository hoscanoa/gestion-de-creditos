Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports GF.Layer.BL.BE
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class WSPedidoObtener
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function

    <WebMethod()> _
   Public Function PedidoListado() As PedidoList
        Dim pedidoF As New PedidoList
        Dim objBC As New GF.Layer.BL.BC.Rpedido
        pedidoF.data = objBC.ListadoPedido()
        Return pedidoF
    End Function
End Class