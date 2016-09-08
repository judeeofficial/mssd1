<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="Request_work.aspx.cs" Inherits="page_Request_work" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
     <script type="text/javascript" src="../script/jquery-1.11.2.min.js"></script>
   
    <script type="text/javascript" src="../script/show_request_map.js"></script>
    <style type="text/css">
        .auto-style3 {
            width: 248px;
        }
        .auto-style4 {
            width: 920px;
        }
        .auto-style5 {
            width: 173px;
        }
        .auto-style6 {
            width: 39px;
        }
        .auto-style7 {
            width: 176px;
        }
        .auto-style9 {
            width: 220px;
        }
        .auto-style10 {
            width: 117px;
        }
        .auto-style12 {
            height: 39px;
        }
        .auto-style13 {
            width: 39px;
            height: 39px;
        }
        .auto-style14 {
            width: 176px;
            height: 39px;
        }
        .auto-style15 {
            display: block;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            width: 147px;
        }
        .auto-style16 {
            height: 21px;
        }
        .auto-style17 {
            width: 213px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
       <h2>
           ขอรับบริการ
    </h2>
  <table class="auto-style4">
            <tr>
                  <td class="auto-style5">
                    ประเภทงาน :<asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style3">
                    
                    <asp:DropDownList ID="ddlwork_type" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="type_name" DataValueField="type_id" Width="183px">
                    </asp:DropDownList>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" SelectCommand="select * from WorkType order by type_id desc"></asp:SqlDataSource>
                    
                </td>
                            <td class="auto-style6">
                    เวลา <asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:DropDownList ID="ddl_time" class="form-control" runat="server" Width="150px">
                        <asp:ListItem Text="08:00" Value="08:00"></asp:ListItem>
                        <asp:ListItem Text="09:00" Value="09:00"></asp:ListItem>
                        <asp:ListItem Text="10:00" Value="10:00"></asp:ListItem>
                        <asp:ListItem Text="11:00" Value="11:00"></asp:ListItem>
                        <asp:ListItem Text="13:00" Value="13:00"></asp:ListItem>
                        <asp:ListItem Text="14:00" Value="14:00"></asp:ListItem>
                        <asp:ListItem Text="15:00" Value="15:00"></asp:ListItem>
                        <asp:ListItem Text="16:00" Value="16:00"></asp:ListItem>
                    </asp:DropDownList>
                </td>
             <td class="auto-style17" colspan="1">
                    วันที่ดำเนินงาน :<asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style9">
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
                        </asp:Calendar>
                </td>
              
                <td rowspan="4" style="padding-left: 20px" class="auto-style10">
                    <asp:Button ID="Request_Work" class="btn btn-primary" runat="server" Height="51px" Text="Request Work" Width="116px" OnClick="Request_Work_Click" />
                </td>
            </tr>
            <tr>
           <td class="auto-style5">
                    เลือกเขต :<asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddl_district"  class="form-control" runat="server" Width="150px" AutoPostBack="True"
                        DataSourceID="DistrictData" DataTextField="district_name" DataValueField="district_id" OnSelectedIndexChanged="ddl_district_SelectedIndexChanged">
                    </asp:DropDownList>
                     <asp:SqlDataSource ID="DistrictData" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>"
                        SelectCommand="SELECT * FROM [District] ORDER BY [district_id]"></asp:SqlDataSource>
                </td>
                <td class="auto-style6">
                    เลือกแขวง :<asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td colspan="3" >
                    <asp:DropDownList ID="ddl_subdistrict" class="form-control" runat="server" Width="150px" DataSourceID="SubDistrictData"
                        DataTextField="sub_district_name" DataValueField="sub_district_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SubDistrictData" runat="server"  ConnectionString="<%$ ConnectionStrings:Connectionstring%>"
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Sub_District] WHERE ([district_id] = @district_id) ORDER BY [sub_district_name]">
                      <SelectParameters>
                         <asp:ControlParameter ControlID="ddl_district" DefaultValue="0" Name="district_id"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters> 
                    </asp:SqlDataSource>
                </td>
                
            </tr>
            <tr>
                 <td valign="top" class="auto-style5">
                    รายละเอียดงาน :
                </td>
                <td colspan="5" align="left">
                    <asp:TextBox ID="txt_detail" runat="server" class="form-control"  Width="685px" Height="83px" TextMode="MultiLine"></asp:TextBox>
                </td>    
            </tr>
            <tr>
                    <td colspan="2" rowspan="1" align="center" valign="center" class="auto-style12">
                        สถานที่ขอรับบริการ : 
                </td>
                <td class="auto-style13" colspan="2"> 
                      <div id="floating-panel">
		         <input id="address1" class="auto-style15" type="text" value=""/>
                  
                    </div>
                    
                    </td>
                <td class="auto-style14" colspan="2">
                    <input type="button" value="ค้นหาสถานที่รับบริการ" class="btn btn-warning" onclick="codeAddress()" style="width: 167px"/>
                    </td>
            </tr>
       <tr>
            <td colspan="2" rowspan="1" align="center" valign="center" class="auto-style16">
                       เขตที่คุณเลือก : 
                </td>
                <td colspan="4" class="auto-style16"> 
               <asp:Label ID="lbldistrict" runat="server"></asp:Label>
           </td>
           </tr>
      <tr>
          <td class="auto-style5">ขนาดบ่อ :</td>
          <td class="auto-style3" colspan="5">
              <asp:RadioButtonList ID="Rpool" runat="server" DataSourceID="SqlDataSource2" DataTextField="location_name" DataValueField="idsmall_poond" OnSelectedIndexChanged="Rpool_SelectedIndexChanged">
              </asp:RadioButtonList>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" SelectCommand="SELECT * FROM [small_pond_location]"></asp:SqlDataSource>
          </td>
      </tr>
     <tr>
            <td colspan="6">

		    <asp:Label ID="lbl_error" runat="server"></asp:Label>      </td>
       

     </tr>
            <tr >
                <td colspan="2">ระยะทาง(km):</td>
            <td colspan="4">
               	<center><!--<div style="width:100%; height:10%" id="distance_direct"></div>--></center>
	            <center><div style="width:100%; height:10%" id="distance_road"></div></center>
              
 </td>
       

     </tr>        
      <tr>
           <td valign="top" colspan="6" >
          <div id="warnings-panel"></div>
                  <div id="googleMap" style="width: 100%; height: 350px; padding: 10px 0 15px 10px;"></div>
                </td>

      </tr>
        </table>

















</asp:Content>

