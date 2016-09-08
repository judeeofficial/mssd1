<%@ Page Title="" Language="C#" MasterPageFile="~/size.master" AutoEventWireup="true" CodeFile="Requestwork.aspx.cs" Inherits="page_Requestwork" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .labels
        {
            color: black;
            background-color: #FF8075;
            font-family: Arial;
            font-size: 11px;
            font-weight: bold;
            text-align: center;
            width: 12px;
        }
    </style>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        var markers = [];
        var uniqueId = 1;
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(13.7699866, 100.5507056),
                zoom: 16,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);
            var infoWindow = new google.maps.InfoWindow();
            var myLatlng = new google.maps.LatLng(13.7699866, 100.5507056);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'สำนักงานเขตดินแดง',
                labelContent: 1,
                labelAnchor: new google.maps.Point(13.7699866, 100.5507056),
                labelClass: "labels", // the CSS class for the label
                labelInBackground: false
            });

            (function (marker) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent('สำนักงานเขตดินแดง');
                    infoWindow.open(map, marker);
                });
            })(marker);

            //         var latlngbounds = new google.maps.LatLngBounds();
            //         var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);
            google.maps.event.addListener(map, 'click', function (e) {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setMap(null);
                }
                var newLatlng = new google.maps.LatLng(e.latLng.lat(), e.latLng.lng());
                var point = new google.maps.Marker({
                    position: newLatlng,
                    map: map,
                    title: 'สำนักงานเขตดินแดง',
                    labelContent: 1,
                    labelAnchor: new google.maps.Point(e.latLng.lat(), e.latLng.lng()),
                    labelClass: "labels", // the CSS class for the label
                    labelInBackground: false
                });

                txt_lat.SetValue(e.latLng.lat());
                txt_lon.SetValue(e.latLng.lng());

                point.id = uniqueId;
                uniqueId++;

                var content = 'Latitude: ' + e.latLng.lat() + '<br />Longitude: ' + e.latLng.lng();
                content += "<br /><input type = 'button' va;ue = 'Delete' onclick = 'DeleteMarker(" + point.id + ");' value = 'Delete' />";
                infoWindow.setContent(content);
                infoWindow.open(map, point);
                (function (point) {
                    google.maps.event.addListener(point, "click", function (e) {
                        infoWindow.setContent(content);
                        infoWindow.open(map, point);
                    });
                })(point);
                markers.push(point);
            });

        }
        function DeleteMarker(id) {
            txt_lat.SetValue(null);
            txt_lon.SetValue(null);
            //Find and remove the marker from the Array
            for (var i = 0; i < markers.length; i++) {
                if (markers[i].id == id) {
                    //Remove the marker from Map                  
                    markers[i].setMap(null);

                    //Remove the marker from array.
                    markers.splice(i, 1);
                    return;
                }
            }
        };   

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        ลงชื่อขอรับบริการ
    </h2>
    <div id="RequestPanel" runat="server">
        <table>
            <tr>
                <td>
                    เรื่อง :<asp:Label ID="lbl_requestField" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_title" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td>
                    ชื่อผู้ขอรับบริการ :<asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_desc" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td>
                    ประเภทงาน :<asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td rowspan="5" style="padding-left: 20px">
                    <asp:Button ID="btn_request" runat="server" Width="100px" Height="50px" Text="Request Work" />
                </td>
            </tr>
            <tr>
                <td>
                    วันที่ดำเนินงาน :<asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    เวลา :<asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_time" runat="server" Width="150px">
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
                <td colspan="2" rowspan="2" align="center" valign="center">
                    <asp:Label ID="lbl_error" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    เลือกเขต :<asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    เลือกแขวง :<asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    ที่อยู่ :<asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td colspan="5" align="left">
                    <asp:TextBox ID="txt_address" runat="server" Width="100%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Latitude :
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    Longtitude :
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    เบอร์โทรศัพท์ :<asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                </td>
                <td colspan="5" align="left">
                </td>
            </tr>
            <tr>
                <td valign="top" colspan="6">
                    <div id="googleMap" style="width: 100%; height: 350px; padding: 10px 0 15px 10px;">
                    </div>
                </td>
            </tr>
        </table>
    </div>
    
    
</asp:Content>
