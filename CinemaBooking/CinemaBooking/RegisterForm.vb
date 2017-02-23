Imports System.Data.SqlClient
Imports System.Text.RegularExpressions
Imports System.Text
Imports System.Security.Cryptography

Public Class RegisterForm
    Dim con As New SqlConnection(MyConnection.MyConnectionString)
    Private Sub personRegister_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'This line of code loads data into the 'Cinema_bookingDataSet.Person' table. You can move, or remove it, as needed.
        'Me.PersonTableAdapter.Fill(Me.Cinema_bookingDataSet.Person)
        dataGrid()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Insert.Click
        Dim cmd As New SqlCommand
        Dim cmd1 As New SqlCommand
        Try

            'If TextBox1.Text = "" Then
            '    MessageBox.Show("The field is required!", "Required", MessageBoxButtons.OK, MessageBoxIcon.Error)
            '    TextBox1.Focus()
            '    Label1.ForeColor = Color.Red
            'ElseIf TextBox7.Text = "" Then
            '    MessageBox.Show("The field is required!", "Required", MessageBoxButtons.OK, MessageBoxIcon.Error)
            '    TextBox7.Focus()
            '    Label8.ForeColor = Color.Red
            'ElseIf TextBox6.Text = "" Then
            '    MessageBox.Show("The field is required!", "Required", MessageBoxButtons.OK, MessageBoxIcon.Error)
            '    TextBox6.Focus()
            '    Label7.ForeColor = Color.Red

            'Else

            Dim gen As String
            If CheckBox1.Checked Then
                gen = CheckBox1.Text
            ElseIf CheckBox2.Checked Then
                gen = CheckBox2.Text
            Else
                gen = ""
            End If
            Dim s As String
            'Insert data in role
            Dim combo As String
            If ComboBox1.Text = "seller" Then
                combo = "0"
            Else
                combo = "1"
            End If
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO [Person]([name], [surname], [address], [birthdate], [email], [gender]) VALUES ( ' " & TextBox1.Text & " ',' " & TextBox2.Text & " ', ' " & TextBox3.Text & " ', ' " & DateTimePicker1.Text & "', '" & TextBox4.Text & "', '" & gen & "')"
            cmd.ExecuteNonQuery()
            Dim da As New SqlDataAdapter("Select scope_identity()", con)
            Dim ds As New DataSet
            da.Fill(ds, "Person")
            If (ds.Tables(0).Rows.Count > 0) Then
                s = ds.Tables(0).Rows(0).Item(0)
            End If
            'Insert data in table User
            Dim active As String
            If CheckBox3.Checked Then
                active = "1"
            Else
                active = "0"
            End If

            cmd1.Connection = con
            cmd1.CommandText = "INSERT INTO [User]([idperson], [username], [password], [isactive], [role]) VALUES ('" & s & "' ,'" & TextBox6.Text & " ',' " & TextBox7.Text & " ', '" & active & "', '" & combo & "')"
            cmd1.ExecuteNonQuery()
            MsgBox("Succesfully Added!", MsgBoxStyle.Information, "Add")
        Catch ex As Exception
            MessageBox.Show("Failed to connect to Database!", "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        dataGrid()
    End Sub

    

    

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Update.Click
        Dim cmd As New SqlCommand
        Dim cmd1 As New SqlCommand
        Dim gen As String
        If CheckBox1.Checked Then
            gen = CheckBox1.Text
        ElseIf CheckBox2.Checked Then
            gen = CheckBox2.Text
        Else
            gen = ""
        End If
        Try
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "UPDATE [Person] SET [name] = ' " & TextBox1.Text & " ',[surname] = ' " & TextBox2.Text & " ', [address] = ' " & TextBox3.Text & " ' , [birthdate] = '" & DateTimePicker1.Text & "', [gender] = '" & gen & "' where idperson = ' " & TextBox5.Text & " ' "
            cmd.ExecuteNonQuery()
            Dim combo As String
            If ComboBox1.Text = "seller" Then
                combo = "0"
            Else
                combo = "1"
            End If
            Dim active As String
            If CheckBox3.Checked Then
                active = "1"
            Else
                active = "0"
            End If
            cmd1.Connection = con
            cmd1.CommandText = "UPDATE [User] SET [username] = ' " & TextBox6.Text & " ',[password] = ' " & TextBox7.Text & " ', [isactive] = ' " & active & " ' , [role] = '" & combo & "' where idperson = ' " & TextBox5.Text & " ' and iduser = '" & TextBox9.Text & "' "
            cmd1.ExecuteNonQuery()
            MsgBox("Succesfully Update!", MsgBoxStyle.Information, "Update")
        Catch ex As Exception
            MessageBox.Show("Failed to connect to Database!", "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        dataGrid()
    End Sub

    Private Sub Delete_Click(sender As Object, e As EventArgs) Handles Delete.Click
        Dim cmd As New SqlCommand
        Dim cmd1 As New SqlCommand
        Try
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "DELETE [User] where idperson = ' " & TextBox5.Text & " ' "
            cmd1.Connection = con
            cmd1.CommandText = "DELETE [Person] where idperson = ' " & TextBox5.Text & " ' "
            If MessageBox.Show("Are you sure you want to delete this Person?", "Delete", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                cmd.ExecuteNonQuery()
                cmd1.ExecuteNonQuery()
                MsgBox("Succesfully Delete!", MsgBoxStyle.Information, "Delete")
            Else
                MsgBox("The Person was not cancelled!")
            End If
        Catch ex As Exception
            MessageBox.Show("Failed to connect to Database!", "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        dataGrid()
    End Sub

    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Dim i As Integer
        i = DataGridView1.CurrentRow.Index
        TextBox5.Text = DataGridView1.Item(0, i).Value.ToString
        TextBox1.Text = DataGridView1.Item(1, i).Value.ToString
        TextBox2.Text = DataGridView1.Item(2, i).Value.ToString
        TextBox3.Text = DataGridView1.Item(5, i).Value.ToString
        TextBox4.Text = DataGridView1.Item(6, i).Value.ToString

        If DataGridView1.Item(3, i).Value.ToString <> "" Then
            DateTimePicker1.Text = DataGridView1.Item(3, i).Value.ToString
        Else
            DateTimePicker1.CustomFormat = " "
            DateTimePicker1.Format = DateTimePickerFormat.Custom
        End If

        TextBox6.Text = DataGridView1.Item(7, i).Value.ToString
        TextBox7.Text = DataGridView1.Item(8, i).Value.ToString
        TextBox9.Text = DataGridView1.Item(11, i).Value.ToString

        If DataGridView1.Item(9, i).Value.ToString = 1 Then
            CheckBox3.Checked = True
        Else
            CheckBox3.Checked = False
        End If

        If DataGridView1.Item(10, i).Value.ToString = 0 Then
            ComboBox1.Text = "seller"
        Else
            ComboBox1.Text = "manager"
        End If

        'ComboBox1.Text = ""

        If DataGridView1.Item(4, i).Value.ToString = "F" Then
            CheckBox1.Checked = True
            CheckBox2.Checked = False
        ElseIf DataGridView1.Item(4, i).Value.ToString = "M" Then
            CheckBox2.Checked = True
            CheckBox1.Checked = False
        Else
            CheckBox1.Checked = False
            CheckBox2.Checked = False
        End If
    End Sub

    Private Sub clearField()
        'Clear the fields
        TextBox1.Clear()
        TextBox2.Clear()
        TextBox3.Clear()
        TextBox4.Clear()
        DateTimePicker1.CustomFormat = " "
        DateTimePicker1.Format = DateTimePickerFormat.Custom
        TextBox6.Clear()
        TextBox7.Clear()
        TextBox8.Clear()
        CheckBox3.Checked = False
        ComboBox1.Text = ""
        If CheckBox1.Checked Then
            CheckBox1.Checked = False
        ElseIf CheckBox2.Checked Then
            CheckBox2.Checked = False
        End If

    End Sub

    'Visualize data
    Private Sub DateTimePicker1_ValueChanged(sender As Object, e As EventArgs) Handles DateTimePicker1.ValueChanged
        DateTimePicker1.Format = DateTimePickerFormat.Short
        'DateTimePicker1.CustomFormat = "dd/MM/yyyy"
    End Sub

    Private Sub DateTimePicker1_VisibleChanged(sender As Object, e As EventArgs) Handles DateTimePicker1.VisibleChanged
        DateTimePicker1.CustomFormat = " "
        DateTimePicker1.Format = DateTimePickerFormat.Custom
    End Sub

    Private Sub TextBox4_Validated(sender As Object, e As EventArgs) Handles TextBox4.Validated
        If EmailAddressCheck(TextBox4.Text) = False Then
            MessageBox.Show("The email address you entered is not valid!", "Incorrect Email Entry", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBox4.Text = ""
            TextBox4.Focus()
            Label6.ForeColor = Color.Red
        End If
    End Sub

    Private Sub TextBox7_Validated(sender As Object, e As EventArgs) Handles TextBox7.Validated
        If passwordMatchControll(TextBox7.Text) = False Then
            MessageBox.Show("Password must be 6 characters long and contain 1 letter and 1 number!", "Incorrect Password Entry", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBox7.Text = ""
            TextBox7.Focus()
            Label8.ForeColor = Color.Red
        End If
    End Sub

    Function EmailAddressCheck(ByVal emailAddress As String) As Boolean
        Dim pattern As String = "^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
        Dim emailAddressMatch As Match = Regex.Match(emailAddress, pattern)
        If emailAddressMatch.Success Then
            EmailAddressCheck = True
        Else
            EmailAddressCheck = False
        End If
    End Function

    Function passwordMatchControll(ByVal password As String) As Boolean
        ' This function confirms the password is valid.

        'Minimum 6 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet And 1 Number
        'Dim pattern As String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"
        Dim pattern As String = "^[A-Z]{4,}$"
        Dim passwordMatch As Match = Regex.Match(password, pattern)
        If passwordMatch.Success And password <> " " Then
            passwordMatchControll = True
        Else
            passwordMatchControll = False
        End If
    End Function

    Public Function dataGrid()
        '        Dim adapter As SqlDataAdapter = New SqlDataAdapter("SELECT  Person.idperson ,Person.name, Person.surname, Person.birthdate, Person.gender, Person.address, Person.email, [User].username, [User].password, [User].isactive,  [User].role, [User].iduser
        'FROM   Person INNER JOIN [User] ON Person.idperson = [User].idperson", con)
        '        Dim dt As New DataTable
        '        adapter.Fill(dt)
        '        DataGridView1.DataSource = dt
        '
        '        con.Close()
        '        clearField()
    End Function
End Class