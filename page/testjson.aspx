<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testjson.aspx.cs" Inherits="page_testjson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Username and password test<br />
        Username
        <asp:TextBox ID="Username" runat="server" Width="185px"></asp:TextBox>
        <br />
        Password
        <asp:TextBox ID="Password" runat="server" Width="168px"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="login" Width="145px" />
    
    </div>
    </form>
</body>
</html>
