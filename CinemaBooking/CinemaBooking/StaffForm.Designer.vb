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
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.MovieBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.MovieTableAdapter = New CinemaBooking.cinema_bookingDataSetTableAdapters.MovieTableAdapter()
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.seatSelectionTabPage = New System.Windows.Forms.TabPage()
        Me.bookedTicketsTabPage = New System.Windows.Forms.TabPage()
        Me.TextBox_nameBooked = New System.Windows.Forms.TextBox()
        Me.TextBox_movieTitleBook = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.TextBox_phoneBook = New System.Windows.Forms.TextBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.DataGridView_booked_tickets = New System.Windows.Forms.DataGridView()
        Me.ComboBox_bookedTicketScreen = New System.Windows.Forms.ComboBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.DataGridView_Items = New System.Windows.Forms.DataGridView()
        Me.TabControl_items.SuspendLayout()
        Me.TabPage_movies.SuspendLayout()
        CType(Me.DataGridView_movieList, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage2.SuspendLayout()
        CType(Me.Cinema_bookingDataSet1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox_checkoutList.SuspendLayout()
        Me.GroupBox_roomSelection.SuspendLayout()
        CType(Me.DataGridView_projectionTime, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.MovieBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl1.SuspendLayout()
        Me.seatSelectionTabPage.SuspendLayout()
        Me.bookedTicketsTabPage.SuspendLayout()
        CType(Me.DataGridView_booked_tickets, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataGridView_Items, System.ComponentModel.ISupportInitialize).BeginInit()
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
        Me.TabPage2.Controls.Add(Me.DataGridView_Items)
        Me.TabPage2.Location = New System.Drawing.Point(4, 27)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(559, 280)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Food"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'Cinema_bookingDataSet1
        '
        Me.Cinema_bookingDataSet1.DataSetName = "cinema_bookingDataSet"
        Me.Cinema_bookingDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Panel_seatSelectionCont
        '
        Me.Panel_seatSelectionCont.Location = New System.Drawing.Point(6, 6)
        Me.Panel_seatSelectionCont.Name = "Panel_seatSelectionCont"
        Me.Panel_seatSelectionCont.Size = New System.Drawing.Size(651, 696)
        Me.Panel_seatSelectionCont.TabIndex = 0
        '
        'GroupBox_checkoutList
        '
        Me.GroupBox_checkoutList.Controls.Add(Me.Panel_checkoutCont)
        Me.GroupBox_checkoutList.Location = New System.Drawing.Point(6, 340)
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
        Me.GroupBox_roomSelection.Location = New System.Drawing.Point(255, 343)
        Me.GroupBox_roomSelection.Name = "GroupBox_roomSelection"
        Me.GroupBox_roomSelection.Size = New System.Drawing.Size(314, 420)
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
        Me.DataGridView_projectionTime.Size = New System.Drawing.Size(294, 332)
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
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.seatSelectionTabPage)
        Me.TabControl1.Controls.Add(Me.bookedTicketsTabPage)
        Me.TabControl1.Location = New System.Drawing.Point(575, 27)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(671, 734)
        Me.TabControl1.TabIndex = 12
        '
        'seatSelectionTabPage
        '
        Me.seatSelectionTabPage.Controls.Add(Me.Panel_seatSelectionCont)
        Me.seatSelectionTabPage.Location = New System.Drawing.Point(4, 22)
        Me.seatSelectionTabPage.Name = "seatSelectionTabPage"
        Me.seatSelectionTabPage.Padding = New System.Windows.Forms.Padding(3)
        Me.seatSelectionTabPage.Size = New System.Drawing.Size(663, 708)
        Me.seatSelectionTabPage.TabIndex = 0
        Me.seatSelectionTabPage.Text = "Seat Selection"
        Me.seatSelectionTabPage.UseVisualStyleBackColor = True
        '
        'bookedTicketsTabPage
        '
        Me.bookedTicketsTabPage.Controls.Add(Me.ComboBox_bookedTicketScreen)
        Me.bookedTicketsTabPage.Controls.Add(Me.Label5)
        Me.bookedTicketsTabPage.Controls.Add(Me.TextBox_nameBooked)
        Me.bookedTicketsTabPage.Controls.Add(Me.TextBox_movieTitleBook)
        Me.bookedTicketsTabPage.Controls.Add(Me.Label1)
        Me.bookedTicketsTabPage.Controls.Add(Me.Label2)
        Me.bookedTicketsTabPage.Controls.Add(Me.TextBox_phoneBook)
        Me.bookedTicketsTabPage.Controls.Add(Me.Label4)
        Me.bookedTicketsTabPage.Controls.Add(Me.DataGridView_booked_tickets)
        Me.bookedTicketsTabPage.Location = New System.Drawing.Point(4, 22)
        Me.bookedTicketsTabPage.Name = "bookedTicketsTabPage"
        Me.bookedTicketsTabPage.Padding = New System.Windows.Forms.Padding(3)
        Me.bookedTicketsTabPage.Size = New System.Drawing.Size(663, 708)
        Me.bookedTicketsTabPage.TabIndex = 1
        Me.bookedTicketsTabPage.Text = "Booked Tickets"
        Me.bookedTicketsTabPage.UseVisualStyleBackColor = True
        '
        'TextBox_nameBooked
        '
        Me.TextBox_nameBooked.Location = New System.Drawing.Point(20, 35)
        Me.TextBox_nameBooked.Name = "TextBox_nameBooked"
        Me.TextBox_nameBooked.Size = New System.Drawing.Size(116, 20)
        Me.TextBox_nameBooked.TabIndex = 30
        '
        'TextBox_movieTitleBook
        '
        Me.TextBox_movieTitleBook.Location = New System.Drawing.Point(480, 35)
        Me.TextBox_movieTitleBook.Name = "TextBox_movieTitleBook"
        Me.TextBox_movieTitleBook.Size = New System.Drawing.Size(176, 20)
        Me.TextBox_movieTitleBook.TabIndex = 29
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(477, 19)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(36, 13)
        Me.Label1.TabIndex = 28
        Me.Label1.Text = "Movie"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(12, 18)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(35, 13)
        Me.Label2.TabIndex = 27
        Me.Label2.Text = "Name"
        '
        'TextBox_phoneBook
        '
        Me.TextBox_phoneBook.Location = New System.Drawing.Point(174, 35)
        Me.TextBox_phoneBook.Name = "TextBox_phoneBook"
        Me.TextBox_phoneBook.Size = New System.Drawing.Size(129, 20)
        Me.TextBox_phoneBook.TabIndex = 26
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(169, 18)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(38, 13)
        Me.Label4.TabIndex = 25
        Me.Label4.Text = "Phone"
        '
        'DataGridView_booked_tickets
        '
        Me.DataGridView_booked_tickets.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView_booked_tickets.Location = New System.Drawing.Point(6, 87)
        Me.DataGridView_booked_tickets.Name = "DataGridView_booked_tickets"
        Me.DataGridView_booked_tickets.Size = New System.Drawing.Size(650, 615)
        Me.DataGridView_booked_tickets.TabIndex = 0
        '
        'ComboBox_bookedTicketScreen
        '
        Me.ComboBox_bookedTicketScreen.FormattingEnabled = True
        Me.ComboBox_bookedTicketScreen.Location = New System.Drawing.Point(326, 34)
        Me.ComboBox_bookedTicketScreen.Name = "ComboBox_bookedTicketScreen"
        Me.ComboBox_bookedTicketScreen.Size = New System.Drawing.Size(121, 21)
        Me.ComboBox_bookedTicketScreen.TabIndex = 32
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(323, 19)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(41, 13)
        Me.Label5.TabIndex = 31
        Me.Label5.Text = "Screen"
        '
        'DataGridView_Items
        '
        Me.DataGridView_Items.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView_Items.Location = New System.Drawing.Point(6, 6)
        Me.DataGridView_Items.Name = "DataGridView_Items"
        Me.DataGridView_Items.Size = New System.Drawing.Size(547, 268)
        Me.DataGridView_Items.TabIndex = 0
        '
        'StaffForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1247, 789)
        Me.Controls.Add(Me.TabControl1)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.GroupBox_roomSelection)
        Me.Controls.Add(Me.GroupBox_checkoutList)
        Me.Controls.Add(Me.TabControl_items)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "StaffForm"
        Me.Text = "StaffForm"
        Me.TabControl_items.ResumeLayout(False)
        Me.TabPage_movies.ResumeLayout(False)
        CType(Me.DataGridView_movieList, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage2.ResumeLayout(False)
        CType(Me.Cinema_bookingDataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox_checkoutList.ResumeLayout(False)
        Me.GroupBox_roomSelection.ResumeLayout(False)
        Me.GroupBox_roomSelection.PerformLayout()
        CType(Me.DataGridView_projectionTime, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.MovieBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl1.ResumeLayout(False)
        Me.seatSelectionTabPage.ResumeLayout(False)
        Me.bookedTicketsTabPage.ResumeLayout(False)
        Me.bookedTicketsTabPage.PerformLayout()
        CType(Me.DataGridView_booked_tickets, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataGridView_Items, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents TabControl_items As System.Windows.Forms.TabControl
    Friend WithEvents TabPage_movies As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents Cinema_bookingDataSet1 As CinemaBooking.cinema_bookingDataSet
    Friend WithEvents Panel_seatSelectionCont As System.Windows.Forms.Panel
    Friend WithEvents GroupBox_checkoutList As System.Windows.Forms.GroupBox
    Friend WithEvents Panel_checkoutCont As System.Windows.Forms.Panel
    Friend WithEvents GroupBox_roomSelection As System.Windows.Forms.GroupBox
    Friend WithEvents screenLbl As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents DataGridView_movieList As System.Windows.Forms.DataGridView
    Friend WithEvents MovieBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents MovieTableAdapter As CinemaBooking.cinema_bookingDataSetTableAdapters.MovieTableAdapter
    Friend WithEvents ComboBox_SelectedDay As System.Windows.Forms.ComboBox
    Friend WithEvents DataGridView_projectionTime As System.Windows.Forms.DataGridView
    Friend WithEvents ComboBox_screen As System.Windows.Forms.ComboBox
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents seatSelectionTabPage As System.Windows.Forms.TabPage
    Friend WithEvents bookedTicketsTabPage As System.Windows.Forms.TabPage
    Friend WithEvents TextBox_nameBooked As System.Windows.Forms.TextBox
    Friend WithEvents TextBox_movieTitleBook As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents TextBox_phoneBook As System.Windows.Forms.TextBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents DataGridView_booked_tickets As System.Windows.Forms.DataGridView
    Friend WithEvents ComboBox_bookedTicketScreen As System.Windows.Forms.ComboBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents DataGridView_Items As System.Windows.Forms.DataGridView
End Class
