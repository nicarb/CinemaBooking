<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class StaffForm
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.movieGBox = New System.Windows.Forms.GroupBox()
        Me.TextBox3 = New System.Windows.Forms.TextBox()
        Me.lengthLbl = New System.Windows.Forms.Label()
        Me.genreTBox = New System.Windows.Forms.TextBox()
        Me.genreLbl = New System.Windows.Forms.Label()
        Me.startsNamesLBox = New System.Windows.Forms.ListBox()
        Me.starsLbl = New System.Windows.Forms.Label()
        Me.writerNameTBox = New System.Windows.Forms.TextBox()
        Me.writerLbl = New System.Windows.Forms.Label()
        Me.directorNameTBox = New System.Windows.Forms.TextBox()
        Me.directorLbl = New System.Windows.Forms.Label()
        Me.RichTextBox1 = New System.Windows.Forms.RichTextBox()
        Me.plotSummaryLbl = New System.Windows.Forms.Label()
        Me.ComboBox1 = New System.Windows.Forms.ComboBox()
        Me.movieTitleBtt = New System.Windows.Forms.Label()
        Me.TabControl_items = New System.Windows.Forms.TabControl()
        Me.TabPage_movies = New System.Windows.Forms.TabPage()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.Cinema_bookingDataSet1 = New CinemaBooking.cinema_bookingDataSet()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.ListView_movieItems = New System.Windows.Forms.ListView()
        Me.ListView_foodItems = New System.Windows.Forms.ListView()
        Me.CheckedListBox1 = New System.Windows.Forms.CheckedListBox()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.Button_checkOut = New System.Windows.Forms.Button()
        Me.Button_clearAll = New System.Windows.Forms.Button()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.movieGBox.SuspendLayout()
        Me.TabControl_items.SuspendLayout()
        Me.TabPage_movies.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        CType(Me.Cinema_bookingDataSet1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'movieGBox
        '
        Me.movieGBox.Controls.Add(Me.TextBox3)
        Me.movieGBox.Controls.Add(Me.lengthLbl)
        Me.movieGBox.Controls.Add(Me.genreTBox)
        Me.movieGBox.Controls.Add(Me.genreLbl)
        Me.movieGBox.Controls.Add(Me.startsNamesLBox)
        Me.movieGBox.Controls.Add(Me.starsLbl)
        Me.movieGBox.Controls.Add(Me.writerNameTBox)
        Me.movieGBox.Controls.Add(Me.writerLbl)
        Me.movieGBox.Controls.Add(Me.directorNameTBox)
        Me.movieGBox.Controls.Add(Me.directorLbl)
        Me.movieGBox.Controls.Add(Me.RichTextBox1)
        Me.movieGBox.Controls.Add(Me.plotSummaryLbl)
        Me.movieGBox.Controls.Add(Me.ComboBox1)
        Me.movieGBox.Controls.Add(Me.movieTitleBtt)
        Me.movieGBox.Enabled = False
        Me.movieGBox.Location = New System.Drawing.Point(12, 12)
        Me.movieGBox.Name = "movieGBox"
        Me.movieGBox.Size = New System.Drawing.Size(352, 316)
        Me.movieGBox.TabIndex = 1
        Me.movieGBox.TabStop = False
        Me.movieGBox.Text = "Movie Info"
        '
        'TextBox3
        '
        Me.TextBox3.Location = New System.Drawing.Point(15, 124)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(150, 20)
        Me.TextBox3.TabIndex = 17
        '
        'lengthLbl
        '
        Me.lengthLbl.AutoSize = True
        Me.lengthLbl.Location = New System.Drawing.Point(10, 108)
        Me.lengthLbl.Name = "lengthLbl"
        Me.lengthLbl.Size = New System.Drawing.Size(40, 13)
        Me.lengthLbl.TabIndex = 16
        Me.lengthLbl.Text = "Length"
        '
        'genreTBox
        '
        Me.genreTBox.Location = New System.Drawing.Point(15, 81)
        Me.genreTBox.Name = "genreTBox"
        Me.genreTBox.Size = New System.Drawing.Size(150, 20)
        Me.genreTBox.TabIndex = 15
        '
        'genreLbl
        '
        Me.genreLbl.AutoSize = True
        Me.genreLbl.Location = New System.Drawing.Point(10, 64)
        Me.genreLbl.Name = "genreLbl"
        Me.genreLbl.Size = New System.Drawing.Size(36, 13)
        Me.genreLbl.TabIndex = 14
        Me.genreLbl.Text = "Genre"
        '
        'startsNamesLBox
        '
        Me.startsNamesLBox.FormattingEnabled = True
        Me.startsNamesLBox.Location = New System.Drawing.Point(194, 80)
        Me.startsNamesLBox.Name = "startsNamesLBox"
        Me.startsNamesLBox.Size = New System.Drawing.Size(150, 69)
        Me.startsNamesLBox.TabIndex = 10
        '
        'starsLbl
        '
        Me.starsLbl.AutoSize = True
        Me.starsLbl.Location = New System.Drawing.Point(184, 64)
        Me.starsLbl.Name = "starsLbl"
        Me.starsLbl.Size = New System.Drawing.Size(31, 13)
        Me.starsLbl.TabIndex = 9
        Me.starsLbl.Text = "Stars"
        '
        'writerNameTBox
        '
        Me.writerNameTBox.Location = New System.Drawing.Point(194, 171)
        Me.writerNameTBox.Name = "writerNameTBox"
        Me.writerNameTBox.Size = New System.Drawing.Size(150, 20)
        Me.writerNameTBox.TabIndex = 8
        '
        'writerLbl
        '
        Me.writerLbl.AutoSize = True
        Me.writerLbl.Location = New System.Drawing.Point(184, 155)
        Me.writerLbl.Name = "writerLbl"
        Me.writerLbl.Size = New System.Drawing.Size(35, 13)
        Me.writerLbl.TabIndex = 7
        Me.writerLbl.Text = "Writer"
        '
        'directorNameTBox
        '
        Me.directorNameTBox.Location = New System.Drawing.Point(13, 171)
        Me.directorNameTBox.Name = "directorNameTBox"
        Me.directorNameTBox.Size = New System.Drawing.Size(151, 20)
        Me.directorNameTBox.TabIndex = 6
        '
        'directorLbl
        '
        Me.directorLbl.AutoSize = True
        Me.directorLbl.Location = New System.Drawing.Point(7, 155)
        Me.directorLbl.Name = "directorLbl"
        Me.directorLbl.Size = New System.Drawing.Size(44, 13)
        Me.directorLbl.TabIndex = 5
        Me.directorLbl.Text = "Director"
        '
        'RichTextBox1
        '
        Me.RichTextBox1.Location = New System.Drawing.Point(6, 221)
        Me.RichTextBox1.Name = "RichTextBox1"
        Me.RichTextBox1.Size = New System.Drawing.Size(338, 83)
        Me.RichTextBox1.TabIndex = 4
        Me.RichTextBox1.Text = ""
        '
        'plotSummaryLbl
        '
        Me.plotSummaryLbl.AutoSize = True
        Me.plotSummaryLbl.Location = New System.Drawing.Point(7, 203)
        Me.plotSummaryLbl.Name = "plotSummaryLbl"
        Me.plotSummaryLbl.Size = New System.Drawing.Size(71, 13)
        Me.plotSummaryLbl.TabIndex = 3
        Me.plotSummaryLbl.Text = "Plot Summary"
        '
        'ComboBox1
        '
        Me.ComboBox1.FormattingEnabled = True
        Me.ComboBox1.Items.AddRange(New Object() {"Select Movie", "Resident Evil: The Final Chapter", "xXx: Return of Xander Cage", "Lala Land", "Jackie", "Gold"})
        Me.ComboBox1.Location = New System.Drawing.Point(15, 36)
        Me.ComboBox1.Name = "ComboBox1"
        Me.ComboBox1.Size = New System.Drawing.Size(332, 21)
        Me.ComboBox1.TabIndex = 1
        '
        'movieTitleBtt
        '
        Me.movieTitleBtt.AutoSize = True
        Me.movieTitleBtt.Location = New System.Drawing.Point(7, 20)
        Me.movieTitleBtt.Name = "movieTitleBtt"
        Me.movieTitleBtt.Size = New System.Drawing.Size(27, 13)
        Me.movieTitleBtt.TabIndex = 0
        Me.movieTitleBtt.Text = "Title"
        '
        'TabControl_items
        '
        Me.TabControl_items.Controls.Add(Me.TabPage_movies)
        Me.TabControl_items.Controls.Add(Me.TabPage2)
        Me.TabControl_items.Location = New System.Drawing.Point(371, 13)
        Me.TabControl_items.Name = "TabControl_items"
        Me.TabControl_items.SelectedIndex = 0
        Me.TabControl_items.Size = New System.Drawing.Size(778, 703)
        Me.TabControl_items.TabIndex = 2
        '
        'TabPage_movies
        '
        Me.TabPage_movies.Controls.Add(Me.ListView_movieItems)
        Me.TabPage_movies.Location = New System.Drawing.Point(4, 22)
        Me.TabPage_movies.Name = "TabPage_movies"
        Me.TabPage_movies.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage_movies.Size = New System.Drawing.Size(770, 677)
        Me.TabPage_movies.TabIndex = 0
        Me.TabPage_movies.Text = "Movies"
        Me.TabPage_movies.UseVisualStyleBackColor = True
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.ListView_foodItems)
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(770, 677)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Food"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'Cinema_bookingDataSet1
        '
        Me.Cinema_bookingDataSet1.DataSetName = "cinema_bookingDataSet"
        Me.Cinema_bookingDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.Button_clearAll)
        Me.GroupBox1.Controls.Add(Me.Button_checkOut)
        Me.GroupBox1.Controls.Add(Me.TextBox1)
        Me.GroupBox1.Controls.Add(Me.CheckedListBox1)
        Me.GroupBox1.Location = New System.Drawing.Point(12, 335)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(173, 371)
        Me.GroupBox1.TabIndex = 3
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Chart"
        '
        'ListView_movieItems
        '
        Me.ListView_movieItems.Location = New System.Drawing.Point(6, 6)
        Me.ListView_movieItems.Name = "ListView_movieItems"
        Me.ListView_movieItems.Size = New System.Drawing.Size(758, 665)
        Me.ListView_movieItems.TabIndex = 0
        Me.ListView_movieItems.UseCompatibleStateImageBehavior = False
        '
        'ListView_foodItems
        '
        Me.ListView_foodItems.Location = New System.Drawing.Point(6, 6)
        Me.ListView_foodItems.Name = "ListView_foodItems"
        Me.ListView_foodItems.Size = New System.Drawing.Size(758, 665)
        Me.ListView_foodItems.TabIndex = 0
        Me.ListView_foodItems.UseCompatibleStateImageBehavior = False
        '
        'CheckedListBox1
        '
        Me.CheckedListBox1.FormattingEnabled = True
        Me.CheckedListBox1.Location = New System.Drawing.Point(6, 20)
        Me.CheckedListBox1.Name = "CheckedListBox1"
        Me.CheckedListBox1.Size = New System.Drawing.Size(159, 289)
        Me.CheckedListBox1.TabIndex = 0
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(47, 316)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(118, 20)
        Me.TextBox1.TabIndex = 1
        '
        'Button_checkOut
        '
        Me.Button_checkOut.Location = New System.Drawing.Point(91, 342)
        Me.Button_checkOut.Name = "Button_checkOut"
        Me.Button_checkOut.Size = New System.Drawing.Size(75, 23)
        Me.Button_checkOut.TabIndex = 2
        Me.Button_checkOut.Text = "Check Out"
        Me.Button_checkOut.UseVisualStyleBackColor = True
        '
        'Button_clearAll
        '
        Me.Button_clearAll.Location = New System.Drawing.Point(6, 342)
        Me.Button_clearAll.Name = "Button_clearAll"
        Me.Button_clearAll.Size = New System.Drawing.Size(75, 23)
        Me.Button_clearAll.TabIndex = 3
        Me.Button_clearAll.Text = "Clear All"
        Me.Button_clearAll.UseVisualStyleBackColor = True
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(10, 319)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(31, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "Total"
        '
        'GroupBox2
        '
        Me.GroupBox2.Location = New System.Drawing.Point(192, 335)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(172, 371)
        Me.GroupBox2.TabIndex = 4
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "GroupBox2"
        '
        'StaffForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1161, 718)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.TabControl_items)
        Me.Controls.Add(Me.movieGBox)
        Me.Name = "StaffForm"
        Me.Text = "StaffForm"
        Me.movieGBox.ResumeLayout(False)
        Me.movieGBox.PerformLayout()
        Me.TabControl_items.ResumeLayout(False)
        Me.TabPage_movies.ResumeLayout(False)
        Me.TabPage2.ResumeLayout(False)
        CType(Me.Cinema_bookingDataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents movieGBox As System.Windows.Forms.GroupBox
    Friend WithEvents TextBox3 As System.Windows.Forms.TextBox
    Friend WithEvents lengthLbl As System.Windows.Forms.Label
    Friend WithEvents genreTBox As System.Windows.Forms.TextBox
    Friend WithEvents genreLbl As System.Windows.Forms.Label
    Friend WithEvents startsNamesLBox As System.Windows.Forms.ListBox
    Friend WithEvents starsLbl As System.Windows.Forms.Label
    Friend WithEvents writerNameTBox As System.Windows.Forms.TextBox
    Friend WithEvents writerLbl As System.Windows.Forms.Label
    Friend WithEvents directorNameTBox As System.Windows.Forms.TextBox
    Friend WithEvents directorLbl As System.Windows.Forms.Label
    Friend WithEvents RichTextBox1 As System.Windows.Forms.RichTextBox
    Friend WithEvents plotSummaryLbl As System.Windows.Forms.Label
    Friend WithEvents ComboBox1 As System.Windows.Forms.ComboBox
    Friend WithEvents movieTitleBtt As System.Windows.Forms.Label
    Friend WithEvents TabControl_items As System.Windows.Forms.TabControl
    Friend WithEvents TabPage_movies As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents Cinema_bookingDataSet1 As CinemaBooking.cinema_bookingDataSet
    Friend WithEvents ListView_movieItems As System.Windows.Forms.ListView
    Friend WithEvents ListView_foodItems As System.Windows.Forms.ListView
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Button_clearAll As System.Windows.Forms.Button
    Friend WithEvents Button_checkOut As System.Windows.Forms.Button
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents CheckedListBox1 As System.Windows.Forms.CheckedListBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
End Class
