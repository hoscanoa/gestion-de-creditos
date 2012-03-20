<Serializable()> _
Public Class Emodulos

#Region "           Miembros                "
    Private _idModulo As Int32
    Private _descModulo As String
#End Region

#Region "           Propiedades             "
    Public Property idModulo() As Int32
        Get
            Return _idModulo
        End Get
        Set(ByVal value As Int32)
            _idModulo = value
        End Set
    End Property
    Public Property descModulo() As String
        Get
            Return _descModulo
        End Get
        Set(ByVal value As String)
            _descModulo = value
        End Set
    End Property
#End Region

#Region "           Construntores           "
    Public Sub New()

    End Sub
    Public Sub New(ByVal idModulo As Int32, ByVal descModulo As String)
        Me.idModulo = idModulo
        Me.descModulo = descModulo
    End Sub
#End Region

End Class