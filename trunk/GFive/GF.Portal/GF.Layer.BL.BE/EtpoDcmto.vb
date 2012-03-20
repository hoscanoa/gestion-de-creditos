<Serializable()> _
Public Class EtpoDcmto

#Region "           Atributos                       "
    Private _idTpoDcmto As Int32
    Private _descTpoDcmto As String
    Private _estado As String
    Private _descEstado As String
    Private _idUsuario As Int32
#End Region

#Region "           Propiedades                     "
    Public Property idTpoDcmto() As Int32
        Get
            Return _idTpoDcmto
        End Get
        Set(ByVal value As Int32)
            _idTpoDcmto = value
        End Set
    End Property
    Public Property descTpoDcmto() As String
        Get
            Return _descTpoDcmto
        End Get
        Set(ByVal value As String)
            _descTpoDcmto = value
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
    Public Property descEstado() As String
        Get
            Return _descEstado
        End Get
        Set(ByVal value As String)
            _descEstado = value
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
    Public Sub New(ByVal idTpoDcmto As Int32, ByVal descTpoDcmto As String)
        Me.idTpoDcmto = idTpoDcmto
        Me.descTpoDcmto = descTpoDcmto
    End Sub
    Public Sub New(ByVal idTpoDcmto As Int32, ByVal descTpoDcmto As String, ByVal estado As String)
        Me.idTpoDcmto = idTpoDcmto
        Me.descTpoDcmto = descTpoDcmto
        Me.estado = estado
        Me.descEstado = IIf(estado = 1, "HABILITADO", "DESHABILITADO")
    End Sub
#End Region

End Class
