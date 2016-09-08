<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchmap.aspx.cs" Inherits="htmltest_searchmap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
     <script type="text/javascript" src="../script/jquery-1.11.2.min.js"></script>
     <script type="text/javascript" src="../script/show_request_map.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="floating-panel">
      <input id="address" type="textbox" value="Sydney, NSW">
      <input id="submit" type="button" value="Geocode" onclick="initMap()">
    </div>
    <div id="map"></div>
    </div>
    </form>
</body>
</html>
