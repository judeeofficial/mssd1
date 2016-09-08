<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="page_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

       <h2>
        Log In
    </h2>
    <p>
        <div style=" width:400px;">
            กรุณาใส่ ชื่อผู้ใช้ และ รหัสผ่าน,
            <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="False" NavigateUrl="~/page/Register.aspx">ลงทะเบียน </asp:HyperLink>
            ถ้าคุณยังไม่มีบัญชีผู้ใช้ระบบ.
            <br />
            <br />
        
    <table style="width:100%;">
        <tr>
            <td style="width: 224px">
                Login:</td>
            <td>
                <asp:TextBox ID="txtLogin" class="form-control" runat="server" Width="226px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtLogin" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 224px">
                Password:</td>
            <td>
                <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password" Width="221px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="LoginButton" class="btn btn-default" runat="server" Text="Login" Width="174px" Height="37px" OnClick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="lblError" runat="server"></asp:Label>
                <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        </tr>
    </table>

                
                    
             
        </div>
    </p>
</asp:Content>
