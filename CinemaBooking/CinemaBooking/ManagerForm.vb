Imports System.Data.SqlClient
Imports System.IO
Imports System.Text.RegularExpressions

Public Class ManagerForm
    Dim idpers As String = ""
    Dim con As New SqlConnection(MyConnection.MyConnectionString)
    Public Sub New()
        Dim test As String = ""
    End Sub

    Public Sub New(ByVal idperson As String)
        InitializeComponent()
        idpers = idperson
    End Sub

    Private Sub ManagerForm_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        dataGrid()

        Try
            con.Open()
            'Load User Data
            Dim da As New SqlDataAdapter("SELECT Person.idperson ,Person.name, Person.surname, Person.birthdate, Person.gender, Person.address, Person.email, [User].username, [User].password, [User].isactive,  [User].role, [User].iduser From Person INNER Join [User] On Person.idperson = [User].idperson And Person.idperson= '" & idpers & "' ", con)
            Dim ds As New DataSet
            da.Fill(ds, "Person")
            If (ds.Tables(0).Rows.Count > 0) Then
                TextBox1.Text = ds.Tables(0).Rows(0)("name").ToString().Trim()
                TextBox2.Text = ds.Tables(0).Rows(0)("surname").ToString().Trim()
                DateTimePicker1.Text = ds.Tables(0).Rows(0)("birthdate").ToString().Trim()
                TextBox3.Text = ds.Tables(0).Rows(0)("address").ToString().Trim()
                TextBox4.Text = ds.Tables(0).Rows(0)("email").ToString().Trim()
                If ds.Tables(0).Rows(0)("gender").ToString() = "F" Then
                    CheckBox1.Checked = True
                    CheckBox2.Checked = False
                ElseIf ds.Tables(0).Rows(0)("gender").ToString() = "M" Then
                    CheckBox2.Checked = True
                    CheckBox1.Checked = False
                Else
                    CheckBox1.Checked = False
                    CheckBox2.Checked = False
                End If

                TextBox6.Text = ds.Tables(0).Rows(0)("username").ToString().Trim()
                'TextBox7.Text = ds.Tables(0).Rows(0)("password").ToString().Trim()
                If ds.Tables(0).Rows(0)("role").ToString().Trim() = "A" Then
                    ComboBox1.Text = "Seller"
                ElseIf ds.Tables(0).Rows(0)("role").ToString().Trim() = "S" Then
                    ComboBox1.Text = "Manager"
                Else
                    ComboBox1.Text = ""
                End If
                If ds.Tables(0).Rows(0)("isactive").ToString().Trim() = "True" Then
                    CheckBox3.Checked = True
                Else
                    CheckBox3.Checked = False
                End If
            End If

            'Populate Language combobox
            Dim command As New SqlCommand("SELECT * FROM [dbo].[Language] where isMovieLanguage = 'T'", con)
            Dim adapter As New SqlDataAdapter(command)
            Dim table As New DataTable()
            adapter.Fill(table)
            ComboLanguage.DataSource = table
            ComboLanguage.DisplayMember = "name"
            ComboLanguage.ValueMember = "idlanguage"

            'Populate Category in checkBoxList
            Dim comma As New SqlCommand("Select * From [cinema_booking].[dbo].[Category]", con)
            Dim adapr As New SqlDataAdapter(comma)
            Dim t As New DataTable()
            adapr.Fill(t)
            CheckedListBox1.DataSource = t
            CheckedListBox1.DisplayMember = "name"
            CheckedListBox1.ValueMember = "idcategory"
            con.Close()
        Catch ex As Exception
            MessageBox.Show("Failed to connect to Database!", "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        dataGridFilm()
    End Sub

    'Insert User
    Private Sub Insert_Click(sender As Object, e As EventArgs) Handles Insert.Click
        Dim cmd As New SqlCommand
        Dim cmd1 As New SqlCommand

        If String.IsNullOrEmpty(TextBox12.Text) Or TextBox12.Text.Length < 3 Then
            MessageBox.Show("The field is Name required!", "Required", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBox12.Focus()
        ElseIf String.IsNullOrEmpty(TextBox16.Text) Then
            MessageBox.Show("Username is too short. Please insert valid fields!", "Authentication Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        ElseIf passwordMatchControll(TextBox15.Text) = False Then
            MessageBox.Show("Password is required! Password must be 6 characters long and contain 1 letter and 1 number!", "Incorrect Password Entry", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBox7.Text = ""
            TextBox7.Focus()
            'Label8.ForeColor = Color.Red

        Else
            Dim gen As String
            If CheckBox5.Checked Then
                gen = CheckBox5.Text
            ElseIf CheckBox4.Checked Then
                gen = CheckBox4.Text
            Else
                gen = ""
            End If
            Dim s As String
            'Insert data in role
            Dim combo As String
            If ComboBox2.Text = "Seller" Then
                combo = "S"
            ElseIf ComboBox2.Text = "Manager" Then
                combo = "A"
            Else
                combo = ""
            End If
            Try
                con.Open()
                cmd.Connection = con
                cmd.CommandText = "INSERT INTO [Person]([name], [surname], [address], [birthdate], [email], [gender]) VALUES ( ' " & TextBox12.Text & " ',' " & TextBox11.Text & " ', ' " & TextBox10.Text & " ', ' " & DateTimePicker2.Text & "', '" & TextBox9.Text & "', '" & gen & "')"
                cmd.ExecuteNonQuery()
                Dim da As New SqlDataAdapter("Select scope_identity()", con)
                Dim ds As New DataSet
                da.Fill(ds, "Person")
                If (ds.Tables(0).Rows.Count > 0) Then
                    s = ds.Tables(0).Rows(0).Item(0)
                End If
                'Insert data in table User
                Dim active As String
                If CheckBox6.Checked Then
                    active = "True"
                Else
                    active = "False"
                End If
                Dim salt As String = Utilities.CreateUserPasswordSalt(TextBox16.Text)
                Dim hashedPwd As String = Utilities.Hash512(TextBox15.Text, salt)

                cmd1.Connection = con
                cmd1.CommandText = "INSERT INTO [User]([idperson], [username], [password], [isactive], [role]) VALUES ('" & s & "' ,'" & TextBox16.Text & " ',' " & hashedPwd & " ', '" & active & "', '" & combo & "')"
                cmd1.ExecuteNonQuery()
                MsgBox("Succesfully Added!", MsgBoxStyle.Information, "Add")
            Catch ex As Exception
                MessageBox.Show("Failed to connect to Database!", "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
            dataGrid()
        End If
    End Sub

    'Update User
    Private Sub Upda_Click(sender As Object, e As EventArgs) Handles Upda.Click
        Dim cmd As New SqlCommand
        Dim cmd1 As New SqlCommand
        Dim gen As String
        If CheckBox5.Checked Then
            gen = CheckBox5.Text
        ElseIf CheckBox4.Checked Then
            gen = CheckBox4.Text
        Else
            gen = ""
        End If
        Try
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "UPDATE [Person] SET [name] = ' " & TextBox12.Text & " ',[surname] = ' " & TextBox11.Text & " ', [address] = ' " & TextBox10.Text & " ' , [birthdate] = '" & DateTimePicker2.Text & "', [gender] = '" & gen & "' where idperson = ' " & TextBox5.Text & " ' "
            cmd.ExecuteNonQuery()
            Dim combo As String
            If ComboBox2.Text = "Seller" Then
                combo = "S"
            ElseIf ComboBox2.Text = "Manager" Then
                combo = "A"
            Else
                combo = ""
            End If
            Dim active As String
            If CheckBox3.Checked Then
                active = "True"
            Else
                active = "False"
            End If
            cmd1.Connection = con
            cmd1.CommandText = "UPDATE [User] SET [username] = ' " & TextBox16.Text & "',[password] = '" & TextBox15.Text & "', [isactive] = '" & active & "', [role] = '" & combo & "' where [idperson] = ' " & TextBox5.Text & " ' and [iduser] = '" & TextBox13.Text & "' "
            cmd1.ExecuteNonQuery()
            MsgBox("Succesfully Update!", MsgBoxStyle.Information, "Update")
        Catch ex As Exception
            MessageBox.Show("Failed to connect to Database!", "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        dataGrid()
    End Sub

    'DataGrid User
    Private Function dataGrid()
        Dim adapter As SqlDataAdapter = New SqlDataAdapter("SELECT  Person.idperson ,Person.name, Person.surname, Person.birthdate, Person.gender, Person.address, Person.email, [User].username, [User].password, [User].isactive,  [User].role, [User].iduser FROM   Person INNER JOIN [User] ON Person.idperson = [User].idperson AND Person.idperson <> '" & idpers & "'", con)
        Dim dt As New DataTable
        adapter.Fill(dt)
        DataGridView1.DataSource = dt
        con.Close()
        clearField()
    End Function


    Private Sub DataGridView1_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellClick
        Dim i As Integer
        i = DataGridView1.CurrentRow.Index
        TextBox5.Text = DataGridView1.Item(0, i).Value.ToString.Trim()
        TextBox12.Text = DataGridView1.Item(1, i).Value.ToString.Trim()
        TextBox11.Text = DataGridView1.Item(2, i).Value.ToString.Trim()
        TextBox10.Text = DataGridView1.Item(5, i).Value.ToString.Trim()
        TextBox9.Text = DataGridView1.Item(6, i).Value.ToString
        TextBox13.Text = DataGridView1.Item(11, i).Value.ToString
        If DataGridView1.Item(3, i).Value.ToString <> "" Then
            DateTimePicker2.Text = DataGridView1.Item(3, i).Value.ToString
        Else
            DateTimePicker2.CustomFormat = " "
            DateTimePicker2.Format = DateTimePickerFormat.Custom
        End If

        TextBox16.Text = DataGridView1.Item(7, i).Value.ToString.Trim()
        TextBox15.Text = DataGridView1.Item(8, i).Value.ToString
        'TextBox9.Text = DataGridView1.Item(11, i).Value.ToString

        If DataGridView1.Item(9, i).Value.ToString = "True" Then
            CheckBox6.Checked = True
        Else
            CheckBox6.Checked = False
        End If

        If DataGridView1.Item(10, i).Value.ToString = "S" Then
            ComboBox2.Text = "seller"
        ElseIf DataGridView1.Item(10, i).Value.ToString = "A" Then
            ComboBox2.Text = "manager"
        Else
            ComboBox2.Text = ""
        End If

        'ComboBox1.Text = ""

        If DataGridView1.Item(4, i).Value.ToString = "F" Then
            CheckBox5.Checked = True
            CheckBox4.Checked = False
        ElseIf DataGridView1.Item(4, i).Value.ToString = "M" Then
            CheckBox4.Checked = True
            CheckBox5.Checked = False
        Else
            CheckBox4.Checked = False
            CheckBox5.Checked = False
        End If
    End Sub

    'Visualize data
    Private Sub DateTimePicker2_ValueChanged(sender As Object, e As EventArgs) Handles DateTimePicker2.ValueChanged
        DateTimePicker2.Format = DateTimePickerFormat.Short
        'DateTimePicker1.CustomFormat = "dd/MM/yyyy"
    End Sub
    Private Sub DateTimePicker2_VisibleChanged(sender As Object, e As EventArgs) Handles DateTimePicker2.VisibleChanged
        DateTimePicker2.CustomFormat = " "
        DateTimePicker2.Format = DateTimePickerFormat.Custom
    End Sub

    'ClearFieldUser
    Private Sub clearField()
        'Clear the fields
        TextBox12.Clear()
        TextBox11.Clear()
        TextBox10.Clear()
        TextBox9.Clear()
        DateTimePicker2.CustomFormat = " "
        DateTimePicker2.Format = DateTimePickerFormat.Custom
        TextBox16.Clear()
        TextBox15.Clear()
        TextBox14.Clear()
        CheckBox6.Checked = False
        ComboBox2.Text = ""
        If CheckBox5.Checked Then
            CheckBox5.Checked = False
        ElseIf CheckBox4.Checked Then
            CheckBox4.Checked = False
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        clearField()
    End Sub

    'Delete User
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

    Private Sub TextBox4_Validated(sender As Object, e As EventArgs) Handles TextBox4.Validated
        If EmailAddressCheck(TextBox4.Text) = False Then
            MessageBox.Show("The email address you entered is not valid!", "Incorrect Email Entry", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBox4.Text = ""
            TextBox4.Focus()
            'Label6.ForeColor = Color.Red
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
        'Minimum 6 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet And 1 Number
        Dim pattern As String = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"
        'Dim pattern As String = "^[A-Z]{4,}$"
        Dim passwordMatch As Match = Regex.Match(password, pattern)
        If passwordMatch.Success And password <> " " Then
            passwordMatchControll = True
        Else
            passwordMatchControll = False
        End If
    End Function





    'Film Sector

    Private Sub AddFilm_Click(sender As Object, e As EventArgs) Handles AddFilm.Click
        Dim cmd As New SqlCommand
        Dim cmd1 As New SqlCommand
        If String.IsNullOrEmpty(title.Text) Or title.Text.Length < 3 Then
            MessageBox.Show("The field is Name required!", "Required", MessageBoxButtons.OK, MessageBoxIcon.Error)
            TextBox12.Focus()
        End If
        Dim selLanguage As Integer = Convert.ToInt32(ComboLanguage.SelectedValue)

        Try
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "INSERT INTO [Movie]([title],[plot],[length], [cover], [release_year],[idlanguage],[rating]) VALUES ( '" & title.Text & "','" & Plot.Text & "','" & Length.Value & "',@photo, '" & DateFilm.Text & "','" & selLanguage & "','" & Rating.Value & "' )"
            Dim ms As New MemoryStream()
            '## N.A.
            PictureBox1.BackgroundImage.Save(ms, PictureBox1.BackgroundImage.RawFormat)
            Dim data As Byte() = ms.GetBuffer()
            Dim p As New SqlParameter("@photo", SqlDbType.Image)
            p.Value = data
            cmd.Parameters.Add(p)
            cmd.ExecuteNonQuery()
            MsgBox("Succesfully Added Film!", MsgBoxStyle.Information, "Add")
        Catch ex As Exception
            MessageBox.Show("Failed to connect to Database!", "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        dataGridFilm()
    End Sub

    Private Sub UpdatFilm_Click(sender As Object, e As EventArgs) Handles UpdatFilm.Click
        Dim cmd As New SqlCommand
        Try
            Dim selLanguage As Integer = Convert.ToInt32(ComboLanguage.SelectedValue)
            '## N.A.
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "UPDATE [Movie] SET [title] = ' " & title.Text & " ',[plot] = ' " & Plot.Text & " ', [length] = ' " & Length.Value & " ' , [release_year] = '" & DateFilm.Text & "', [rating] = '" & Rating.Value & "', [idLanguage]= '" & selLanguage & "' where [idmovie] = ' " & id.Text & " ' "
            cmd.ExecuteNonQuery()
            MsgBox("Succesfully Update!", MsgBoxStyle.Information, "Update")
        Catch ex As Exception
            MessageBox.Show("Failed to connect to Database!", "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        dataGridFilm()
    End Sub

    Private Sub DeleteFilm_Click(sender As Object, e As EventArgs) Handles DeleteFilm.Click
        Dim cmd As New SqlCommand
        Try
            con.Open()
            cmd.Connection = con
            cmd.CommandText = "DELETE [Movie] where idmovie = ' " & id.Text & " ' "
            If MessageBox.Show("Are you sure you want to delete this Movie?", "Delete", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                cmd.ExecuteNonQuery()
                MsgBox("Succesfully Delete!", MsgBoxStyle.Information, "Delete")
            Else
                MsgBox("The Movie was not cancelled!")
            End If
        Catch ex As Exception
            MessageBox.Show("Failed to connect to Database!", "Database Connection Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
        dataGridFilm()
    End Sub

    Private Function dataGridFilm()
        Dim adapter As SqlDataAdapter = New SqlDataAdapter("Select Movie.idmovie, Movie.title,Movie.plot, Movie.length, Movie.release_year,Movie.rating, Movie.cover,[Language].name From Movie Inner Join [Language] ON Movie.idlanguage = [Language].idlanguage", con)
        Dim dt As New DataTable
        adapter.Fill(dt)
        FilmDataGrid.DataSource = dt
        con.Close()
        clearFieldFilm()
    End Function

    Private Sub But_Upload_Click(sender As Object, e As EventArgs) Handles But_Upload.Click
        Dim opf As New OpenFileDialog
        opf.Filter = "Choose Image (*.jpg; *.png; *gif)| *.jpg; *.png; *.gif"
        If opf.ShowDialog = DialogResult.OK Then
            PictureBox1.BackgroundImage = Image.FromFile(opf.FileName)
        End If
    End Sub

    Private Sub ClearFilm_Click(sender As Object, e As EventArgs) Handles ClearFilm.Click
        clearFieldFilm()
    End Sub

    Private Function clearFieldFilm()
        title.Clear()
        Plot.Clear()
        Length.ResetText()
        DateFilm.CustomFormat = " "
        DateFilm.Format = DateTimePickerFormat.Custom
        ComboLanguage.SelectedIndex = -1
        Rating.ResetText()
        Dim i As Integer
        For i = 0 To (CheckedListBox1.Items.Count - 1) 'Listbox is the listbox's name
            CheckedListBox1.SetItemChecked(i, False)
        Next
        PictureBox1.BackgroundImage = Nothing
    End Function

    Private Sub DateFilm_ValueChanged(sender As Object, e As EventArgs) Handles DateFilm.ValueChanged
        DateFilm.Format = DateTimePickerFormat.Short
    End Sub
    Private Sub DateFilm_VisibleChanged(sender As Object, e As EventArgs) Handles DateFilm.VisibleChanged
        DateFilm.CustomFormat = " "
        DateFilm.Format = DateTimePickerFormat.Custom
    End Sub

    Private Sub FilmDataGrid_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles FilmDataGrid.CellClick
        Dim i As Integer
        i = FilmDataGrid.CurrentRow.Index
        id.Text = FilmDataGrid.Item(0, i).Value.ToString.Trim()
        Dim idFilm As String = FilmDataGrid.Item(0, i).Value.ToString.Trim()
        title.Text = FilmDataGrid.Item(1, i).Value.ToString.Trim()
        Plot.Text = FilmDataGrid.Item(2, i).Value.ToString.Trim()
        Length.Value = FilmDataGrid.Item(3, i).Value
        If FilmDataGrid.Item(4, i).Value.ToString <> "" Then
            DateFilm.Text = FilmDataGrid.Item(4, i).Value.ToString
        Else
            DateFilm.CustomFormat = " "
            DateFilm.Format = DateTimePickerFormat.Custom
        End If
        Rating.Value = FilmDataGrid.Item(5, i).Value
        ComboLanguage.Text = FilmDataGrid.Item(7, i).Value.ToString
        '## N.A.

        ''PictureBox1.BackgroundImage = FilmDataGrid.Item(6, i).Value
        'Dim myImageBytes = DirectCast(DirectCast(FilmDataGrid.Item(6, i), DataGridViewImageCell).Value, Byte())
        'Using myMemoryStream As New IO.MemoryStream
        '    PictureBox1.BackgroundImage = Image.FromStream(myMemoryStream)
        'End Using

        'Dim cmd As SqlCommand
        'con.Open()
        'cmd = New SqlCommand("SELECT [cover] FROM [cinema_booking].[dbo].[Movie] where idmovie = '" & idFilm & " '", con)
        'Dim imagedata As Object
        'imagedata = cmd.ExecuteScalar()
        'If IsNothing(imagedata) Or IsDBNull(imagedata) Then
        '    PictureBox1.Visible = False
        'Else
        '    Using ms As New MemoryStream(imagedata, 0, imagedata.Length)
        '        ms.Write(imagedata, 0, imagedata.Length)
        '        PictureBox1.BackgroundImage = Image.FromStream(ms, True)
        '    End Using
        'End If
        'con.Close()
    End Sub
End Class