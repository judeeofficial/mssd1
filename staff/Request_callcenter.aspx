<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="Request_callcenter.aspx.cs" Inherits="staff_Request_callcenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> 
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>  
    <script type="text/javascript" src="../script/jquery-1.11.2.min.js"></script>
       <script type="text/javascript" src="../script/request_show_cal.js"></script>
<!--<script type="text/javascript">
  /*  var map;
    var infowindow;
    window.onload = function() {

        var mapOptions = {
            center: new google.maps.LatLng(13.7699866, 100.5507056),
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP

        };
        map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);


        infowindow = new google.maps.InfoWindow();
        setlocation();
    }

    function setlocation() {
        $.ajax({
            type: "POST",
            url: "../page/district1.ashx",
        }).done(function (text) {
            var json = $.parseJSON(text);
            for (var i = 0; i < json.length; i++) {
                var lat = json[i].lat;
                var long = json[i].long;
                var location_name = json[i].location_name;
                //   alert(lat + " " +long+ " "+location_name)
                var latlng = new google.maps.LatLng(lat, long);

                var makeroption = { map: map, html: location_name, position: latlng };
                // alert(makeroption)
                var marker = new google.maps.Marker(makeroption);
                google.maps.event.addListener(marker, 'click', function (e) {
                    infowindow.setContent(this.html);
                    infowindow.open(map, this);
                });
            }

        });

    } *//
</script> -->
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
        .auto-style3 {
            width: 172px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <h2>
          Call Center
       
    </h2>

      <table>
      
        <tr >
            <td class="auto-style1"colspan="6" >กรอกข้อมูลลูกค้า </td>
             <td rowspan="9" style="padding-left: 20px">
                    <asp:Button ID="btn_request" class="btn btn-primary" runat="server" Width="95px" Height="32px" Text="Request Work" OnClick="btn_request_Click" />
                </td>

        </tr>
        <tr>
            <td class="auto-style1">ชื่อ :</td>
            <td><asp:TextBox ID="txtfirstname" class="form-control"   runat="server" Width="237px"></asp:TextBox> </td>
             <td>นามสกุล :</td>
            <td><asp:TextBox ID="txtlastname" class="form-control"   runat="server" Width="244px"></asp:TextBox> </td>
        </tr>
           <tr>
              <td valign="top">
                    ที่อยู่ของลูกค้า :<asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td colspan="5" align="left">
                    <asp:TextBox ID="txtaddress" runat="server" class="form-control"  Width="677px" Height="44px" TextMode="MultiLine"></asp:TextBox>
                </td>
        </tr>

        <tr>
                    <td>เบอร์โทรศัพท์ :</td>
            <td><asp:TextBox ID="txttel" class="form-control"   runat="server" Width="244px"></asp:TextBox> </td>
              <td>E-mail:</td>
            <td><asp:TextBox ID="txtemail" class="form-control"   runat="server" Width="244px"></asp:TextBox> </td>
        </tr>
            <tr>
                    <td colspan="6">
                     <center>  <asp:Button ID="btn_savedata" runat="server" Text="บันทึกข้อมูล" class="btn btn-info" OnClick="btn_savedata_Click" /></center> </td>
               
        </tr>
          <tr>
               <td colspan="6">
                     <center>  <asp:Label ID="lblstatus" runat="server" ></asp:Label></center> </td>


          </tr>
           <tr >
            <td colspan="6" >_______________________________________________________________________________________________________________________________<br />
                แจ้งความประสงค์ขอกำจัดสิ่งปฏิกูล </td>


        </tr>

        <tr>
                   <td>รหัสลูกค้า : </td>
              <td>
                  <asp:Label ID="lblidcustomer" runat="server"></asp:Label>
                   </td>
              <td>
                    วันที่ดำเนินงาน :<asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
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
                        </asp:Calendar>
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
                <td>
                    ประเภทงาน :<asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    
                    <asp:DropDownList ID="ddlwork_type" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="type_name" DataValueField="type_id">
                    </asp:DropDownList>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Connectionstring %>" SelectCommand="SELECT * FROM [WorkType] ORDER BY [display_order]"></asp:SqlDataSource>
                    
                </td>

              <td>
                    เวลา :<asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
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
        
          
        </tr>
        <tr>
                 <td valign="top">
                    รายละเอียดงาน :<asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td colspan="5" align="left">
                    <asp:TextBox ID="txtdetail" runat="server" class="form-control"  Width="685px" Height="83px" TextMode="MultiLine" ></asp:TextBox>
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
            <body>
                    <div id="googleMap" style="width: 100%; height: 350px; padding: 10px 0 15px 10px;">
                    </div>
                </body>
                </td>

      </tr>
    </table>
</asp:Content>

