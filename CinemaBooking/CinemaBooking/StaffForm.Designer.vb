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
        Me.components = New System.ComponentModel.Container()
        Me.TabControl_items = New System.Windows.Forms.TabControl()
        Me.TabPage_movies = New System.Windows.Forms.TabPage()
        Me.DataGridView_movieList = New System.Windows.Forms.DataGridView()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.Cinema_bookingDataSet1 = New CinemaBooking.cinema_bookingDataSet()
        Me.GroupBox_seatSelection = New System.Windows.Forms.GroupBox()
        Me.Panel_seatSelectionCont = New System.Windows.Forms.Panel()
        Me.GroupBox_checkoutList = New System.Windows.Forms.GroupBox()
        Me.Panel_checkoutCont = New System.Windows.Forms.Panel()
        Me.GroupBox_roomSelection = New System.Windows.Forms.GroupBox()
        Me.ComboBox_SelectedDay = New System.Windows.Forms.ComboBox()
        Me.DataGridView_projectionTime = New System.Windows.Forms.DataGridView()
        Me.ComboBox_screen = New System.Windows.Forms.ComboBox()
        Me.screenLbl = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.GroupBox_movieInfo = New System.Windows.Forms.GroupBox()
        Me.TextBox_movieTitle = New System.Windows.Forms.TextBox()
        Me.TextBox_length = New System.Windows.Forms.TextBox()
        Me.lengthLbl = New System.Windows.Forms.Label()
        Me.movieTitleBtt = New System.Windows.Forms.Label()
        Me.Label_rating = New System.Windows.Forms.Label()
        Me.ProgressBar_rating = New System.Windows.Forms.ProgressBar()
        Me.genreTBox = New System.Windows.Forms.TextBox()
        Me.genreLbl = New System.Windows.Forms.Label()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.MovieBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.MovieTableAdapter = New CinemaBooking.cinema_bookingDataSetTableAdapters.MovieTableAdapter()
        Me.TabControl_items.SuspendLayout()
        Me.TabPage_movies.SuspendLayout()
        CType(Me.DataGridView_movieList, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Cinema_bookingDataSet1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox_seatSelection.SuspendLayout()
        Me.GroupBox_checkoutList.SuspendLayout()
        Me.GroupBox_roomSelection.SuspendLayout()
        CType(Me.DataGridView_projectionTime, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox_movieInfo.SuspendLayout()
        CType(Me.MovieBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'TabControl_items
        '
        Me.TabControl_items.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.TabControl_items.Controls.Add(Me.TabPage_movies)
        Me.TabControl_items.Controls.Add(Me.TabPage2)
        Me.TabControl_items.Font = New System.Drawing.Font("Algerian", 12.0!)
        Me.TabControl_items.Location = New System.Drawing.Point(2, 27)
        Me.TabControl_items.Name = "TabControl_items"
        Me.TabControl_items.SelectedIndex = 0
        Me.TabControl_items.Size = New System.Drawing.Size(567, 311)
        Me.TabControl_items.TabIndex = 2
        '
        'TabPage_movies
        '
        Me.TabPage_movies.Controls.Add(Me.DataGridView_movieList)
        Me.TabPage_movies.Location = New System.Drawing.Point(4, 27)
        Me.TabPage_movies.Name = "TabPage_movies"
        Me.TabPage_movies.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage_movies.Size = New System.Drawing.Size(559, 280)
        Me.TabPage_movies.TabIndex = 0
        Me.TabPage_movies.Text = "Movies"
        Me.TabPage_movies.UseVisualStyleBackColor = True
        '
        'DataGridView_movieList
        '
        Me.DataGridView_movieList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView_movieList.Location = New System.Drawing.Point(7, 6)
        Me.DataGridView_movieList.Name = "DataGridView_movieList"
        Me.DataGridView_movieList.Size = New System.Drawing.Size(544, 268)
        Me.DataGridView_movieList.TabIndex = 0
        '
        'TabPage2
        '
        Me.TabPage2.Location = New System.Drawing.Point(4, 27)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(628, 254)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Food"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'Cinema_bookingDataSet1
        '
        Me.Cinema_bookingDataSet1.DataSetName = "cinema_bookingDataSet"
        Me.Cinema_bookingDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GroupBox_seatSelection
        '
        Me.GroupBox_seatSelection.Controls.Add(Me.Panel_seatSelectionCont)
        Me.GroupBox_seatSelection.Location = New System.Drawing.Point(575, 27)
        Me.GroupBox_seatSelection.Name = "GroupBox_seatSelection"
        Me.GroupBox_seatSelection.Size = New System.Drawing.Size(672, 737)
        Me.GroupBox_seatSelection.TabIndex = 6
        Me.GroupBox_seatSelection.TabStop = False
        Me.GroupBox_seatSelection.Text = "Seat Selection"
        '
        'Panel_seatSelectionCont
        '
        Me.Panel_seatSelectionCont.Location = New System.Drawing.Point(7, 18)
        Me.Panel_seatSelectionCont.Name = "Panel_seatSelectionCont"
        Me.Panel_seatSelectionCont.Size = New System.Drawing.Size(653, 711)
        Me.Panel_seatSelectionCont.TabIndex = 0
        '
        'GroupBox_checkoutList
        '
        Me.GroupBox_checkoutList.Controls.Add(Me.Panel_checkoutCont)
        Me.GroupBox_checkoutList.Location = New System.Drawing.Point(326, 344)
        Me.GroupBox_checkoutList.Name = "GroupBox_checkoutList"
        Me.GroupBox_checkoutList.Size = New System.Drawing.Size(243, 423)
        Me.GroupBox_checkoutList.TabIndex = 7
        Me.GroupBox_checkoutList.TabStop = False
        Me.GroupBox_checkoutList.Text = "Check-out List"
        '
        'Panel_checkoutCont
        '
        Me.Panel_checkoutCont.Location = New System.Drawing.Point(6, 19)
        Me.Panel_checkoutCont.Name = "Panel_checkoutCont"
        Me.Panel_checkoutCont.Size = New System.Drawing.Size(225, 398)
        Me.Panel_checkoutCont.TabIndex = 1
        '
        'GroupBox_roomSelection
        '
        Me.GroupBox_roomSelection.Controls.Add(Me.ComboBox_SelectedDay)
        Me.GroupBox_roomSelection.Controls.Add(Me.DataGridView_projectionTime)
        Me.GroupBox_roomSelection.Controls.Add(Me.ComboBox_screen)
        Me.GroupBox_roomSelection.Controls.Add(Me.screenLbl)
        Me.GroupBox_roomSelection.Controls.Add(Me.Label3)
        Me.GroupBox_roomSelection.Controls.Add(Me.Label6)
        Me.GroupBox_roomSelection.Location = New System.Drawing.Point(6, 502)
        Me.GroupBox_roomSelection.Name = "GroupBox_roomSelection"
        Me.GroupBox_roomSelection.Size = New System.Drawing.Size(314, 265)
        Me.GroupBox_roomSelection.TabIndex = 8
        Me.GroupBox_roomSelection.TabStop = False
        Me.GroupBox_roomSelection.Text = "Room Selection"
        '
        'ComboBox_SelectedDay
        '
        Me.ComboBox_SelectedDay.FormattingEnabled = True
        Me.ComboBox_SelectedDay.Location = New System.Drawing.Point(11, 36)
        Me.ComboBox_SelectedDay.Name = "ComboBox_SelectedDay"
        Me.ComboBox_SelectedDay.Size = New System.Drawing.Size(139, 21)
        Me.ComboBox_SelectedDay.TabIndex = 22
        '
        'DataGridView_projectionTime
        '
        Me.DataGridView_projectionTime.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView_projectionTime.Location = New System.Drawing.Point(11, 81)
        Me.DataGridView_projectionTime.Name = "DataGridView_projectionTime"
        Me.DataGridView_projectionTime.Size = New System.Drawing.Size(294, 173)
        Me.DataGridView_projectionTime.TabIndex = 21
        '
        'ComboBox_screen
        '
        Me.ComboBox_screen.FormattingEnabled = True
        Me.ComboBox_screen.Location = New System.Drawing.Point(184, 36)
        Me.ComboBox_screen.Name = "ComboBox_screen"
        Me.ComboBox_screen.Size = New System.Drawing.Size(121, 21)
        Me.ComboBox_screen.TabIndex = 20
        '
        'screenLbl
        '
        Me.screenLbl.AutoSize = True
        Me.screenLbl.Location = New System.Drawing.Point(181, 21)
        Me.screenLbl.Name = "screenLbl"
        Me.screenLbl.Size = New System.Drawing.Size(41, 13)
        Me.screenLbl.TabIndex = 17
        Me.screenLbl.Text = "Screen"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(6, 21)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(56, 13)
        Me.Label3.TabIndex = 15
        Me.Label3.Text = "Show Day"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(6, 64)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(65, 13)
        Me.Label6.TabIndex = 13
        Me.Label6.Text = "Show Times"
        '
        'GroupBox_movieInfo
        '
        Me.GroupBox_movieInfo.Controls.Add(Me.TextBox_movieTitle)
        Me.GroupBox_movieInfo.Controls.Add(Me.TextBox_length)
        Me.GroupBox_movieInfo.Controls.Add(Me.lengthLbl)
        Me.GroupBox_movieInfo.Controls.Add(Me.movieTitleBtt)
        Me.GroupBox_movieInfo.Controls.Add(Me.Label_rating)
        Me.GroupBox_movieInfo.Controls.Add(Me.ProgressBar_rating)
        Me.GroupBox_movieInfo.Controls.Add(Me.genreTBox)
        Me.GroupBox_movieInfo.Controls.Add(Me.genreLbl)
        Me.GroupBox_movieInfo.Location = New System.Drawing.Point(4, 344)
        Me.GroupBox_movieInfo.Name = "GroupBox_movieInfo"
        Me.GroupBox_movieInfo.Size = New System.Drawing.Size(314, 152)
        Me.GroupBox_movieInfo.TabIndex = 9
        Me.GroupBox_movieInfo.TabStop = False
        Me.GroupBox_movieInfo.Text = "Movie Info"
        '
        'TextBox_movieTitle
        '
        Me.TextBox_movieTitle.Location = New System.Drawing.Point(11, 33)
        Me.TextBox_movieTitle.Name = "TextBox_movieTitle"
        Me.TextBox_movieTitle.ReadOnly = True
        Me.TextBox_movieTitle.Size = New System.Drawing.Size(297, 20)
        Me.TextBox_movieTitle.TabIndex = 24
        '
        'TextBox_length
        '
        Me.TextBox_length.Location = New System.Drawing.Point(209, 73)
        Me.TextBox_length.Name = "TextBox_length"
        Me.TextBox_length.ReadOnly = True
        Me.TextBox_length.Size = New System.Drawing.Size(96, 20)
        Me.TextBox_length.TabIndex = 23
        '
        'lengthLbl
        '
        Me.lengthLbl.AutoSize = True
        Me.lengthLbl.Location = New System.Drawing.Point(206, 57)
        Me.lengthLbl.Name = "lengthLbl"
        Me.lengthLbl.Size = New System.Drawing.Size(40, 13)
        Me.lengthLbl.TabIndex = 22
        Me.lengthLbl.Text = "Length"
        '
        'movieTitleBtt
        '
        Me.movieTitleBtt.AutoSize = True
        Me.movieTitleBtt.Location = New System.Drawing.Point(3, 16)
        Me.movieTitleBtt.Name = "movieTitleBtt"
        Me.movieTitleBtt.Size = New System.Drawing.Size(27, 13)
        Me.movieTitleBtt.TabIndex = 20
        Me.movieTitleBtt.Text = "Title"
        '
        'Label_rating
        '
        Me.Label_rating.AutoSize = True
        Me.Label_rating.Location = New System.Drawing.Point(8, 109)
        Me.Label_rating.Name = "Label_rating"
        Me.Label_rating.Size = New System.Drawing.Size(38, 13)
        Me.Label_rating.TabIndex = 19
        Me.Label_rating.Text = "Rating"
        '
        'ProgressBar_rating
        '
        Me.ProgressBar_rating.Location = New System.Drawing.Point(11, 125)
        Me.ProgressBar_rating.Name = "ProgressBar_rating"
        Me.ProgressBar_rating.Size = New System.Drawing.Size(294, 23)
        Me.ProgressBar_rating.TabIndex = 18
        '
        'genreTBox
        '
        Me.genreTBox.Location = New System.Drawing.Point(11, 74)
        Me.genreTBox.Name = "genreTBox"
        Me.genreTBox.ReadOnly = True
        Me.genreTBox.Size = New System.Drawing.Size(165, 20)
        Me.genreTBox.TabIndex = 17
        '
        'genreLbl
        '
        Me.genreLbl.AutoSize = True
        Me.genreLbl.Location = New System.Drawing.Point(6, 57)
        Me.genreLbl.Name = "genreLbl"
        Me.genreLbl.Size = New System.Drawing.Size(36, 13)
        Me.genreLbl.TabIndex = 16
        Me.genreLbl.Text = "Genre"
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(1247, 24)
        Me.MenuStrip1.TabIndex = 10
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 767)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(1247, 22)
        Me.StatusStrip1.TabIndex = 11
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'MovieBindingSource
        '
        Me.MovieBindingSource.DataMember = "Movie"
        Me.MovieBindingSource.DataSource = Me.Cinema_bookingDataSet1
        '
        'MovieTableAdapter
        '
        Me.MovieTableAdapter.ClearBeforeFill = True
        '
        'StaffForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1247, 789)
        Me.Controls.Add(Me.GroupBox_movieInfo)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.GroupBox_roomSelection)
        Me.Controls.Add(Me.GroupBox_checkoutList)
        Me.Controls.Add(Me.GroupBox_seatSelection)
        Me.Controls.Add(Me.TabControl_items)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "StaffForm"
        Me.Text = "StaffForm"
        Me.TabControl_items.ResumeLayout(False)
        Me.TabPage_movies.ResumeLayout(False)
        CType(Me.DataGridView_movieList, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Cinema_bookingDataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox_seatSelection.ResumeLayout(False)
        Me.GroupBox_checkoutList.ResumeLayout(False)
        Me.GroupBox_roomSelection.ResumeLayout(False)
        Me.GroupBox_roomSelection.PerformLayout()
        CType(Me.DataGridView_projectionTime, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox_movieInfo.ResumeLayout(False)
        Me.GroupBox_movieInfo.PerformLayout()
        CType(Me.MovieBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents TabControl_items As System.Windows.Forms.TabControl
    Friend WithEvents TabPage_movies As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents Cinema_bookingDataSet1 As CinemaBooking.cinema_bookingDataSet
    Friend WithEvents GroupBox_seatSelection As System.Windows.Forms.GroupBox
    Friend WithEvents Panel_seatSelectionCont As System.Windows.Forms.Panel
    Friend WithEvents GroupBox_checkoutList As System.Windows.Forms.GroupBox
    Friend WithEvents Panel_checkoutCont As System.Windows.Forms.Panel
    Friend WithEvents GroupBox_roomSelection As System.Windows.Forms.GroupBox
    Friend WithEvents screenLbl As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents GroupBox_movieInfo As System.Windows.Forms.GroupBox
    Friend WithEvents Label_rating As System.Windows.Forms.Label
    Friend WithEvents ProgressBar_rating As System.Windows.Forms.ProgressBar
    Friend WithEvents genreTBox As System.Windows.Forms.TextBox
    Friend WithEvents genreLbl As System.Windows.Forms.Label
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents DataGridView_movieList As System.Windows.Forms.DataGridView
    Friend WithEvents MovieBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents MovieTableAdapter As CinemaBooking.cinema_bookingDataSetTableAdapters.MovieTableAdapter
    Friend WithEvents TextBox_length As System.Windows.Forms.TextBox
    Friend WithEvents lengthLbl As System.Windows.Forms.Label
    Friend WithEvents movieTitleBtt As System.Windows.Forms.Label
    Friend WithEvents TextBox_movieTitle As System.Windows.Forms.TextBox
    Friend WithEvents ComboBox_SelectedDay As System.Windows.Forms.ComboBox
    Friend WithEvents DataGridView_projectionTime As System.Windows.Forms.DataGridView
    Friend WithEvents ComboBox_screen As System.Windows.Forms.ComboBox
End Class
