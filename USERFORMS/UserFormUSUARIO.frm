VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserFormUSUARIO 
   Caption         =   "GERENCIADOR DE USU�RIOS"
   ClientHeight    =   2490
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   6105
   OleObjectBlob   =   "UserFormUSUARIO.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserFormUSUARIO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CommandButtonADDUSER_Click()

Dim NOMEUSUARIO As String
Dim NIVEL As Integer
Dim SQL As String
Dim RS As New ADODB.Recordset
On Error GoTo VALORREPETIDO

If TextBoxUSUARIO.Value = "" Or ComboBoxNIVEL.Value = "" Then
    MsgBox "PREENCHA TODOS OS CAMPOS!", vbCritical, "ATEN��O"
    Exit Sub
End If

NOMEUSUARIO = "'" & TextBoxUSUARIO.Value & "'": NIVEL = ComboBoxNIVEL.Value

If EDITARUSUARIO = False Then
    SQL = "INSERT INTO USUARIO "
    SQL = SQL & "VALUES(" & NOMEUSUARIO & ",'123456'," & NIVEL & ")"
    RS.Open SQL, BD
    MsgBox "USU�RIO CADASTRADO COM SUCESSO!", vbInformation, "INFORMA��O"
    Exit Sub
Else
    SQL = "UPDATE USUARIO "
    SQL = SQL & "SET USU�RIO=" & NOMEUSUARIO & ", N�VEL = " & NIVEL
    SQL = SQL & " WHERE USU�RIO LIKE " & "'" & USUARIO & "'"
    RS.Open SQL, BD
    MsgBox "USU�RIO EDITADO COM SUCESSO!", vbInformation, "INFORMA��O"
End If

Exit Sub
VALORREPETIDO:
    MsgBox "ESTE USU�RIO J� EXISTE!", vbCritical, "ATEN��O"
End Sub

Private Sub CommandButtonCANCEL_Click()

Unload Me

End Sub

Private Sub Frame1_Click()

End Sub

Private Sub UserForm_Initialize()

    UserFormUSUARIO.ComboBoxNIVEL.AddItem "1"
    UserFormUSUARIO.ComboBoxNIVEL.AddItem "2"
    UserFormUSUARIO.ComboBoxNIVEL.AddItem "3"
    UserFormUSUARIO.ComboBoxNIVEL.AddItem "4"

If EDITARUSUARIO = True Then
    TextBoxUSUARIO.Value = UserFormSISTEMA.ListBoxUSUARIOS.Value
    ComboBoxNIVEL.Value = UserFormSISTEMA.ListBoxUSUARIOS.List(UserFormSISTEMA.ListBoxUSUARIOS.ListIndex, 2)
    USUARIO = UserFormSISTEMA.ListBoxUSUARIOS.Value
End If

End Sub
