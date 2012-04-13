<Serializable()> _
Public Class PedidoRest
#Region "           Atributos                       "
    Private _ped_id As String
    Private _ped_cli_ruc As String
    Private _ped_razonSocial As String
    Private _monto As Decimal
    Private _situacion As String
#End Region

#Region "           Propiedades                     "
    Public Property idPedido() As String
        Get
            Return _ped_id
        End Get
        Set(ByVal value As String)
            _ped_id = value
        End Set
    End Property
    Public Property cli_ruc() As String
        Get
            Return _ped_cli_ruc
        End Get
        Set(ByVal value As String)
            _ped_cli_ruc = value
        End Set
    End Property
    Public Property cli_razonSocial() As String
        Get
            Return _ped_razonSocial
        End Get
        Set(ByVal value As String)
            _ped_razonSocial = value
        End Set
    End Property
    Public Property montoTotal() As Decimal
        Get
            Return _monto
        End Get
        Set(ByVal value As Decimal)
            _monto = value
        End Set
    End Property
    Public Property situacion() As String
        Get
            Return _situacion
        End Get
        Set(ByVal value As String)
            _situacion = value
        End Set
    End Property
#End Region

#Region "           Contructores                    "
    Public Sub New()

    End Sub

    Public Sub New(ByVal ped_id As String, ByVal ped_Cli_ruc As String, ByVal ped_razonSocial As String, ByVal monto As Decimal, ByVal situacion As String)
        Me.idPedido = ped_id
        Me.cli_ruc = ped_Cli_ruc
        Me.cli_razonSocial = ped_razonSocial
        Me.montoTotal = monto
        Me.situacion = situacion
    End Sub
#End Region

End Class
