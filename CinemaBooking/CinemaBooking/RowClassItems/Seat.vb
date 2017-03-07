Imports System.Windows.Controls
Imports System.Data.SqlClient

Public Class RoomSeat
    Inherits Button

    Private con As New SqlConnection(MyConnection.MyConnectionString)

    Public idseat As Integer = 0
    Public idtheatre_room As Integer = 0
    Public idprojection_time As Integer = 0
    Public idmovie As Integer = 0
    Public row_nr As Integer = 0
    Public seat_nr As Integer = 0
    Public row_char As Char
    Public barcode As String = String.Empty
    Public seat_state As Char

    Sub New()
        Me.Width = 30
        Me.Height = 25
    End Sub

    Private Sub buttonClick() Handles Me.Click
        Select Case Me.seat_state
            Case "F"
                If changeSeatState(Me.idseat, "B") Then
                    Me.Background = System.Windows.Media.Brushes.Yellow ' = New SolidBrush(Color.Green)
                    Me.seat_state = "B"
                Else
                    MessageBox.Show("Seat Cannot Be Booked!", "Seat Booked", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                End If
            Case "B"
                Dim result As DialogResult = MessageBox.Show("Current seat has been booked. Do you want to remove it?", "Cancel Ticket", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question)
                If result = DialogResult.Yes Then
                    If changeSeatState(Me.idseat, "F") Then
                        Me.Background = System.Windows.Media.Brushes.LightGreen '.Brush = New SolidBrush(Color.Red)
                        Me.seat_state = "F"
                    Else
                        MessageBox.Show("Seat Cannot Be un-booked!", "Seat Booked", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                    End If
                End If

            Case "S"
                Dim result As DialogResult = MessageBox.Show("Current seat has been sold. Do you want to cancel?", "Cancel Ticket", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question)
                If result = DialogResult.Yes Then
                    If changeSeatState(Me.idseat, "F") Then
                        Me.Background = System.Windows.Media.Brushes.LightGreen '.Brush = New SolidBrush(Color.Red)
                        Me.seat_state = "F"
                    Else
                        MessageBox.Show("Seat Cannot be cancelled!", "Seat sold", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                    End If
                End If

            Case Else
                Dim result As DialogResult = MessageBox.Show("Do You want to make available this seat?", "Enable seat", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question)
                If result = DialogResult.Yes Then
                    If changeSeatState(Me.idseat, "F") Then
                        Me.Background = System.Windows.Media.Brushes.LightGreen '.Brush = New SolidBrush(Color.Red)
                        Me.seat_state = "F"
                    Else
                        MessageBox.Show("Seat Cannot be modified!", "Seat unavialable", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                    End If
                End If

                'Me.Background = System.Windows.Media.Brushes.LightGray '.Brush = New SolidBrush(Color.Red)
        End Select
        'Dim seatId = String.Format("{0}{1}", row_char, seat_nr)

        'Me.Content = seatId ' + "-" + seat_state

    End Sub

    Private Function changeSeatState(ByVal idseat As Integer, ByVal new_seat_state As Char) As Boolean
        Dim result As Integer
        Dim CMD As New SqlCommand("updateSeatState")
        CMD.Parameters.Add("@idseat", SqlDbType.Int).Value = idseat
        CMD.Parameters.Add("@iduser", SqlDbType.Int).Value = SqlUtils.currentLoggedUserID
        CMD.Parameters.Add("@seat_state", SqlDbType.NChar).Value = new_seat_state.ToString()
        CMD.Parameters.Add("@retval", SqlDbType.Int).Direction = ParameterDirection.Output

        CMD.Connection = con
        CMD.CommandType = CommandType.StoredProcedure
        Try
            con.Open()
            CMD.ExecuteNonQuery()

            result = CMD.Parameters("@retval").Value
            'result = Convert.ToInt32(CMD.ExecuteScalar)

        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        con.Close()


        Return (result = 0)
    End Function
End Class
