Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class WSProductoStock
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
       Return "Hello World"
    End Function

    <WebMethod()> _
        Public Function ProductoStock(ByVal idProducto As String) As String
        Dim producto As String = String.Empty
        Dim objBCProducto As New GF.Layer.BL.BC.Rproducto
        producto = objBCProducto.Stock(idProducto)
        Return producto
    End Function

    <WebMethod()> _
        Public Function ProductoObtener(ByVal idProducto As String) As String
        Dim producto As String = String.Empty
        Dim objBCProducto As New GF.Layer.BL.BC.Rproducto
        producto = objBCProducto.Obtener(idProducto)
        Return producto
    End Function
End Class