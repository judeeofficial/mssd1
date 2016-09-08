<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="page_Default4" %>

<!DOCTYPE html>

<html>
<body>
<p id="demo">หาตำแหน่งของฉัน</p>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

<script>

var x=document.getElementById("demo");

function getLocation()
  {  if (navigator.geolocation)    {    navigator.geolocation.getCurrentPosition(showPosition);   }
  else{x.innerHTML="Geolocation is not supported by this browser.";}  }function showPosition(position)
  {  x.innerHTML="Latitude: " + position.coords.latitude +   "<br>Longitude: " + position.coords.longitude;      }

</script>
</body>
</html>