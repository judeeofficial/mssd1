<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="Addwork.aspx.cs" Inherits="staff_Addwork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
     <script type="text/javascript" src="../script/jquery-1.11.2.min.js"></script>
  <script type="text/javascript" src="../script/mssdmg.js"></script> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <h2>
        รายการงานขอรับบริการ
    </h2>
    <div id="ListWork" runat="server">
        <table>
            <tr>
                <td>
                    วันที่ดำเนินงาน :
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="37px" ImageUrl="~/Images/calendar-icon.png" OnClick="ImageButton1_Click" Width="35px" />
                        <asp:Label ID="lblchareter" runat="server"></asp:Label>

                       <asp:Calendar id="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" OnSelectionChanged="Calendar1_SelectionChanged" >
                            <DayHeaderStyle ForeColor="#336666" Height="1px" BackColor="#99CCCC" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" BorderColor="#3366CC" BorderWidth="1px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar></td>
                <td>
                    สถานะ :
                </td>
                <td>
                    <asp:DropDownList ID="ddl_status" class="form-control" runat="server" Width="150px">
                        <asp:ListItem Text="-None-" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="รอดำเนินการ" Value="1"></asp:ListItem>
                        <asp:ListItem Text="คิว" Value="2"></asp:ListItem>
                        <asp:ListItem Text="ดำเนินการเสร็จสิ้น" Value="3"></asp:ListItem>
                        <asp:ListItem Text="ยกเลิกงาน" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                  <td>
                    เลือกเขตที่รับผิดชอบ
                </td>
                <td>
                    <asp:DropDownList ID="ddl_district" class="form-control"  runat="server" DataSourceID="SqlDataSource1" DataTextField="district_name" DataValueField="district_id"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" SelectCommand="SELECT * FROM [District] ORDER BY [district_name] DESC"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="lbl_error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td style="padding-left: 20px">
                    <asp:Button ID="btn_Search" runat="server" Width="100px" Height="50px" class="btn btn-warning" Text="Search" OnClick="btn_Search_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="3" Height="54px" Width="995px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </td>

              

            </tr>
        <tr>
            <td colspan="7"> รหัสเขตพื้นที่รับผิดชอบ&nbsp; <asp:Label ID="lbldistrict" runat="server"></asp:Label></td>
        </tr>
           
            <tr>
                <td colspan="7"><div id="googleMap" style="width: 100%; height: 350px; padding: 10px 0 15px 10px;"></div></td>
             
            </tr>
        </table>
    </div>
</asp:Content>

