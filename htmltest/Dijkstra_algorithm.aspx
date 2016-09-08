﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dijkstra_algorithm.aspx.cs" Inherits="htmltest_Dijkstra_algorithm" %>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Test</title>
	<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>	
	<style type="text/css"> 
		html, body, #map {  height: 100%;  margin: 0; }
		body{ font-family:Arial, Helvetica, sans-serif;  font-size:13px; }
		.info, .success, .warning, .error, .validation { border: 1px solid; margin: 10px 0px; padding:15px 10px 15px 50px; background-repeat: no-repeat; background-position: 10px center; }
		.info { color: #00529B;background-color: #BDE5F8;}
		.success {color: #4F8A10;background-color: #DFF2BF;}
		.warning {color: #9F6000;background-color: #FEEFB3;}
		.error {color: #D8000C;background-color: #FFBABA;}		 
	</style>
</head>
<body>
<div class="info">Dobrodošli na sustav za navigaciju <br> Kliknite na ulicu unutar poligona kako biste kreirali rutu</div>
<div class="warning" style="display:none">Ruta se kreira. Ruta će se pojaviti nakon što se podaci obrade. Budite strpljivi, ova operacija može potrajati do 30 sekundi</div>
<div class="success" style="display:none">Ruta kreirana</div>
<div id="map"></div>
</body>
</html>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script>
var last = new google.maps.LatLng(45.5580, 18.7134);
var infowindow = new google.maps.InfoWindow({ content:"Šaljem hitnu OVDJE" });
var granicaDosega = new Array();
granicaDosega.push(new google.maps.LatLng(45.560794465,18.720910185));
granicaDosega.push(new google.maps.LatLng(45.554514236,18.721532458));
granicaDosega.push(new google.maps.LatLng(45.557969951,18.706876868));
granicaDosega.push(new google.maps.LatLng(45.560148445,18.715073698));
granicaDosega.push(new google.maps.LatLng(45.561170055,18.718828791));
var map;
window.onload = function() {
    var latlng = new google.maps.LatLng(45.5580, 18.7134);
    map = new google.maps.Map(document.getElementById('map'), {
        center: latlng,
        zoom: 16,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    var marker_bolnica = new google.maps.Marker({
        position: latlng,
        map: map,
        title: 'KBC Osijek'
    });
	var Polygon = new google.maps.Polygon({
		paths: granicaDosega,
		strokeColor: '#00FF00',
		strokeOpacity: 1,
		strokeWeight: 2,
		fillColor: '#00FF00',
		fillOpacity: 0.1
	}); 
	Polygon.setMap(map); 
	google.maps.event.addListener(Polygon, 'click', function(event) {        
	    var marker = new google.maps.Marker({
	        position: event.latLng,
	        map: map,
	        title: 'Novi marker'
	    }); 
	    infowindow.open(map,marker);
	    findPath(event.latLng.d.toFixed(9), event.latLng.e.toFixed(9));
	    $('.info').hide();
	    $('.warning').show();
	    $('.success').hide();
	    //console.log(event.latLng.nb.toFixed(9)+" "+event.latLng.ob.toFixed(9));	    
	});  
};
function findPath(a,b) {
  jQuery.ajax({
    url: "findPath.php?lat="+a+"&lng="+b,
    cache: false,
    dataType: "json",
    success: function(json) {
		prev_lat = 45.557986854;
		prev_lng = 18.713400671;
		$.each(json, function(index, value) {	    	
			drawLine(prev_lat,prev_lng,value[0],value[1]);
			prev_lat = value[0];
			prev_lng = value[1];
		});
    }
  });
}
function drawLine(lat1,lng1,lat2,lng2){
	var lineCoords = new Array();
	lineCoords.push(new google.maps.LatLng(parseFloat(lat1), parseFloat(lng1)));
	lineCoords.push(new google.maps.LatLng(parseFloat(lat2), parseFloat(lng2)));
	makeLine = new google.maps.Polygon({
		paths: lineCoords,
		strokeColor: '#0000FF',
		strokeOpacity: 1,
		strokeWeight: 5,
		fillColor: '#00FF00',
		fillOpacity: 0
	});
	makeLine.setMap(map);
	$('.info').hide();
	$('.warning').hide();
	$('.success').show();
}
</script>
