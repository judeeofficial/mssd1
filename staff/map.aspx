<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits="staff_map" %>

<html>
  <head>
    <title>Geocoding with GMap v3</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
.ui-autocomplete {
	background-color: white;
	width: 300px;
	border: 1px solid #cfcfcf;
	list-style-type: none;
	padding-left: 0px;
}
</style>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css" type="text/css" />
	<script type="text/javascript">
var geocoder;
var map;
var marker;
    
function initialize(){
  var latlng = new google.maps.LatLng(15.092211605036871,104.32937908834231);
  var options = {
    zoom: 16,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.SATELLITE
  };
        
  map = new google.maps.Map(document.getElementById("map_canvas"), options);
        
//ใช้ GEOCODER
  geocoder = new google.maps.Geocoder();        
  marker = new google.maps.Marker({
    map: map,
    draggable: true
  });
				
}
		
$(document).ready(function() {          
  initialize();				  
  $(function() {
    $("#address").autocomplete({
      source: function(request, response) {
        geocoder.geocode( {'address': request.term }, function(results, status) {
          response($.map(results, function(item) {
            return {
              label:  item.formatted_address,
              value: item.formatted_address,
              latitude: item.geometry.location.lat(),
              longitude: item.geometry.location.lng()
            }
          }));
        })
      },
      select: function(event, ui) {
        $("#latitude").val(ui.item.latitude);
        $("#longitude").val(ui.item.longitude);
        var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
        marker.setPosition(location);
        map.setCenter(location);
      }
    });
  });
	

  google.maps.event.addListener(marker, 'drag', function() {
    geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          $('#address').val(results[0].formatted_address);
          $('#latitude').val(marker.getPosition().lat());
          $('#longitude').val(marker.getPosition().lng());
        }
      }
    });
  });
  
});
	</script>
  </head>
  <body>
    <label>ที่อยู่:  </label><input id="address"  type="text" size="50" />
    <div id="map_canvas" style="width:640px; height:480px"></div><br/>
    <label>latitude: </label><input id="latitude" type="text"/><br/>
    <label>longitude: </label><input id="longitude" type="text"/>
  </body>
</html>
