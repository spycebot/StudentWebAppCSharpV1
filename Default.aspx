<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudentWebAppCSharpV1._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
    <div class="card p-4 col-md-4 offset-md-4">
      <h4 class="text-center">Login</h4>
      <div class="mb-3">
        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" Placeholder="Username" required />
      </div>
      <div class="mb-3">
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Password" required />
      </div>
      <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100" Text="Login" OnClick="btnLogin_Click" />
      <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-3" />
    </div>
  </form>

</body>
</html>