<Serializable()> _
Public Class Eusuario

#Region "           Atributos                       "
    'Private _idHipodromo As Int32
    'Private _descHipodromo As String
    Private _idPersonal As Int32
    Private _idPerfilUsuario As Int32
    'Private _idPais As Int32
    'Private _descPais As String
    Private _usuario As String
    Private _contraseña As String
    Private _intentos As Int32
    Private _mensaje As String
    Private _estado As String
    Private _idUsuario As Int32
#End Region

#Region "           Propiedades                     "
    'Public Property idHipodromo() As Int32
    '    Get
    '        Return _idHipodromo
    '    End Get
    '    Set(ByVal value As Int32)
    '        _idHipodromo = value
    '    End Set
    'End Property
    'Public Property descHipodromo() As String
    '    Get
    '        Return _descHipodromo
    '    End Get
    '    Set(ByVal value As String)
    '        _descHipodromo = value
    '    End Set
    'End Property
    Public Property idPersonal() As Int32
        Get
            Return _idPersonal
        End Get
        Set(ByVal value As Int32)
            _idPersonal = value
        End Set
    End Property
    Public Property idPerfilUsuario() As Int32
        Get
            Return _idPerfilUsuario
        End Get
        Set(ByVal value As Int32)
            _idPerfilUsuario = value
        End Set
    End Property
    'Public Property idPais() As Int32
    '    Get
    '        Return _idPais
    '    End Get
    '    Set(ByVal value As Int32)
    '        _idPais = value
    '    End Set
    'End Property
    'Public Property descPais() As String
    '    Get
    '        Return _descPais
    '    End Get
    '    Set(ByVal value As String)
    '        _descPais = value
    '    End Set
    'End Property
    Public Property usuario() As String
        Get
            Return _usuario
        End Get
        Set(ByVal value As String)
            _usuario = value
        End Set
    End Property
    Public Property contraseña() As String
        Get
            Return _contraseña
        End Get
        Set(ByVal value As String)
            _contraseña = value
        End Set
    End Property
    Public Property intentos() As Int32
        Get
            Return _intentos
        End Get
        Set(ByVal value As Int32)
            _intentos = value
        End Set
    End Property
    Public Property mensaje() As String
        Get
            Return _mensaje
        End Get
        Set(ByVal value As String)
            _mensaje = value
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
    Public Sub New(ByVal idPersonal As Int32, ByVal usuario As String)
        Me.idPersonal = idPersonal
        Me.usuario = usuario
    End Sub
    Public Sub New(ByVal idPersonal As Int32, ByVal usuario As String, ByVal contraseña As String)
        Me.idPersonal = idPersonal
        Me.usuario = usuario
        Me.contraseña = contraseña
    End Sub
    Public Sub New(ByVal idPerfilUsuario As Int32, ByVal usuario As String, ByVal contraseña As String, ByVal idUsuario As Int32)
        Me.idPerfilUsuario = idPerfilUsuario
        Me.idPersonal = idPersonal
        Me.usuario = usuario
        Me.contraseña = contraseña
        Me.idUsuario = idUsuario
    End Sub
    Public Sub New(ByVal idPerfilUsuario As Int32, ByVal idPersonal As Int32, ByVal id As Int32, ByVal usuario As String, ByVal contraseña As String, ByVal idUsuario As Int32)
        Me.idPerfilUsuario = idPerfilUsuario
        Me.idPersonal = idPersonal
        Me.usuario = usuario
        Me.contraseña = contraseña
        Me.idUsuario = idUsuario
    End Sub
#End Region

End Class
