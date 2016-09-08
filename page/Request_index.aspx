<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="Request_index.aspx.cs" Inherits="page_Request_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">




 <center> <h7>ยินดีต้อนรับคุณ<asp:Label ID="lblusername" runat="server"></asp:Label>
   
    </h7>
     <h8>
     <table style="width:100%;">
     <!--    <tr>
             <td class="auto-style1">เบอร์โทรศัพท์</td>
             <td colspan="2">
       <asp:Label ID="lbltel" runat="server" ></asp:Label>
   
             </td>
         </tr>
            
         <tr>
             <td class="auto-style1">ที่อยู่</td>
             <td colspan="2">
       <asp:Label ID="lbladdress" runat="server" ></asp:Label>
   
             </td>
         </tr> -->
       
         <tr>
             <td class="auto-style1">สถานะงานของคุณ</td>
             <td colspan="2">
       <asp:Label ID="Status" runat="server" ></asp:Label>
   
             </td>
         </tr>
            <tr>
             <td class="auto-style1">วันที่แจ้ง</td>
             <td colspan="2">
       <asp:Label ID="lbldate" runat="server" ></asp:Label>
   
             </td>
         </tr>
        <tr>
             <td class="auto-style1">คิวงานของคุณ</td>
             <td colspan="2">
       <asp:Label ID="lblqueue" runat="server" >ยังไม่ได้รับการจองคิว</asp:Label>
   
             </td>
         </tr>

          
            
    
     </table>
          </h8>
  
    </center> 

 

  <b>  <center>  <asp:Button ID="btnRequest" class="btn btn-warning" runat="server" Height="52px" Text="ขอรับบริการ" Width="189px" OnClick="btnRequest_Click" />
    </center></b>

    


&nbsp; 














  



</asp:Content>

