Imports System.Data.SqlClient
Imports System.Windows.Forms.Integration

Public Class StaffForm
    Dim screensList As List(Of IdValueCBoxItem) = New List(Of IdValueCBoxItem)
    Public ticketsCheckoutList As List(Of TicketSPanel) = New List(Of TicketSPanel)
    Dim con As New SqlConnection(MyConnection.MyConnectionString)
    Dim currSlectedMovieId As Integer = 0
    Dim currSlectedProjId As Integer = 0

    Public Sub New()
        InitializeComponent()
        Dim test As String = ""
    End Sub


    Public Sub New(ByVal username As String)
        InitializeComponent()
        Dim test As String = username
        loadGUIComponents()
    End Sub



    Private Sub loadGUIComponents()
        screens_loadComboBoxes()

        loadMovieDataGrid()
        loadFoodDataGrid()
        loadBookedTicketDataGrid()

        loadComboBox_SelectedDay()
        'Dim movUControl As MoviePreviewUserControl
        'Panel_moviesList. = New ContainerControl()
    End Sub


    Public Function loadFoodDataGrid()
        Dim sqlCmd As String = "Select RTRIM(t1.name) AS 'Item', RTRIM(t1.details) AS 'detail', t1.unit_price, RTRIM(t2.name) AS 'Type', t1.iditem, t2.iditem_type" & _
                                " from [cinema_booking].[dbo].Item as t1 " & _
                                " inner join [cinema_booking].[dbo].ItemType as t2 on t1.iditem_type = t2.iditem_type  " & _
                                " where t1.is_ticket = 0"

        Dim adapter As SqlDataAdapter = New SqlDataAdapter(sqlCmd, con)
        Dim dt As New DataTable

        Try
            con.Open()
            adapter.Fill(dt)
            DataGridView_Items.DataSource = dt
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        con.Close()
    End Function

    Public Function loadMovieDataGrid()
        Dim adapter As SqlDataAdapter = New SqlDataAdapter("Select Movie.idmovie, Movie.title, Movie.length as ""Length [min]"", Movie.rating from Movie INNER JOIN MovieProjection on Movie.idmovie = MovieProjection.idmovie where MovieProjection.start_date < CURRENT_TIMESTAMP AND MovieProjection.end_date > CURRENT_TIMESTAMP", con)
        Dim dt As New DataTable
        Try
            con.Open()
            adapter.Fill(dt)
            DataGridView_movieList.DataSource = dt
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        con.Close()
        'clearField()
    End Function

    Public Function loadBookedTicketDataGrid()
        Dim sqlCmd = "SELECT t2.name ,t2.phone_nr ,t6.title as 'Movie' ,t7.name as 'Room' ,t3.row_char as 'Row',t3.seat_nr as 'Seat',t4.projection_time as 'Time', t1.barcode, t1.price" & _
                    "  FROM [cinema_booking].[dbo].[Ticket] as t1" & _
                    "  INNER JOIN [cinema_booking].[dbo].[Person] AS t2 ON t1.idperson = t2.idperson" & _
                    "  INNER JOIN [cinema_booking].[dbo].Seat AS t3 on t1.idseat = t3.idseat" & _
                    "  INNER JOIN [cinema_booking].[dbo].ProjectionTime as t4 on t1.idmovie_projection = t4.idprojection_time" & _
                    "  INNER JOIN [cinema_booking].[dbo].MovieProjection as t5 on t4.idmovie_projection = t5.idmovie_projection" & _
                    "  INNER JOIN [cinema_booking].[dbo].movie as t6 on t5.idmovie = t6.idmovie" & _
                    "  INNER JOIN [cinema_booking].[dbo].TheatreRoom as t7 on t4.idtheatre_room = t7.idtheatre_room" & _
                    "  where t1.ticket_state = 'B'"

        If (Not String.IsNullOrEmpty(TextBox_nameBooked.Text)) Then
            sqlCmd += "and t2.name LIKE '%" + TextBox_nameBooked.Text + "%'"
        End If

        If (Not String.IsNullOrEmpty(TextBox_phoneBook.Text)) Then
            sqlCmd += "and t2.phone_nr LIKE '%" + TextBox_phoneBook.Text + "%'"
        End If

        If ComboBox_bookedTicketScreen.SelectedIndex > 0 Then
            Dim selItem As IdValueCBoxItem = ComboBox_bookedTicketScreen.SelectedItem
            If selItem IsNot Nothing Then
                sqlCmd = String.Format(" {0} and t4.idtheatre_room = {1} ", sqlCmd, selItem.id)
            End If
        End If


        If (Not String.IsNullOrEmpty(TextBox_movieTitleBook.Text)) Then
            sqlCmd += "and t6.title LIKE '%" + TextBox_movieTitleBook.Text + "%'"
        End If

        Dim adapter As SqlDataAdapter = New SqlDataAdapter(sqlCmd, con)
        Dim dt As New DataTable
        Try
            con.Open()
            adapter.Fill(dt)
            DataGridView_booked_tickets.DataSource = dt
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        con.Close()

    End Function


    Private Sub Button_selectSeat_Click(sender As Object, e As EventArgs)

    End Sub


    Private Sub StaffForm_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'Cinema_bookingDataSet1.Movie' table. You can move, or remove it, as needed.
        'Me.MovieTableAdapter.Fill(Me.Cinema_bookingDataSet1.Movie)

    End Sub

    Private Sub DataGridView_movieList_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView_movieList.CellClick
        Dim i As Integer
        i = DataGridView_movieList.CurrentRow.Index

        Dim movId As Integer = DataGridView_movieList.Item(0, i).Value
        currSlectedMovieId = movId

        loadMovieTimeTable()
    End Sub


    Private Sub DataGridView_booked_tickets_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView_booked_tickets.CellClick
        Dim i As Integer
        i = DataGridView_booked_tickets.CurrentRow.Index

        'do stuff when loading the selected ticket

    End Sub

    Private Sub DataGridView_Items_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView_Items.CellClick
        Dim i As Integer
        i = DataGridView_Items.CurrentRow.Index

        Dim itId As Integer = DataGridView_Items.Item(4, i).Value

    End Sub



    Private Sub screens_loadComboBoxes()
        Dim sqlString As String = "SELECT [idtheatre_room] ,[name] FROM [dbo].[TheatreRoom]"
        Dim id As Integer
        Dim value As String
        Try
            con.Open()
            Dim adapter As SqlDataAdapter = New SqlDataAdapter(sqlString, con)
            Dim dt As New DataTable
            adapter.Fill(dt)
            For Each row In dt.Rows
                id = row("idtheatre_room")
                value = row("name")
                screensList.Add(New IdValueCBoxItem(id, value))
            Next
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        con.Close()

        loadComboBox_screenProjection()
        loadComboBox_screenBook()
    End Sub

    Private Sub loadComboBox_screenProjection()
        Dim id As Integer
        Dim value As String
        ComboBox_screen.Items.Clear()
        ComboBox_screen.Items.Add(New IdValueCBoxItem(0, "All"))
        For Each row In screensList
            id = row.id
            value = row.value
            ComboBox_screen.Items.Add(New IdValueCBoxItem(id, value))
        Next
            ComboBox_screen.SelectedIndex = 0   
    End Sub

    Private Sub loadComboBox_screenBook()
        Dim id As Integer
        Dim value As String
        ComboBox_bookedTicketScreen.Items.Clear()
        ComboBox_bookedTicketScreen.Items.Add(New IdValueCBoxItem(0, "All"))
        For Each row In screensList
            id = row.id
            value = row.value
            ComboBox_bookedTicketScreen.Items.Add(New IdValueCBoxItem(id, value))
        Next
        ComboBox_bookedTicketScreen.SelectedIndex = 0
    End Sub

    Private Sub ShowSelectedProjectionRoomSeats()
        Dim i As Integer
        i = DataGridView_projectionTime.CurrentRow.Index()

        Dim projId As Integer = DataGridView_projectionTime.Item(5, i).Value
        currSlectedProjId = projId

        Dim idprojection_time As Integer = DataGridView_projectionTime.Item(2, i).Value()

        Dim idmovie As Integer = DataGridView_projectionTime.Item(3, i).Value

        Dim idtheatre_room As Integer = DataGridView_projectionTime.Item(4, i).Value

        If Panel_seatSelectionCont.Controls.Count > 0 Then
            Panel_seatSelectionCont.Controls.Clear()
        End If

        Dim elementHost As ElementHost = New ElementHost()
        Dim roomSeatsXaml As SeatSelectionUserControl = New SeatSelectionUserControl(Me, idprojection_time, idmovie, idtheatre_room)
        elementHost.Child = roomSeatsXaml
        elementHost.Dock = DockStyle.Fill
        Panel_seatSelectionCont.AutoScroll = True
        Panel_seatSelectionCont.Controls.Add(elementHost)

        't2.name as 'Room', t1.projection_time ,t1.idprojection_time ,t3.idmovie, t2.idtheatre_room, t1.idprojection_time
    End Sub

    Private Sub loadComboBox_SelectedDay()
        Dim sqlString As String = "SELECT [idmovie_projection] ,[idmovie] ,[description] ,[start_date] ,[end_date] FROM [dbo].[MovieProjection] as t1 "

        If currSlectedMovieId > 0 Then
            sqlString = String.Format(" {0} where t1.[idmovie] = {1} ", sqlString, currSlectedMovieId)
        End If

        Dim endDate As DateTime
        ComboBox_SelectedDay.Items.Clear()
        Try
            If con.State <> ConnectionState.Open Then
                con.Open()
            End If

            Dim adapter As SqlDataAdapter = New SqlDataAdapter(sqlString, con)
            Dim dt As New DataTable
            adapter.Fill(dt)

            DateTime.TryParse(dt.Rows(0)("end_date").ToString(), endDate)

        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

        con.Close()


        Dim mDatediff As Integer = DateDiff(DateInterval.Day, Now, endDate)
        ComboBox_SelectedDay.Items.Add(New DateCBoxItem(Now.AddYears(1), "Any"))
        For i As Integer = 1 To mDatediff
            ComboBox_SelectedDay.Items.Add(New DateCBoxItem(Now.AddDays(i), String.Empty))
        Next
        ComboBox_SelectedDay.SelectedIndex = 0
    End Sub

    Private Sub loadMovieTimeTable()
        Dim sqlString As String = "SELECT t2.name as 'Room', t1.projection_time ,t1.idprojection_time ,t3.idmovie, t2.idtheatre_room, t1.idprojection_time FROM [dbo].[ProjectionTime] as t1 INNER JOIN [dbo].[TheatreRoom] as t2 on t1.idtheatre_room = t2.idtheatre_room INNER JOIN [dbo].[MovieProjection] as t3 on t3.idmovie_projection = t1.idmovie_projection where t1.projection_time > CURRENT_TIMESTAMP  "

        If currSlectedMovieId > 0 Then
            sqlString = String.Format("{0} and t3.idmovie = {1}", sqlString, currSlectedMovieId)
        End If

        If ComboBox_screen.SelectedIndex > 0 Then
            Dim selItem As IdValueCBoxItem = ComboBox_screen.SelectedItem
            If selItem IsNot Nothing Then
                sqlString = String.Format(" {0} and t1.idtheatre_room = {1} ", sqlString, selItem.id)
            End If
        End If

        'and cast(t1.projection_time as date) = cast('2017-03-05' as date)
        If ComboBox_SelectedDay.SelectedIndex > 0 Then
            Dim selItem As DateCBoxItem = ComboBox_SelectedDay.SelectedItem
            If selItem IsNot Nothing Then
                sqlString = String.Format(" {0} and cast(t1.projection_time as date) = cast('{1}' as date) ", sqlString, selItem.mDate)
            End If
        End If

        Try
            'con.Close()
            If con.State <> ConnectionState.Open Then
                con.Open()
            End If


            Dim adapter As SqlDataAdapter = New SqlDataAdapter(sqlString, con)
            Dim dt As New DataTable
            adapter.Fill(dt)
            DataGridView_projectionTime.DataSource = dt
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        con.Close()

    End Sub

    Private Sub genreTBox_TextChanged(sender As Object, e As EventArgs)

    End Sub


    Private Sub DataGridView_projectionTime_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView_projectionTime.CellClick
        ShowSelectedProjectionRoomSeats()
    End Sub

    Private Sub ComboBox_screen_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox_screen.SelectedIndexChanged
        loadMovieTimeTable()
    End Sub

    Private Sub ComboBox_SelectedDay_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox_SelectedDay.SelectedIndexChanged
        loadMovieTimeTable()
    End Sub

    Private Sub ListBox1_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub

    Private Sub TextBox_movieTitleBook_TextChanged(sender As Object, e As EventArgs) Handles TextBox_movieTitleBook.TextChanged
        loadBookedTicketDataGrid()
    End Sub

    Private Sub TextBox_nameBooked_TextChanged(sender As Object, e As EventArgs) Handles TextBox_nameBooked.TextChanged
        loadBookedTicketDataGrid()
    End Sub

    Private Sub ComboBox_bookedTicketScreen_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox_bookedTicketScreen.SelectedIndexChanged
        loadBookedTicketDataGrid()
    End Sub

    Private Sub TextBox_phoneBook_TextChanged(sender As Object, e As EventArgs) Handles TextBox_phoneBook.TextChanged
        loadBookedTicketDataGrid()
    End Sub
End Class

