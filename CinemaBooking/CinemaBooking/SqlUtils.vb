Imports System.Data.SqlClient

Public Class SqlUtils
    Public Shared currentLoggedUserID As Integer
    Public Shared currentLoggedUserRole As Char

    Public Shared Function getMovieCategories(ByRef con As SqlConnection, ByVal idmovie As Integer) As List(Of String)
        Dim moviesList As List(Of String) = New List(Of String)

        Try
            con.Open()
            Dim catName As String = String.Empty
            Dim adapter As SqlDataAdapter = New SqlDataAdapter("SELECT * FROM MovieCategory Inner join Category on MovieCategory.idcategory = Category.idcategory where idmovie = " + idmovie.ToString() + "", con)
            Dim dt As New DataTable
            adapter.Fill(dt)

            For Each row As DataRow In dt.Rows
                catName = row("name").ToString()
                moviesList.Add(catName)
            Next row

            con.Close()
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

        Return moviesList
    End Function

    Public Shared Function getMovieCategories(ByVal idmovie As Integer) As List(Of String)
        Dim con As New SqlConnection(MyConnection.MyConnectionString)
        Dim moviesList As List(Of String) = New List(Of String)

        Try
            con.Open()
            Dim catName As String = String.Empty
            Dim adapter As SqlDataAdapter = New SqlDataAdapter("SELECT * FROM MovieCategory Inner join Category on MovieCategory.idcategory = Category.idcategory where idmovie = " + idmovie.ToString(), con)
            Dim dt As New DataTable
            adapter.Fill(dt)
            For Each row As DataRow In dt.Rows
                catName = row("name").ToString()
                moviesList.Add(catName)
            Next row

            con.Close()
        Catch ex As Exception
            MessageBox.Show("Connection error" + ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

        Return moviesList
    End Function
End Class
