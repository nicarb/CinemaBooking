Public Class GuiUtils

End Class

Public Class IdValueCBoxItem
    Public id As Integer
    Public value As String

    Public Sub New(ByVal nId As Integer, ByVal nValue As String)
        Me.id = nId
        Me.value = nValue
    End Sub
    Public Overrides Function ToString() As String
        Return Me.value
    End Function
End Class

Public Class TicketTypeCBoxItem
    Public id As Integer
    Public value As String
    Public type As Integer
    Public price As Decimal
    Public discount As Integer
    Public Sub New(ByVal nId As Integer, ByVal nValue As String, ByVal nType As Integer, ByVal nPrice As Decimal, ByVal nDiscount As Integer)
        Me.id = nId
        Me.value = nValue
        Me.type = nType
        Me.price = nPrice
        Me.discount = nDiscount
    End Sub

    Public Overrides Function ToString() As String
        Return Me.value
    End Function
End Class

Public Class DateCBoxItem
    Public mDate As DateTime
    Public value As String
    Public Sub New(ByVal nDate As DateTime, ByVal value As String)
        Me.mDate = nDate
        Me.value = If(Not (String.IsNullOrEmpty(value)), value, nDate.Date)
    End Sub
    Public Overrides Function ToString() As String
        Return value
    End Function
End Class