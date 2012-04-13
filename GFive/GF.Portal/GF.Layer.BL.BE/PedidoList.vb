Imports System.Xml.Serialization

<XmlRoot("pedidos")> _
Public Class PedidoList
    <XmlElement()> _
    Public data As List(Of PedidoRest)
    '<XmlArrayItem("data")> _
    'Public Property data() As List(Of PedidoRest)
    '    Get
    '        Return _data
    '    End Get
    '    Set(ByVal value As List(Of PedidoRest))
    '        _data = value
    '    End Set
    'End Property
End Class
