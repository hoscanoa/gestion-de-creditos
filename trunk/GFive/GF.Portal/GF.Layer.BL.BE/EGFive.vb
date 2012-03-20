Public Class EGFive
    Private _mostrarMenu As Boolean = True
    Private _idUsuario As Int32
    Private _descUsuario As String
    'Private _idHipodromo As Int32
    'Private _descHipodromo As String
    Private _chkVisible As Boolean = False
    Private _idPerfilUsuario As Int32 = 0

    Public Property mostrarMenu() As Boolean
        Get
            Return _mostrarMenu
        End Get
        Set(ByVal value As Boolean)
            _mostrarMenu = value
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
    Public Property descUsuario() As String
        Get
            Return _descUsuario
        End Get
        Set(ByVal value As String)
            _descUsuario = value
        End Set
    End Property
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
    Public Property chkVisible() As Boolean
        Get
            Return _chkVisible
        End Get
        Set(ByVal value As Boolean)
            _chkVisible = value
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
End Class
