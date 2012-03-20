<Serializable()> _
Public Class Eproducto

#Region "           Atributos                       "
    Private _pro_id As String
    Private _pro_descripcion As String
    Private _pro_costo As Decimal
    Private _estado As String
    Private _desEstado As String
    Private _idUsuario As Int32
#End Region

#Region "           Propiedades                     "
    Public Property pro_id() As String
        Get
            Return _pro_id
        End Get
        Set(ByVal value As String)
            _pro_id = value
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
    Public Property pro_costo() As Decimal
        Get
            Return _pro_costo
        End Get
        Set(ByVal value As Decimal)
            _pro_costo = value
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
    Public Sub New(ByVal pro_id As String, ByVal pro_descripcion As String)
        Me.pro_id = pro_id
        Me.pro_descripcion = pro_descripcion
    End Sub
    Public Sub New(ByVal pro_id As String, ByVal pro_descripcion As String, ByVal pro_costo As Decimal, _
                   ByVal estado As String, ByVal idUsuario As Integer)
        Me.pro_id = pro_id
        Me.pro_descripcion = pro_descripcion
        Me.pro_costo = pro_costo
        Me.estado = estado
        Me.desEstado = IIf(estado = 1, "HABILITADO", "DESHABILITADO")
        Me.idUsuario = idUsuario
    End Sub
#End Region


End Class
