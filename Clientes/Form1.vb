Imports System.Data.SqlClient
Imports Microsoft.Data.SqlClient
Imports SqlConnection = System.Data.SqlClient.SqlConnection

Public Class FrmClientes
    Dim conexion As New SqlClient.SqlConnection
    Dim comando As New SqlClient.SqlCommand


    Private Sub FrmClientes_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        conexion = New SqlClient.SqlConnection("Server=localhost;Database=Clientes;Trusted_Connection=True;User=sa;Password=123456")
        Gird()
    End Sub

    Private Sub DataGridView1_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick

    End Sub

    Public Sub Gird()


        conexion.Open()
        comando = New SqlClient.SqlCommand("PutClientePrueba", conexion)
        Dim adapt As New SqlClient.SqlDataAdapter(comando)
        comando.CommandType = CommandType.StoredProcedure
        Dim dt As New DataTable
        adapt.Fill(dt)
        DataGridView1.DataSource = dt



    End Sub
End Class
