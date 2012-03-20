<Serializable()> _
Public Class Eopciones

#Region "           Miembros                        "
    Private _idModulo As Int32
    Private _idSubModulo As Int32
    Private _idOpcion As Int32
    Private _descOpcion As String
    Private _direccionUrl As String
    Private _estado As String
    Private _descEstado As String

    '------- Seguridad -------'
    Private _descModulo As String
    Private _descSubModulo As String
    '-------------------------'
#End Region

#Region "           Propiedades                     "
    Public Property idModulo() As Int32
        Get
            Return _idModulo
        End Get
        Set(ByVal value As Int32)
            _idModulo = value
        End Set
    End Property
    Public Property idOpcion() As Int32
        Get
            Return _idOpcion
        End Get
        Set(ByVal value As Int32)
            _idOpcion = value
        End Set
    End Property
    Public Property idSubModulo() As Int32
        Get
            Return _idSubModulo
        End Get
        Set(ByVal value As Int32)
            _idSubModulo = value
        End Set
    End Property
    Public Property descOpcion() As String
        Get
            Return _descOpcion
        End Get
        Set(ByVal value As String)
            _descOpcion = value
        End Set
    End Property
    Public Property direccionUrl() As String
        Get
            Return _direccionUrl
        End Get
        Set(ByVal value As String)
            _direccionUrl = value
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

    '------- Seguridad -------'
    Public Property descModulo() As String
        Get
            Return _descModulo
        End Get
        Set(ByVal value As String)
            _descModulo = value
        End Set
    End Property
    Public Property descSubModulo() As String
        Get
            Return _descSubModulo
        End Get
        Set(ByVal value As String)
            _descSubModulo = value
        End Set
    End Property
    '-------------------------'
#End Region

#Region "           Propiedades Avanzadas           "
    Public ReadOnly Property idModuloSubModuloOpciones() As String
        Get
            Return idModulo.ToString + "," + idSubModulo.ToString + "," + idOpcion.ToString
        End Get
    End Property
#End Region

#Region "           Construntores                   "
    Public Sub New()

    End Sub
    Public Sub New(ByVal idSubModulo As Int32, ByVal idOpcion As Int32, ByVal descOpcion As String, _
                   ByVal direccionUrl As String)
        Me.idSubModulo = idSubModulo
        Me.idOpcion = idOpcion
        Me.descOpcion = descOpcion
        Me.direccionUrl = direccionUrl
    End Sub
    Public Sub New(ByVal idModulo As Int32, ByVal idSubModulo As Int32, ByVal idOpcion As Int32, _
                  ByVal descModulo As String, ByVal descSubModulo As String, ByVal descOpcion As String)
        Me.idModulo = idModulo
        Me.idSubModulo = idSubModulo
        Me.idOpcion = idOpcion
        Me.descModulo = descModulo
        Me.descSubModulo = descSubModulo
        Me.descOpcion = descOpcion
    End Sub
#End Region

End Class