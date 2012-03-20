<Serializable()> _
Public Class EsubModulo

#Region "           Miembros                "
    Private _idModulo As Int32
    Private _idSubModulo As Int32
    Private _descSubModulo As String
    Private _direccionUrl As String
#End Region

#Region "           Propiedades             "
    Public Property idModulo() As Int32
        Get
            Return _idModulo
        End Get
        Set(ByVal value As Int32)
            _idModulo = value
        End Set
    End Property
    Public Property idSubModulo() As Int32
        Get
            Return _idSubModulo
        End Get
        Set(ByVal value As Int32)
            _idSubModulo = value
        End Set
    End Property
    Public Property descSubModulo() As String
        Get
            Return _descSubModulo
        End Get
        Set(ByVal value As String)
            _descSubModulo = value
        End Set
    End Property
    Public Property direccionUrl() As String
        Get
            Return _direccionUrl
        End Get
        Set(ByVal value As String)
            _direccionUrl = value
        End Set
    End Property
#End Region

#Region "           Construntores           "
    Public Sub New()

    End Sub
    Public Sub New(ByVal idSubModulo As Int32, ByVal descSubModulo As String)
        Me.idSubModulo = idSubModulo
        Me.descSubModulo = descSubModulo
    End Sub
    Public Sub New(ByVal idSubModulo As Int32, ByVal descSubModulo As String, ByVal direccionUrl As String)
        Me.idSubModulo = idSubModulo
        Me.descSubModulo = descSubModulo
        Me.direccionUrl = direccionUrl
    End Sub
    Public Sub New(ByVal idModulo As Int32, ByVal idSubModulo As Int32, ByVal descSubModulo As String, ByVal direccionUrl As String)
        Me.idModulo = idModulo
        Me.idSubModulo = idSubModulo
        Me.descSubModulo = descSubModulo
        Me.direccionUrl = direccionUrl
    End Sub
#End Region

End Class