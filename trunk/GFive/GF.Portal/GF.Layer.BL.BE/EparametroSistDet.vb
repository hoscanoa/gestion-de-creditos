<Serializable()> _
Public Class EparametroSistDet

#Region "           Atributos                       "
    Private _idParametroSist As Integer
    Private _idParametroSistDet As Integer
    Private _descParametroSistDet As String
    Private _aliasParametroSistDet As String
    Private _valor As Integer
    Private _desValor As String
    Private _estado As String
    Private _desEstado As String
#End Region

#Region "           Propiedades                     "
    Public Property idParametroSist() As Integer
        Get
            Return _idParametroSist
        End Get
        Set(ByVal value As Integer)
            _idParametroSist = value
        End Set
    End Property
    Public Property idParametroSistDet() As Integer
        Get
            Return _idParametroSistDet
        End Get
        Set(ByVal value As Integer)
            _idParametroSistDet = value
        End Set
    End Property
    Public Property descParametroSistDet() As String
        Get
            Return _descParametroSistDet
        End Get
        Set(ByVal value As String)
            _descParametroSistDet = value
        End Set
    End Property
    Public Property aliasParametroSistDet() As String
        Get
            Return _aliasParametroSistDet
        End Get
        Set(ByVal value As String)
            _aliasParametroSistDet = value
        End Set
    End Property
    Public Property valor() As Integer
        Get
            Return _valor
        End Get
        Set(ByVal value As Integer)
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
#End Region

#Region "           Propiedades Avanzadas           "

#End Region

#Region "           Contructores                    "
    Public Sub New()

    End Sub
    Public Sub New(ByVal idParametroSistDet As Int32, ByVal descParametroSistDet As String)
        Me.idParametroSistDet = idParametroSist
        Me.descParametroSistDet = descParametroSistDet
    End Sub
    Public Sub New(ByVal idParametroSist As Int32, ByVal idParametroSistDet As Int32, ByVal descParametroSistDet As String, ByVal aliasParametroSistDet As String, ByVal valor As Integer, _
                   ByVal estado As String)
        Me.idParametroSist = idParametroSist
        Me.idParametroSistDet = idParametroSistDet
        Me.descParametroSistDet = descParametroSistDet
        Me.aliasParametroSistDet = aliasParametroSistDet
        Me.valor = valor
        Me.desValor = IIf(estado = 1, "NO", "SI")
        Me.estado = estado
        Me.desEstado = IIf(estado = 1, "HABILITADO", "DESHABILITADO")
    End Sub
#End Region

End Class
