<Serializable()> _
Public Class EparametroSist

#Region "           Atributos                       "
    Private _idParametroSist As Int32
    Private _descParametroSist As String
    Private _aliasParametroSist As String
    Private _valor As Int32
    Private _desValor As String
    Private _estado As String
    Private _desEstado As String
    Private _idUsuario As Int32
#End Region

#Region "           Propiedades                     "
    Public Property idParametroSist() As Int32
        Get
            Return _idParametroSist
        End Get
        Set(ByVal value As Int32)
            _idParametroSist = value
        End Set
    End Property
    Public Property descParametroSist() As String
        Get
            Return _descParametroSist
        End Get
        Set(ByVal value As String)
            _descParametroSist = value
        End Set
    End Property
    Public Property aliasParametroSist() As String
        Get
            Return _aliasParametroSist
        End Get
        Set(ByVal value As String)
            _aliasParametroSist = value
        End Set
    End Property
    Public Property valor() As Int32
        Get
            Return _valor
        End Get
        Set(ByVal value As Int32)
            _valor = value
        End Set
    End Property
    Public Property desValor() As String
        Get
            Return _desValor
        End Get
        Set(ByVal value As String)
            _desValor = value
        End Set
    End Property
    Public Property estado() As String
        Get
            Return _estado
        End Get
        Set(ByVal value As String)
            _estado = value
        End Set
    End Property
    Public Property desEstado() As String
        Get
            Return _desEstado
        End Get
        Set(ByVal value As String)
            _desEstado = value
        End Set
    End Property
    Public Property idUsuario() As Int32
        Get
            Return _idUsuario
        End Get
        Set(ByVal value As Int32)
            _idUsuario = value
        End Set
    End Property
#End Region

#Region "           Propiedades Avanzadas           "

#End Region

#Region "           Contructores                    "
    Public Sub New()

    End Sub
    Public Sub New(ByVal idParametroSist As Int32, ByVal descParametroSist As String)
        Me.idParametroSist = idParametroSist
        Me.descParametroSist = descParametroSist
    End Sub
    Public Sub New(ByVal idParametroSist As Int32, ByVal descParametroSist As String, ByVal aliasParametroSist As String, ByVal valor As String, _
                   ByVal estado As String, ByVal idUsuario As Int32)
        Me.idParametroSist = idParametroSist
        Me.descParametroSist = descParametroSist
        Me.aliasParametroSist = aliasParametroSist
        Me.valor = valor
        Me.desValor = IIf(valor = 1, "NO", "SI")
        Me.estado = estado
        Me.desEstado = IIf(estado = 1, "HABILITADO", "DESHABILITADO")
        Me.idUsuario = idUsuario
    End Sub
#End Region

End Class
