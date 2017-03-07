Imports System.Data.SqlClient
Imports System.Windows.Forms.Integration

Public Class StaffForm
    Dim moviesList As List(Of MovieRowItem) = New List(Of MovieRowItem)
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
        loadMovieComponents()
    End Sub



    Private Sub loadMovieComponents()
        loadMoviesFromDB()
        loadComboBox_screen()

        'Dim movUControl As MoviePreviewUserControl
        'Panel_moviesList. = New ContainerControl()
    End Sub

    Private Sub loadMoviesFromDB()
        loadMovieDataGrid()
        loadComboBox_SelectedDay()
    End Sub

    Public Function loadMovieDataGrid()
        Try
            con.Open()
            Dim adapter As SqlDataAdapter = New SqlDataAdapter("Select Movie.idmovie, Movie.title, Movie.length as ""Length [min]"", Movie.rating from Movie INNER JOIN MovieProjection on Movie.idmovie = MovieProjection.idmovie where MovieProjection.start_date < CURRENT_TIMESTAMP AND MovieProjection.end_date > CURRENT_TIMESTAMP", con)
            Dim dt As New DataTable
            adapter.Fill(dt)
            DataGridView_movieList.DataSource = dt
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        con.Close()
        'clearField()
    End Function

    Public Sub selectMovieItem(ByVal selectedTitle As String)
        Dim selectedItem As MovieRowItem = moviesList.Find(Function(x) x.title = selectedTitle)

    End Sub

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

        Dim categories As List(Of String) = SqlUtils.getMovieCategories(movId)
        genreTBox.Text = String.Empty

        For Each cat As String In categories
            genreTBox.Text += (cat + "/")
        Next
        If Not String.IsNullOrEmpty(genreTBox.Text) Then
            genreTBox.Text = genreTBox.Text.Substring(0, genreTBox.Text.Length - 1)
        End If

        movieTitleBtt.Text = DataGridView_movieList.Item(1, i).Value.ToString().Trim()

        Dim length As Integer = DataGridView_movieList.Item(2, i).Value

        TextBox_length.Text = String.Format("{0}h {1}m", length / 60, (length Mod 60))

        ProgressBar_rating.Value = DataGridView_movieList.Item(3, i).Value
        loadMovieTimeTable()
    End Sub

    Private Sub loadComboBox_screen()
        Dim sqlString As String = "SELECT [idtheatre_room] ,[name] FROM [dbo].[TheatreRoom]"
        ComboBox_screen.Items.Clear()
        ComboBox_screen.Items.Add(New IdValueCBoxItem(0, "None"))
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
                ComboBox_screen.Items.Add(New IdValueCBoxItem(id, value))
            Next
            ComboBox_screen.SelectedIndex = 0
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        con.Close()

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

    Private Sub genreTBox_TextChanged(sender As Object, e As EventArgs) Handles genreTBox.TextChanged

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