window.onload = function () {

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position){ 
            var latitude= position.coords.latitude; 
            var longitude = position.coords.longitude;
            $.ajax({
                method: "POST",
                url: "get_location.aspx",
                data: { latitude: latitude, longitude: longitude }
            }).done(function (text) {

                alert("ddddddd");

            });

        });
        }else{

          }

 

        };

