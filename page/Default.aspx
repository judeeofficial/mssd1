<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="page_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="district_name" DataValueField="district_id"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" SelectCommand="SELECT * FROM [District] ORDER BY [district_id]"></asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>

</asp:Content>

