<Serializable()> _
Public Class Emodelo

#Region "           Atributos                       "
    Private _idmodelo As String
    Private _desModelo As String
#End Region

#Region "           Propiedades                     "
    Public Property idmodelo() As String
        Get
            Return _idmodelo
        End Get
        Set(ByVal value As String)
            _idmodelo = value
        End Set
    End Property
    Public Property desModelo() As String
        Get
            Return _desModelo
        End Get
        Set(ByVal value As String)
            _desModelo = value
        End Set
    End Property
#End Region

#Region "           Propiedades Avanzadas           "

#End Region

#Region "           Contructores                    "
    Public Sub New()

    End Sub
    Public Sub New(ByVal idmodelo As String)
        Me.idmodelo = idmodelo
    End Sub
#End Region

End Class
