Imports System.Security.Cryptography
Imports System.Text

Public Class Utilities
    Shared orderedChars As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+=][}{<>"
    Shared mix As String = "BO+lfRmqkYfVRne6[K(Pic[rSr6j*ajvJSOC>o_ToRFZ>OK^X%P7upxJr(!$jo4fxAu*0m=qU2G*8yo<C(zTP_%Rke}@!%8IaDx8"
    'ascii chars from 35 to 126 in the ascii table
    Shared asciiValidChars As String = "#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"


    Public Shared Function CreateRandomSalt() As String
        'the following is the string that will hold the salt charachters
        'Dim mix As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+=][}{<>"
        Dim salt As String = ""
        Dim rnd As New Random
        Dim sb As New StringBuilder
        For i As Integer = 1 To 100 'Length of the salt
            Dim x As Integer = rnd.Next(0, mix.Length - 1)
            salt &= (mix.Substring(x, 1))
        Next
        Return salt
    End Function

    Public Shared Function CreateUserPasswordSalt(userStr As String) As String
        'the following is the string that will hold the salt charachters
        Dim asciis As Byte() = System.Text.Encoding.ASCII.GetBytes(userStr)
        Dim salt As String = ""
        Dim mixPos As Integer = 0
        Dim asciiVal As Integer = 0

        Dim rnd As New Random
        Dim sb As New StringBuilder
        For i As Integer = 0 To userStr.Length - 1 'Length of the salt
            'Dim x As Integer = rnd.Next(0, mix.Length - 1)
            asciiVal = Convert.ToInt32(asciis(i))
            mixPos = Asc(userStr(i)) - 35 '(asciiVal.Equals(Asc(asciiValidChars(asciiVal - 35)))) ? Asc(userStr(i)) : Asc(mix(i))
            salt &= (mix.Substring(mixPos, 2))
        Next
        Return salt
    End Function

    Public Shared Function Hash512(password As String, salt As String) As String
        Dim convertedToBytes As Byte() = Encoding.UTF8.GetBytes(password & salt)
        Dim hashType As HashAlgorithm = New SHA512Managed()
        Dim hashBytes As Byte() = hashType.ComputeHash(convertedToBytes)
        Dim hashedResult As String = Convert.ToBase64String(hashBytes)
        Return hashedResult
    End Function
End Class
