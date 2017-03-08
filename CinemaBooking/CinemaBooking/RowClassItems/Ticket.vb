Imports System.Windows.Controls
Imports System.Data.SqlClient

Public Class TicketSPanel
    Inherits StackPanel

    Private con As New SqlConnection(MyConnection.MyConnectionString)
    Private ticketTypes As List(Of TicketTypeCBoxItem) = getTicketTypes()
    Friend WithEvents ticketTypesCBox As ComboBox = New ComboBox
    Friend WithEvents doCheckoutCBox As CheckBox = New CheckBox
    Private seatTextBox As TextBox = New TextBox
    Public nameTBox As TextBox = New TextBox
    Public phoneTBox As TextBox = New TextBox
    'Friend WithEvents ticketTypesCBox As System.Windows.Controls.ComboBox

    'Proper Values
    Public mySeat As SeatButton
    Public idticket As Integer = -1
    Public iditem As Integer = 15
    Public idseat As Integer = -1
    Public idseller As Integer = -1
    Public idprojection_time As Integer = -1
    Public price As Decimal = -1.0
    Public discount As Integer = 0
    Public barcode As String = String.Empty
    Public booking_time As DateTime = DateTime.Now
    Public idperson As Integer = -1
    Public ticket_state As Char = "B"
    Public typeDesc As String = String.Empty

    Sub New()

    End Sub

    Sub New(ByRef seat As SeatButton)
        Me.mySeat = seat
        idseat = mySeat.idseat
        idseller = SqlUtils.currentLoggedUserID
        barcode = seat.barcode
        idprojection_time = seat.idprojection_time
        'idmovie_projection = seat.
        loadGuiItems()
    End Sub

    Private Sub loadGuiItems()
        Me.Orientation = Windows.Controls.Orientation.Horizontal

        Dim seatLbl As Label = New Label
        seatLbl.Content = "Seat: "
        Me.Children.Add(seatLbl)

        seatTextBox.Name = "seatTextBox"
        seatTextBox.Text = mySeat.row_char.ToString() + " " + mySeat.seat_nr.ToString()
        seatTextBox.IsReadOnly = True
        Me.Children.Add(seatTextBox)

        Dim separator1 As Separator = New Separator
        separator1.Width = 10
        Me.Children.Add(separator1)

        loadTicketCBoxItems()


        Dim separator3 As Separator = New Separator
        separator3.Width = 10
        Me.Children.Add(separator3)

        Dim nameLbl As Label = New Label
        nameLbl.Content = "Name: "
        Me.Children.Add(nameLbl)

        nameTBox.Name = "nameTBox"
        nameTBox.Width = 60
        Me.Children.Add(nameTBox)

        Dim separator4 As Separator = New Separator
        separator4.Width = 10
        Me.Children.Add(separator4)

        Dim phoneLbl As Label = New Label
        phoneLbl.Content = "Phone: "
        Me.Children.Add(phoneLbl)

        phoneTBox.Name = "phoneTBox"
        phoneTBox.Width = 60
        Me.Children.Add(phoneTBox)

        Dim separator2 As Separator = New Separator
        separator2.Width = 10
        Me.Children.Add(separator2)

        doCheckoutCBox.Name = "doCheckoutCBox"
        doCheckoutCBox.Content = "Do Checkout"
        Me.Children.Add(doCheckoutCBox)
        'Me.Children.Add()
        'Me.Children.Add()
    End Sub

    Private Sub loadTicketCBoxItems()
        '()
        For Each tItem In ticketTypes
            ticketTypesCBox.Items.Add(tItem)
        Next
        ticketTypesCBox.SelectedIndex = 0
        Me.Children.Add(ticketTypesCBox)
    End Sub

    Private Sub ticketTypesCBox_SelectedIndexChanged(sender As Object, e As SelectionChangedEventArgs) Handles ticketTypesCBox.SelectionChanged
        Dim selectedItem As TicketTypeCBoxItem = ticketTypesCBox.SelectedItem

        If (selectedItem IsNot Nothing) Then
            Me.iditem = selectedItem.id
            Me.price = selectedItem.price
            Me.discount = selectedItem.discount
            Me.typeDesc = selectedItem.value
        End If
    End Sub

    Private Sub doCheckoutCBox_Checked(sender As Object, e As Windows.RoutedEventArgs) Handles doCheckoutCBox.Checked
        If doCheckoutCBox.IsChecked Then
            ticket_state = "S"
            'nameTBox.IsReadOnly = True
            'phoneTBox.IsReadOnly = True
        Else
            ticket_state = "B"
            'nameTBox.IsReadOnly = False
            'phoneTBox.IsReadOnly = False
        End If
    End Sub

    Private Function getTicketTypes() As List(Of TicketTypeCBoxItem)
        Dim ticketTypes As List(Of TicketTypeCBoxItem) = New List(Of TicketTypeCBoxItem)
        Dim id As Integer = -1
        Dim value As String = String.Empty
        Dim type As Integer = -1
        Dim price As Decimal = -1.0
        Dim discount As Integer = -1

        Dim sqlString As String = "SELECT t2.iditem, t1.name, t1.iditem_type, t2.unit_price, t2.discount FROM [dbo].[Item] as t2 INNER JOIN  [dbo].[ItemType] as t1 on t1.iditem_type = t2.iditem_type where t2.is_ticket = 1"

        Try

            con.Open()

            Dim adapter As SqlDataAdapter = New SqlDataAdapter(sqlString, con)
            Dim dt As New DataTable
            adapter.Fill(dt)
            For Each row In dt.Rows
                Int32.TryParse(row("iditem"), id)
                value = row("name").ToString().Trim()
                Int32.TryParse(row("iditem_type"), type)
                Decimal.TryParse(row("unit_price"), price)
                Int32.TryParse(row("discount"), discount)
                Dim item As TicketTypeCBoxItem = New TicketTypeCBoxItem(id, value, type, price, discount)
                ticketTypes.Add(item)
            Next
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

        con.Close()
        Return ticketTypes
    End Function

End Class
