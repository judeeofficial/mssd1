var location1;
var location2;

var address1;
var address2;

var latlng;
var geocoder;
var map;

var distance;
var showdistance;
window.onload = function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(13.7699866, 100.5507056);
    var mapOptions = {
        zoom: 13,
        center: latlng
    }
    map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);
}

function codeAddress() {
    var address1 = document.getElementById('address1').value;
    var address2 = document.getElementById('address2').value;
    if (geocoder) {
        geocoder.geocode({ 'address': address1 }, function (results, status) {
            if (status == 'OK') {
                location1 = results[0].geometry.location;
                map.setCenter(location1); 
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
        geocoder.geocode({ 'address': address2 }, function (results, status) {
            if (status == 'OK') {
                location2 = results[0].geometry.location
                map.setCenter(location2);
               
                showMap();
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }

}

function showMap() {
    latlng = new google.maps.LatLng((location1.lat() + location2.lat()) / 2, (location1.lng() + location2.lng()) / 2);

  
    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer(
    {
        suppressMarkers: true,
        suppressInfoWindows: true
    });
    directionsDisplay.setMap(map);
    $.ajax({
        type: "POST",
        url: "../page/data_search.aspx",
    }).done(function (text) {
        var json = $.parseJSON(text);
        for (var i = 0; i < json.length; i++) {
            var lat = json[i].lat;
            var long = json[i].long;
            var location_name = json[i].location_name;
            latlng = new google.maps.LatLng(lat, long);
            var marker1 = new google.maps.Marker({
                map: map,
                position: location1,
                title: "First location"
            });
            var marker2 = new google.maps.Marker({
                map: map,
                html: location_name,
                position: latlng
            });
            var request = {
                origin: location1,
                destination: latlng,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
            var latitude = location1.lat();
            var longitude = location1.lng();
            $.ajax({
                method: "POST",
                url: "../page/get_location.aspx",
                data: { lat: latitude, lng: longitude }
            }).done(function (e) {
                alert("ค้นหาสถานที่สำเร็จ");
            });
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    distance = response.routes[0].legs[0].distance.value;
                    showdistance = response.routes[0].legs[0].distance.text;
                    $.ajax({
                        method: "POST",
                        url: "../page/distencekm.aspx",
                        data: { distance: distance }
                    }).done(function (e) {
                        alert(e);
                    });
                  //  distance += "<br/>ใช้เวลาประมาณ : " + response.routes[0].legs[0].duration.text;
                    document.getElementById("distance_road").innerHTML = showdistance;
                }
            });
            var line = new google.maps.Polyline({
                map: map,
                path: [location1, latlng],
                strokeWeight: 7,
                strokeOpacity: 0.8,
                strokeColor: "#FFAA00"
            });

            var R = 6371;
            var dLat = toRad(lat - location1.lat());
            var dLon = toRad(long - location1.lng());

            var dLat1 = toRad(location1.lat());
            var dLat2 = toRad(lat);

            var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                    Math.cos(dLat1) * Math.cos(dLat1) *
                    Math.sin(dLon / 2) * Math.sin(dLon / 2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            var d = R * c;

        }

    });
  


   // document.getElementById("distance_direct").innerHTML = "<br/>ระยะห่างแนวตรง : " + d;
}

function toRad(deg) {
    return deg * Math.PI / 180;
}