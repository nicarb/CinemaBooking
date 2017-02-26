Imports System.Data.SqlClient

Public Class MoviePreviewUserControl
    Public title As String = String.Empty

    Public Sub New()

    End Sub

    Public Sub New(ByVal idmovie As Integer)
        'Dim con As New SqlConnection(MyConnection.MyConnectionString)
        'con.Open()
        'Dim da As New SqlDataAdapter("SELECT * from [movie] WHERE username ='" & TextBox_Username.Text & "'", con)
        'Dim da As New SqlDataAdapter("SELECT * from [User] WHERE username ='" & TextBox_Username.Text & "' AND password = '" & hashedPwd & "'", con)
        'Dim ds As New DataSet
        'da.Fill(ds, "User")
        'If (ds.Tables(0).Rows.Count > 0) Then
        '
        'End If

    End Sub

    Private Sub Button_Select_Click(sender As Object, e As EventArgs) Handles Button_Select.Click

    End Sub
End Class
