var map;

function PriorityQueue() {
    this._nodes = [];

    this.enqueue = function (priority, key) {
        this._nodes.push({ key: key, priority: priority });
        this.sort();
    }
    this.dequeue = function () {
        return this._nodes.shift().key;
    }
    this.sort = function () {
        this._nodes.sort(function (a, b) {
            return a.priority - b.priority;
        });
    }
    this.isEmpty = function () {
        return !this._nodes.length;
    }
}

/**
 * Pathfinding starts here
 */
function Graph() {
    var INFINITY = 1 / 0;
    this.vertices = {};

    this.addVertex = function (name, edges) {
        this.vertices[name] = edges;
    }

    this.shortestPath = function (start, finish) {
        var nodes = new PriorityQueue(),
            distances = {},
            previous = {},
            path = [],
            smallest, vertex, neighbor, alt;

        for (vertex in this.vertices) {
            if (vertex === start) {
                distances[vertex] = 0;
                nodes.enqueue(0, vertex);
            }
            else {
                distances[vertex] = INFINITY;
                nodes.enqueue(INFINITY, vertex);
            }

            previous[vertex] = null;
        }

        while (!nodes.isEmpty()) {
            smallest = nodes.dequeue();

            if (smallest === finish) {
                path;

                while (previous[smallest]) {
                    path.push(smallest);
                    smallest = previous[smallest];
                }

                break;
            }

            if (!smallest || distances[smallest] === INFINITY) {
                continue;
            }

            for (neighbor in this.vertices[smallest]) {
                alt = distances[smallest] + this.vertices[smallest][neighbor];

                if (alt < distances[neighbor]) {
                    distances[neighbor] = alt;
                    previous[neighbor] = smallest;

                    nodes.enqueue(alt, neighbor);
                }
            }
        }

        return path;
    }
}
window.onload = function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(13.7699866, 100.5507056);
    var mapOptions = {
        zoom: 13,
        center: latlng
    }
    map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);
    setlocation();
}

function setlocation() {

    $.ajax({
        type: "POST",
        url: "../page/data_request.aspx",
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