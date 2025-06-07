<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="StudentWebAppCSharpV1.StudentForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Form by Terzo Technical</title>
    <script>
        // Auto-redirect after 10 minutes (600,000 ms)
        setTimeout(function () {
            alert('Your session has expired due to inactivity.');
            window.location.href = 'Default.aspx';
        }, 600000);
    </script>
</head>
<body>
    <form id="studentform" runat="server">
        <div>
            <h1>Student Data Entry</h1>
            <h4>Welcome, <%= Session["user"] %> (<%= Session["role"] %>)</h4>
            <asp:TextBox ID="txtName" runat="server" Placeholder="Name" />
            <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email" />
            <asp:TextBox ID="txtCourse" runat="server" Placeholder="Course" />
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>
