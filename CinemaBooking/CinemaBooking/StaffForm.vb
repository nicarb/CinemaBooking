Imports System.Data.SqlClient

Public Class StaffForm
    Dim moviesList As List(Of MovieRowItem) = New List(Of MovieRowItem)
    Dim con As New SqlConnection(MyConnection.MyConnectionString)

    Public Sub New()
        InitializeComponent()
        Dim test As String = ""
    End Sub


    Public Sub New(ByVal username As String)
        InitializeComponent()
        Dim test As String = username
        loadMovies()
    End Sub

    Private Sub loadMovies()
        loadMoviesFromDB()

        'Dim movUControl As MoviePreviewUserControl
        'Panel_moviesList. = New ContainerControl()
    End Sub

    Private Sub loadMoviesFromDB()
        loadMovieDataGrid()

    End Sub

    Public Function loadMovieDataGrid()
        Try
            con.Open()
            Dim adapter As SqlDataAdapter = New SqlDataAdapter("Select Movie.idmovie, Movie.title, Movie.length as ""Length [min]"", Movie.rating from Movie INNER JOIN MovieProjection on Movie.idmovie = MovieProjection.idmovie where MovieProjection.start_date < CURRENT_TIMESTAMP AND MovieProjection.end_date > CURRENT_TIMESTAMP", con)
            Dim dt As New DataTable
            adapter.Fill(dt)
            DataGridView_movieList.DataSource = dt
            con.Close()
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        'clearField()
    End Function

    Public Sub selectMovieItem(ByVal selectedTitle As String)
        Dim selectedItem As MovieRowItem = moviesList.Find(Function(x) x.title = selectedTitle)

    End Sub

    Private Sub Button_selectSeat_Click(sender As Object, e As EventArgs) Handles Button_selectSeat.Click

    End Sub


    Private Sub StaffForm_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'Cinema_bookingDataSet1.Movie' table. You can move, or remove it, as needed.
        'Me.MovieTableAdapter.Fill(Me.Cinema_bookingDataSet1.Movie)

    End Sub

    Private Sub DataGridView_movieList_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView_movieList.CellClick
        Dim i As Integer
        i = DataGridView_movieList.CurrentRow.Index

        Dim movId As Integer = DataGridView_movieList.Item(0, i).Value

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


    End Sub


    Private Sub genreTBox_TextChanged(sender As Object, e As EventArgs) Handles genreTBox.TextChanged

    End Sub
End Class