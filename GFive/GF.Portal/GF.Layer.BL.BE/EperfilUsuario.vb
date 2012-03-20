<Serializable()> _
Public Class EperfilUsuario

#Region "           Miembros                        "
    Private _idPerfilUsuario As Int32
    Private _descPerfilUsuario As String
    Private _estado As String
    Private _descEstado As String
    Private _idUsuario As Int32
#End Region

#Region "           Propiedades                     "
    Public Property idPerfilUsuario() As Int32
        Get
            Return _idPerfilUsuario
        End Get
        Set(ByVal value As Int32)
            _idPerfilUsuario = value
        End Set
    End Property
    Public Property descPerfilUsuario() As String
        Get
            Return _descPerfilUsuario
        End Get
        Set(ByVal value As String)
            _descPerfilUsuario = value
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

#Region "           Construntores                   "
    Public Sub New()

    End Sub
    Public Sub New(ByVal idPerfilUsuario As Int32, ByVal descPerfilUsuario As String)
        Me.idPerfilUsuario = idPerfilUsuario
        Me.descPerfilUsuario = descPerfilUsuario
    End Sub
    Public Sub New(ByVal idPerfilUsuario As Int32, ByVal descPerfilUsuario As String, ByVal estado As String)
        Me.idPerfilUsuario = idPerfilUsuario
        Me.descPerfilUsuario = descPerfilUsuario
        Me.estado = estado
        Me.descEstado = IIf(estado = 1, "HABILITADO", "DESHABILITADO")
    End Sub
#End Region

End Class
