<%@ Page Language="C#" AutoEventWireup="true" CodeFile="t1.aspx.cs" Inherits="htmltest_t1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="location_name" DataValueField="idsmall_poond">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" SelectCommand="SELECT * FROM [small_pond_location]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
