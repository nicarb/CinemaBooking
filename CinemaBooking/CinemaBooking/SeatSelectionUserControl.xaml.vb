Imports System.Data.SqlClient

Public Class SeatSelectionUserControl
    Private con As New SqlConnection(MyConnection.MyConnectionString)
    'Private seatsMap As List(Of RoomSeat) = New List(Of RoomSeat)()

    Private staffForm As StaffForm
    Private rowCount As Integer = 0
    Private colCount As Integer = 0

    Public Sub New()
        InitializeComponent()
        Dim test As String = ""
    End Sub

    Public Sub New(ByRef staffForm As StaffForm, ByVal idprojection_time As Integer, ByVal idmovie As Integer, ByVal idtheatre_room As Integer)
        InitializeComponent()
        Me.staffForm = staffForm
        getRoomSize(idtheatre_room)
        getRoomSeats(idprojection_time, idmovie, idtheatre_room)

        Dim test As String = ""
    End Sub

    Private Sub getRoomSeats(ByVal idprojection_time As Integer, ByVal idmovie As Integer, ByVal idtheatre_room As Integer)
        Dim CMD As New SqlCommand("getRoomSeats")
        CMD.Parameters.Add("@idtheatre_room", SqlDbType.Int).Value = idtheatre_room
        CMD.Parameters.Add("@idprojection_time", SqlDbType.Int).Value = idprojection_time
        CMD.Parameters.Add("@idmovie", SqlDbType.Int).Value = idmovie
        CMD.Parameters.Add("@iduser", SqlDbType.Int).Value = SqlUtils.currentLoggedUserID
        CMD.Connection = con
        CMD.CommandType = CommandType.StoredProcedure

        Try
            Dim adapter As New SqlDataAdapter(CMD)
            adapter.SelectCommand.CommandTimeout = 300
            '
            ''Fill the dataset
            Dim DS As New DataSet()
            adapter.Fill(DS)
            For Each DR As DataRow In DS.Tables(0).Rows
                addButtonToPane(DR, idprojection_time, idmovie, idtheatre_room)
            Next
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        con.Close()

        ''Now, read through your data:

    End Sub

    Private Sub addButtonToPane(ByRef DR As DataRow, ByVal idprojection_time As Integer, ByVal idmovie As Integer, ByVal idtheatre_room As Integer)
        Dim seatBtt As RoomSeat = New RoomSeat()
        'Dim seatBtt As System.Windows.Controls.Button = New System.Windows.Controls.Button()
        Dim seatId As String
        seatBtt.idtheatre_room = idtheatre_room
        seatBtt.idprojection_time = idprojection_time
        seatBtt.idmovie = idmovie
        seatBtt.idseat = DR("idseat")
        seatBtt.row_nr = DR("row_nr")
        seatBtt.seat_nr = DR("seat_nr")
        seatBtt.row_char = DR("row_char")
        seatBtt.barcode = DR("barcode")
        seatBtt.seat_state = DR("seat_state")
        'seatBtt.AddHandler(New buttonCl Button_Click)
        seatId = String.Format("{0}{1}", seatBtt.row_char, seatBtt.seat_nr)

        seatBtt.Content = seatId ' + "-" + seatBtt.seat_state
        seatBtt.Name = seatId + "Btt"

        Select Case seatBtt.seat_state
            Case "F"
                seatBtt.Background = System.Windows.Media.Brushes.LightGreen ' = New SolidBrush(Color.Green)
            Case "B"
                seatBtt.Background = System.Windows.Media.Brushes.Yellow '.Brush.Background = Color.Yellow
            Case "S"
                seatBtt.Background = System.Windows.Media.Brushes.Red '.Brush = New SolidBrush(Color.Red)
            Case Else
                seatBtt.Background = System.Windows.Media.Brushes.Gray '.Brush = New SolidBrush(Color.Red)
        End Select

        Select Case seatBtt.row_char
            Case "A"
                RowA.Children.Add(seatBtt)
            Case "B"
                RowB.Children.Add(seatBtt)
            Case "C"
                RowC.Children.Add(seatBtt)
            Case "D"
                RowD.Children.Add(seatBtt)
            Case "E"
                RowE.Children.Add(seatBtt)
            Case "F"
                RowF.Children.Add(seatBtt)
            Case "G"
                RowG.Children.Add(seatBtt)
            Case "H"
                RowH.Children.Add(seatBtt)
            Case "I"
                RowI.Children.Add(seatBtt)
            Case "J"
                RowJ.Children.Add(seatBtt)
            Case "K"
                RowK.Children.Add(seatBtt)
            Case "L"
                RowL.Children.Add(seatBtt)
            Case "M"
                RowM.Children.Add(seatBtt)
            Case "N"
                RowN.Children.Add(seatBtt)
            Case "O"
                RowO.Children.Add(seatBtt)
            Case "P"
                RowP.Children.Add(seatBtt)
            Case "Q"
                RowQ.Children.Add(seatBtt)
            Case "R"
                RowR.Children.Add(seatBtt)
            Case "S"
                RowS.Children.Add(seatBtt)
            Case "T"
                RowT.Children.Add(seatBtt)
            Case "U"
                RowU.Children.Add(seatBtt)
            Case "V"
                RowV.Children.Add(seatBtt)
            Case "W"
                RowW.Children.Add(seatBtt)
            Case "X"
                RowX.Children.Add(seatBtt)
            Case "Y"
                RowY.Children.Add(seatBtt)
            Case "Z"
                RowZ.Children.Add(seatBtt)
        End Select


    End Sub


    Private Sub getRoomSize(ByVal idtheatre_room As Integer)
        Dim sqlString As String = "SELECT [idtheatre_room] ,[name] ,[desccription] ,[rows_nr] ,[seats_per_row] ,[idcinema] FROM [dbo].[TheatreRoom] "

        sqlString = String.Format("{0} WHERE idtheatre_room = {1}", sqlString, idtheatre_room)

        Try

            If con.State <> ConnectionState.Open Then
                con.Open()
            End If

            Dim adapter As SqlDataAdapter = New SqlDataAdapter(sqlString, con)
            Dim dt As New DataTable
            adapter.Fill(dt)
            Int32.TryParse(dt.Rows(0)("rows_nr"), rowCount)
            Int32.TryParse(dt.Rows(0)("seats_per_row"), colCount)

        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

        con.Close()
    End Sub

    Private Sub Button_Click(sender As Object, e As Windows.RoutedEventArgs)

    End Sub
End Class
