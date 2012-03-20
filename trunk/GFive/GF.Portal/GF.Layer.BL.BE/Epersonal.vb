<Serializable()> _
Public Class Epersonal

#Region "           Miembros                        "
    Private _idPersonal As Int32
    'Private _idTpoDcmto As Int32

    Private _tpoDcmto As EtpoDcmto
    Private _nroDcmto As String

    Private _nombre As String
    Private _apePaterno As String
    Private _apeMaterno As String
    Private _descripcion As String
    Private _areaTrabajo As String
    Private _telefonoFijo As String
    Private _telefonoCelular As String
    Private _email As String
    Private _fchRegistro As String
    Private _fchCaducacion As String
    Private _estado As String
    Private _descEstado As String
    Private _idUsuario As Int32

    Private _EperfilUsuario As EperfilUsuario
    Private _Eusuario As Eusuario

    Private _usuario As String
    Private _contraseña As String
    Private _descPerfilUsuario As String

#End Region

#Region "           Propiedades                     "
    Public Property idPersonal() As Int32
        Get
            Return _idPersonal
        End Get
        Set(ByVal value As Int32)
            _idPersonal = value
        End Set
    End Property
    Public Property EtpoDocmto() As EtpoDcmto
        Get
            Return _tpoDcmto
        End Get
        Set(ByVal value As EtpoDcmto)
            _tpoDcmto = value
        End Set
    End Property
    Public Property nroDcmto() As String
        Get
            Return _nroDcmto
        End Get
        Set(ByVal value As String)
            _nroDcmto = value
        End Set
    End Property
    Public Property nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property
    Public Property apePaterno() As String
        Get
            Return _apePaterno
        End Get
        Set(ByVal value As String)
            _apePaterno = value
        End Set
    End Property
    Public Property apeMaterno() As String
        Get
            Return _apeMaterno
        End Get
        Set(ByVal value As String)
            _apeMaterno = value
        End Set
    End Property
    Public Property descripcion() As String
        Get
            Return _descripcion
        End Get
        Set(ByVal value As String)
            _descripcion = value
        End Set
    End Property
    Public Property areaTrabajo() As String
        Get
            Return _areaTrabajo
        End Get
        Set(ByVal value As String)
            _areaTrabajo = value
        End Set
    End Property
    Public Property telefonoFijo() As String
        Get
            Return _telefonoFijo
        End Get
        Set(ByVal value As String)
            _telefonoFijo = value
        End Set
    End Property
    Public Property telefonoCelular() As String
        Get
            Return _telefonoCelular
        End Get
        Set(ByVal value As String)
            _telefonoCelular = value
        End Set
    End Property
    Public Property email() As String
        Get
            Return _email
        End Get
        Set(ByVal value As String)
            _email = value
        End Set
    End Property
    Public Property fchRegistro() As String
        Get
            Return _fchRegistro
        End Get
        Set(ByVal value As String)
            _fchRegistro = value
        End Set
    End Property
    Public Property fchCaducacion() As String
        Get
            Return _fchCaducacion
        End Get
        Set(ByVal value As String)
            _fchCaducacion = value
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

    Public Property EperfilUsuario() As EperfilUsuario
        Get
            Return _EperfilUsuario
        End Get
        Set(ByVal value As EperfilUsuario)
            _EperfilUsuario = value
        End Set
    End Property
    Public Property Eusuario() As Eusuario
        Get
            Return _Eusuario
        End Get
        Set(ByVal value As Eusuario)
            _Eusuario = value
        End Set
    End Property
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
    Public Property descPerfilUsuario() As String
        Get
            Return _descPerfilUsuario
        End Get
        Set(ByVal value As String)
            _descPerfilUsuario = value
        End Set
    End Property
#End Region

#Region "           Propiedades Avanzadas           "
    Public ReadOnly Property NombresCompletos() As String
        Get
            Return nombre & " " & apePaterno & " " & apeMaterno
        End Get
    End Property
#End Region

#Region "           Construntores                   "
    Public Sub New()

    End Sub
    Public Sub New(ByVal idPersonal As Int32, ByVal nombresCompleto As String)
        Me.idPersonal = idPersonal
        Me.nombre = nombresCompleto
    End Sub
    Public Sub New(ByVal idPersonal As Int32, ByVal idTpoDcmto As Int32, ByVal descTpoDcmto As String, ByVal nroDcmto As String, _
                   ByVal nombre As String, ByVal apePaterno As String, ByVal apeMaterno As String, ByVal descripcion As String, _
                   ByVal areaTrabajo As String, ByVal telefonoFijo As String, ByVal telefonoCelular As String, ByVal email As String, _
                   ByVal fchRegistro As String, ByVal fchCaducacion As String, ByVal estado As String, ByVal idPerfilUsuario As Int32, _
                   ByVal descPerfilUsuario As String, ByVal idUsuario As Int32, ByVal usuario As String, ByVal contraseña As String)
        Me.idPersonal = idPersonal
        _tpoDcmto = New EtpoDcmto(idTpoDcmto, descTpoDcmto)
        Me.nroDcmto = nroDcmto
        Me.nombre = nombre
        Me.apePaterno = apePaterno
        Me.apeMaterno = apeMaterno
        Me.descripcion = descripcion
        Me.areaTrabajo = areaTrabajo
        Me.telefonoFijo = telefonoFijo
        Me.telefonoCelular = telefonoCelular
        Me.email = email
        Me.fchRegistro = fchRegistro
        Me.fchCaducacion = fchCaducacion
        Me.estado = estado
        Me.descEstado = IIf(estado = 1, "HABILITADO", "DESHABILITADO")
        _EperfilUsuario = New EperfilUsuario(idPerfilUsuario, descPerfilUsuario)
        Me.descPerfilUsuario = descPerfilUsuario
        _Eusuario = New Eusuario(idUsuario, usuario, contraseña)
        Me.usuario = usuario
    End Sub
#End Region

End Class
