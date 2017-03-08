Imports System.Data.SqlClient

Public Class LoginForm

    Private Sub BTN_Login_Click(sender As Object, e As EventArgs) Handles BTN_Login.Click
        If String.IsNullOrEmpty(TextBox_Username.Text) Or
            String.IsNullOrEmpty(TextBox_Password.Text) Or
            TextBox_Username.Text.Length < 6 Or
            TextBox_Password.Text.Length < 8 Then
            MessageBox.Show("Username and/or password are too short. Please insert valid fields!", "Authentication Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            clearField()
        Else
            Dim con As New SqlConnection(MyConnection.MyConnectionString)
            Dim salt As String = Utilities.CreateUserPasswordSalt(TextBox_Username.Text)

            Dim hashedPwd As String = Utilities.Hash512(TextBox_Password.Text, salt)
            'RichTextBox1.Text = hashedPwd
            Try
                con.Open()
                Dim da As New SqlDataAdapter("SELECT * from [User] WHERE username ='" & TextBox_Username.Text & "'", con)
                'Dim da As New SqlDataAdapter("SELECT * from [User] WHERE username ='" & TextBox_Username.Text & "' AND password = '" & hashedPwd & "'", con)
                Dim ds As New DataSet
                da.Fill(ds, "User")
                con.Close()
                If (ds.Tables(0).Rows.Count > 0) Then
                    'MessageBox.Show("Login successfully!!")
                    Dim roleChar As String = ds.Tables(0).Rows(0)("role").ToString()
                    Dim pwd As String = ds.Tables(0).Rows(0)("password").ToString().Trim()
                    Dim idperson As String = ds.Tables(0).Rows(0)("idperson").ToString().Trim()
                    SqlUtils.currentLoggedUserID = ds.Tables(0).Rows(0)("iduser")
                    SqlUtils.currentLoggedUserRole = roleChar
                    'Dim iduser As String = ds.Tables(0).Rows(0)("iduser").ToString()
                    Dim pwdOk As Boolean = (hashedPwd.Equals(pwd))

                    Select Case roleChar
                        Case "A"
                            Dim managerForm As New ManagerForm(idperson)
                            managerForm.Text = "Welcome Manager " & TextBox_Username.Text & "!"
                            managerForm.Show()
                        Case "S"
                            Dim staffForm As New StaffForm(idperson)
                            staffForm.Text = "Welcome Seller " & TextBox_Username.Text & "!"
                            staffForm.Show()
                            Me.Hide()
                        Case "U"
                            Dim userForm As New UserForm(idperson)
                            userForm.Text = "Welcome User " & TextBox_Username.Text & "!"
                            userForm.Show()
                    End Select

                    'personRegister.Show()
                Else
                    MessageBox.Show("Username and Password do not match!", "Authentication Failure", MessageBoxButtons.OK, MessageBoxIcon.Exclamation)
                    clearField()
                    con.Close()

                End If
            Catch ex As Exception
                MessageBox.Show(ex.Message, "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                con.Close()
            End Try
        End If
    End Sub

    Private Sub BTN_Cancel_Click(sender As Object, e As EventArgs) Handles BTN_Cancel.Click
        Me.Close()
        'Hide()
    End Sub

    Private Function clearField()
        TextBox_Username.Text = ""
        TextBox_Password.Text = ""
        'Focus on Username field
        TextBox_Username.Focus()
    End Function

End Class
