<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentList.aspx.cs" Inherits="StudentWebAppCSharpV1.StudentList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View and Update Student Data</title>
    <script>
        // Auto-redirect after 10 minutes (600,000 ms)
        setTimeout(function () {
            alert('Your session has expired due to inactivity.');
            window.location.href = 'Default.aspx';
        }, 600000);
    </script>
</head>
<body>
    <h1>View and Update Student Data</h1>
    <h4>Welcome, <%= Session["user"] %> (<%= Session["role"] %>)</h4>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="Id"
                OnRowDeleting="gvStudents_RowDeleting" 
                OnRowEditing="gvStudents_RowEditing" 
                OnRowUpdating="gvStudents_RowUpdating" 
                OnRowCancelingEdit="gvStudents_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Course" HeaderText="Course" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

        </div>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </form>
</body>
</html>
