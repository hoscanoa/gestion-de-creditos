<Serializable()> _
Public Class Epedido

#Region "           Atributos                       "
    Private _ped_id As String
    Private _ped_cli_ruc As String
    Private _ped_razonSocial As String
    Private _ped_fecha As String
    Private _ped_total As Integer
    Private _ped_pro_id As String
    Private _pro_descripcion As String
    Private _ped_precio As Decimal
    Private _ped_cantidad As Integer
    Private _ped_subtotal As Decimal
    Private _situacion As String
    Private _estado As String
    Private _desEstado As String
    Private _idUsuario As Int32
#End Region

#Region "           Propiedades                     "
    Public Property ped_id() As String
        Get
            Return _ped_id
        End Get
        Set(ByVal value As String)
            _ped_id = value
        End Set
    End Property
    Public Property ped_cli_ruc() As String
        Get
            Return _ped_cli_ruc
        End Get
        Set(ByVal value As String)
            _ped_cli_ruc = value
        End Set
    End Property
    Public Property ped_razonSocial() As String
        Get
            Return _ped_razonSocial
        End Get
        Set(ByVal value As String)
            _ped_razonSocial = value
        End Set
    End Property
    Public Property ped_fecha() As String
        Get
            Return _ped_fecha
        End Get
        Set(ByVal value As String)
            _ped_fecha = value
        End Set
    End Property
    Public Property ped_total() As Integer
        Get
            Return _ped_total
        End Get
        Set(ByVal value As Integer)
            _ped_total = value
        End Set
    End Property
    Public Property ped_pro_id() As String
        Get
            Return _ped_pro_id
        End Get
        Set(ByVal value As String)
            _ped_pro_id = value
        End Set
    End Property
    Public Property pro_descripcion() As String
        Get
            Return _pro_descripcion
        End Get
        Set(ByVal value As String)
            _pro_descripcion = value
        End Set
    End Property
    Public Property ped_precio() As Decimal
        Get
            Return _ped_precio
        End Get
        Set(ByVal value As Decimal)
            _ped_precio = value
        End Set
    End Property
    Public Property ped_cantidad() As Integer
        Get
            Return _ped_cantidad
        End Get
        Set(ByVal value As Integer)
            _ped_cantidad = value
        End Set
    End Property
    Public Property ped_subTotal() As Decimal
        Get
            Return _ped_subtotal
        End Get
        Set(ByVal value As Decimal)
            _ped_subtotal = value
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

    Public Sub New(ByVal ped_id As String, ByVal ped_Cli_ruc As String, ByVal ped_razonSocial As String, ByVal situacion As String)
        Me.ped_id = ped_id
        Me.ped_cli_ruc = ped_Cli_ruc
        Me.ped_razonSocial = ped_razonSocial
        Me.situacion = situacion
    End Sub
    'Public Sub New(ByVal cli_ruc As String, ByVal cli_razonSocial As String)
    '    Me.cli_ruc = cli_ruc
    '    Me.cli_razonSocial = cli_razonSocial
    'End Sub
    'Public Sub New(ByVal cli_ruc As String, ByVal cli_razonSocial As String, ByVal cli_direccion As String, _
    '               ByVal estado As String, ByVal idUsuario As Integer)
    '    Me.cli_ruc = cli_ruc
    '    Me.cli_razonSocial = cli_razonSocial
    '    Me.cli_direccion = cli_direccion
    '    Me.estado = estado
    '    Me.desEstado = IIf(estado = 1, "HABILITADO", "DESHABILITADO")
    '    Me.idUsuario = idUsuario
    'End Sub
#End Region


End Class
