<Serializable()> _
Public Class Ecliente

#Region "           Atributos                       "
    Private _cli_ruc As String
    Private _cli_razonSocial As String
    Private _cli_direccion As String
    Private _estado As String
    Private _desEstado As String
    Private _idUsuario As Int32
#End Region

#Region "           Propiedades                     "
    Public Property cli_ruc() As String
        Get
            Return _cli_ruc
        End Get
        Set(ByVal value As String)
            _cli_ruc = value
        End Set
    End Property
    Public Property cli_razonSocial() As String
        Get
            Return _cli_razonSocial
        End Get
        Set(ByVal value As String)
            _cli_razonSocial = value
        End Set
    End Property
    Public Property cli_direccion() As String
        Get
            Return _cli_direccion
        End Get
        Set(ByVal value As String)
            _cli_direccion = value
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

#Region "           Contructores                    "
    Public Sub New()

    End Sub
    Public Sub New(ByVal cli_ruc As String, ByVal cli_razonSocial As String)
        Me.cli_ruc = cli_ruc
        Me.cli_razonSocial = cli_razonSocial
    End Sub
    Public Sub New(ByVal cli_ruc As String, ByVal cli_razonSocial As String, ByVal cli_direccion As String, _
                   ByVal estado As String, ByVal idUsuario As Integer)
        Me.cli_ruc = cli_ruc
        Me.cli_razonSocial = cli_razonSocial
        Me.cli_direccion = cli_direccion
        Me.estado = estado
        Me.desEstado = IIf(estado = 1, "HABILITADO", "DESHABILITADO")
        Me.idUsuario = idUsuario
    End Sub
#End Region


End Class
