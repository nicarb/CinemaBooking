<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MoviePreviewUserControl
    Inherits System.Windows.Forms.UserControl

    'UserControl overrides dispose to clean up the component list.
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
        Me.Button_Select = New System.Windows.Forms.Button()
        Me.TextBox_title = New System.Windows.Forms.TextBox()
        Me.PictureBox_movie_manifest = New System.Windows.Forms.PictureBox()
        CType(Me.PictureBox_movie_manifest, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Button_Select
        '
        Me.Button_Select.Location = New System.Drawing.Point(4, 196)
        Me.Button_Select.Name = "Button_Select"
        Me.Button_Select.Size = New System.Drawing.Size(166, 23)
        Me.Button_Select.TabIndex = 0
        Me.Button_Select.Text = "Select"
        Me.Button_Select.UseVisualStyleBackColor = True
        '
        'TextBox_title
        '
        Me.TextBox_title.Location = New System.Drawing.Point(4, 4)
        Me.TextBox_title.Name = "TextBox_title"
        Me.TextBox_title.ReadOnly = True
        Me.TextBox_title.Size = New System.Drawing.Size(166, 20)
        Me.TextBox_title.TabIndex = 1
        '
        'PictureBox_movie_manifest
        '
        Me.PictureBox_movie_manifest.Location = New System.Drawing.Point(4, 31)
        Me.PictureBox_movie_manifest.Name = "PictureBox_movie_manifest"
        Me.PictureBox_movie_manifest.Size = New System.Drawing.Size(166, 159)
        Me.PictureBox_movie_manifest.TabIndex = 2
        Me.PictureBox_movie_manifest.TabStop = False
        '
        'MoviePreviewUserControl
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.PictureBox_movie_manifest)
        Me.Controls.Add(Me.TextBox_title)
        Me.Controls.Add(Me.Button_Select)
        Me.Name = "MoviePreviewUserControl"
        Me.Size = New System.Drawing.Size(173, 222)
        CType(Me.PictureBox_movie_manifest, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Button_Select As System.Windows.Forms.Button
    Friend WithEvents TextBox_title As System.Windows.Forms.TextBox
    Friend WithEvents PictureBox_movie_manifest As System.Windows.Forms.PictureBox

End Class
