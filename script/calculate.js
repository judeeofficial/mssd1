function calculateRoute() {
    var start = "lands end, england";
    var end = "john o'groats, scotland";

    var directionsService = new google.maps.DirectionsService();

    var request = {
        origin: start,
        destination: end,
        travelMode: google.maps.DirectionsTravelMode.DRIVING
    };

    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            var distance = response.routes[0].legs[0].distance.value / 1609.344;
            alert(distance);
        }
    });
}