var map;
var infowindow;
var geocoder;

window.onload = function () {

    var mapOptions = {
        center: new google.maps.LatLng(13.7699866, 100.5507056),
        zoom: 10,
        mapTypeId: google.maps.MapTypeId.ROADMAP

    };
    map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);


    infowindow = new google.maps.InfoWindow();
    //  setlocation();
    locationtaker();
}
function locationtaker() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            var pos = new google.maps.LatLng(latitude, longitude);
            geocoder = new google.maps.Geocoder();
            var marker = new google.maps.Marker({
                position: pos,
                map: map,
          
            });

        $.ajax({
                method: "POST",
                url: "get_location.aspx",
                data: { lat: latitude, lng: longitude }
            }).done(function (text) {
                alert(text);
            }); 
            


        });

    } else {

    }
 

}

/**     function setlocation() {
$.ajax({
        type: "POST",
        url: "district1.ashx",
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

} **/
