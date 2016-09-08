var map;	
var latlng;
var marker;
var infowindow;
window.onload = function () {

       latlng = new google.maps.LatLng(13.7699866, 100.5507056);

    var mapOptions = {
        center: latlng,
        zoom: 12,
       
    };

    map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);


    UpdateMap();

}


window.onchange = function UpdateMap() {
    var geocoder = new google.maps.Geocoder();
  
    var address = document.getElementById("address").value;
  //  var address1 = document.getElementById("address1").value;
        if (geocoder) {
        geocoder.geocode({ 'address': address }, function (results, status) {
            var addr_type = results[0].types[0];
            if (status == google.maps.GeocoderStatus.OK)
                ShowserviceLocation(results[0].geometry.location, address, addr_type);
            else
                alert("Geocode was not successful for the following reason: " + status);
        });

    } 

    /* geocoder.geocode({'address': address}, function (results, status) {
        var addr_type = results[0].types[0];
        if (status == google.maps.GeocoderStatus.OK)
            ShowserviceLocation(results[0].geometry.location, address, addr_type);
        else
            alert("Geocode was not successful for the following reason: " + status);
    }); */

}


function ShowserviceLocation(latlng, address, addr_type) {
    
    map.setCenter(latlng);

    var zoom = 12;
    switch (addr_type) {
        case "administrative_area_level_1": zoom = 6; break;		
        case "locality": zoom = 10; break;	
        case "street_address": zoom = 15; break;		
    }
    map.setZoom(zoom);
     marker = new google.maps.Marker({
         position: latlng,
        map: map,
        title: address
    });
  
    // Create an InfoWindow for the marker
   var contentString = "" + address + "";	
   infowindow = new google.maps.InfoWindow({
        content: contentString
    });

  google.maps.event.addListener(marker, 'click', function (e) {
      var newLatlng = new google.maps.LatLng(e.latLng.lat(), e.latLng.lng());

         marker = new google.maps.Marker({
             position: newLatlng,
             map: map,
             labelAnchor: new google.maps.Point(e.latLng.lat(), e.latLng.lng())

         });
      
         var latitude = e.latLng.lat();
         var longitude = e.latLng.lng();
     
         $.ajax({
             method: "POST",
             url: "get_location.aspx",
             data: { lat: latitude, lng: longitude }
         }).done(function (e) {
              alert(e);
         });
      //   infowindow.open(map, marker);
     
       
  });
  

  setlocation();
} 

function setlocation() {
    $.ajax({
        type: "POST",
        url: "data_search.aspx",
    }).done(function (text) {
        var json = $.parseJSON(text);
        for (var i = 0; i < json.length; i++) {
            var lat = json[i].lat;
            var long = json[i].long;
            var location_name = json[i].location_name;
            //   alert(lat + " " +long+ " "+location_name)
            latlng = new google.maps.LatLng(lat, long);
        /*  var myCity = new google.maps.Circle({
                center: latlng,
                radius: 5000,
                strokeColor: "#0000FF",
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: "#0000FF",
                fillOpacity: 0.4,
                clickable: false
            }); 
            myCity.setMap(map);*/
            var makeroption = { map: map, html: location_name, position: latlng };
            // alert(makeroption)
            var marker = new google.maps.Marker(makeroption);
            google.maps.event.addListener(marker, 'click', function (e) {
              //  infowindow.setContent(this.html);
             //   infowindow.open(map, this);
            });


          
        }

    });
   
}

