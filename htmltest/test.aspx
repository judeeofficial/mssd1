<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="htmltest_test" %>

<html lang="th">
<head>
<title>โปรแกรมคำนวณระยะทางระหว่างสถานที่ออนไลน์</title>
<meta charset="utf-8">
<meta http-equiv="content-language" content="th">
<meta name="country" content="th">
<meta name="robots" content="index, follow">
<meta name="robots" content="nocache">
<link rel="shortcut icon" href="http://www.kidlek.com/favicon.ico">
<link rel="profile" href="http://gmpg.org/xfn/11">
<!-- disable iPhone inital scale -->
<meta name="viewport" content="width=device-width; initial-scale=1.0">

<!-- html5.js for IE less than 9 -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!-- css3-mediaqueries.js for IE less than 9 -->
<!--[if lt IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->

﻿<!-- PopAds.net Popunder Code for www.kidlek.com 
<script type="text/javascript">
  var _pop = _pop || [];
  _pop.push(['siteId', 535528]);
  _pop.push(['minBid', 0]);
  _pop.push(['popundersPerIP', 0]);
  _pop.push(['delayBetween', 0]);
  _pop.push(['default', false]);
  _pop.push(['defaultPerDay', 0]);
  _pop.push(['topmostLayer', false]);
  (function() {
    var pa = document.createElement('script'); pa.type = 'text/javascript'; pa.async = true;
    var s = document.getElementsByTagName('script')[0]; 
    pa.src = '//c1.popads.net/pop.js';
    pa.onerror = function() {
      var sa = document.createElement('script'); sa.type = 'text/javascript'; sa.async = true;
      sa.src = '//c2.popads.net/pop.js';
      s.parentNode.insertBefore(sa, s);
    };
    s.parentNode.insertBefore(pa, s);
  })();
</script>
 PopAds.net Popunder Code End -->
 
 
 
 <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <script type="text/javascript">

  if (screen.width <= 800) {
    window.location = "http://line.me/ti/p/%40gjb0543d";
  }

</script> -->




<link type="text/css" rel="stylesheet" href="http://www.kidlek.com/fb/fb-traffic-pop.css">
<script type="text/javascript" src="http://www.kidlek.com/fb/jquery.js"></script>
<script type="text/javascript" src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script>
<script type="text/javascript" src="http://www.kidlek.com/fb/fb-traffic-pop.js"></script>
<script language="javascript"> 	
				jQuery(document).ready(function() {		
					jQuery().facebookTrafficPop({
						'timeout':'30', 
						'title':'คิดเลข!',
						'message':'กรุณาคลิกปุ่ม Like ก่อนเข้าเว็บ ขอบคุณค่ะ',
						'url':'https://www.facebook.com/mama.pillow',
						'lang':'en',
						'wait':'1',
						'opacity':'0.60',
						'advancedClose':false,
						'closeable':false,
						'showfaces':true});			
				});	
			</script> 
<meta name="keywords" content="คำนวณระยะทาง, คำนวณระยะทางระหว่างสถานที่">
<meta property="og:description" content="โปรแกรมคํานวณระยะทางระหว่างสถานที่ออนไลน์">
<meta property="og:site_name" content="kidlek.com">
<link rel='canonical' href='http://www.kidlek.com/distance.php'>

<style>


/*main css*/

/************************************************************************************
RESET
*************************************************************************************/
html, body, address, blockquote, div, dl, form, h1, h2, h3, h4, h5, h6, ol, p, pre, table, ul,
dd, dt, li, tbody, td, tfoot, th, thead, tr, button, del, ins, map, object,
a, abbr, acronym, b, bdo, big, br, cite, code, dfn, em, i, img, kbd, q, samp, small, span,
strong, sub, sup, tt, var, legend, fieldset {
	margin: 0;
	padding: 0;
}

img, fieldset {
	border: 0;
}

/* set image max width to 100% */
img {
	max-width: 100%;
	height: auto;
	width: auto\9; /* ie8 */
}

/* set html5 elements to block */
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { 
    display: block;
}

/************************************************************************************
GENERAL STYLING
*************************************************************************************/
body {
	
	font: 1em/150% Arial, Helvetica, sans-serif;
	color: #666;
}
a {
	color: #5C5959;
	text-decoration: none;
	outline: none;
}
a:hover {
	text-decoration: none;
}
p {
	margin: 0 0 0.5em;
	padding: 0;
}

/* list */
ul, ol {
	margin: 1em 0 1.4em 24px;
	padding: 0;
	line-height: 140%;
}
li {
	margin: 0 0 .5em 0;
	padding: 0;
}

/* headings */
h1, h2, h3, h4, h5, h6 {
	line-height: 1.4em;
	/*margin: 20px 0 .4em;*/
	color: #000;
}
h1 {
	font-size: 2em;
}
h2 {
	font-size: 1.6em;
}
h3 {
	font-size: 1.4em;
}
h4 {
	font-size: 1.2em;
}
h5 {
	font-size: 1.1em;
}
h6 {
	font-size: 1em;
}

/* reset webkit search input styles */
input[type=search] {
	-webkit-appearance: none;
	outline: none;
}
input[type="search"]::-webkit-search-decoration, 
input[type="search"]::-webkit-search-cancel-button {
	display: none;
}

/************************************************************************************
STRUCTURE
*************************************************************************************/
#pagewrap {
	width: 980px;
	margin: 0 auto;
}

/************************************************************************************
HEADER
*************************************************************************************/
#header {
	position: relative;
	height: 160px; margin-bottom: 20px;
	
}

/* site logo */
#site-logo {
	position: absolute;
	
}
#site-logo a {
	font: bold 30px/100% Arial, Helvetica, sans-serif;
	color: #3DBDFF;
	text-decoration: none;
}

/* site description */
#site-description {
	
	color: #CCCCCC;
	position: absolute;
	top: 75px;
	margin-left: 40px;
}

/* searchform */
#searchform {
	position: absolute;
	right: 10px;
	bottom: 6px;
	z-index: 100;
	width: 160px;
}
#searchform #s {
	width: 140px;
	float: right;
	background: #fff;
	border: none;
	padding: 6px 10px;
	/* border radius */
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	/* box shadow */
	-webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: inset 0 1px 2px rgba(0,0,0,.2);
	box-shadow: inset 0 1px 2px rgba(0,0,0,.2);
	/* transition */
	-webkit-transition: width .7s;
	-moz-transition: width .7s;
	transition: width .7s;
}

/************************************************************************************
MAIN NAVIGATION
*************************************************************************************/
#main-nav {
	width: 100%;
	background: #00A1C7;
	margin: 0;
	padding: 0;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: 100;
	/* gradient */
	background: #6a6a6a url(images/nav-bar-bg.png) repeat-x;
	background: -webkit-gradient(linear, left top, left bottom, from(#6CC8CB), to(#00A1C7));
	background: -moz-linear-gradient(top,  #6CC8CB,  #00A1C7);
	background: linear-gradient(-90deg, #6CC8CB, #00A1C7);
	/* rounded corner */
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	/* box shadow */
	-webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,.3), 0 1px 1px rgba(0,0,0,.4);
	-moz-box-shadow: inset 0 1px 0 rgba(255,255,255,.3), 0 1px 1px rgba(0,0,0,.4);
	box-shadow: inset 0 1px 0 rgba(255,255,255,.3), 0 1px 1px rgba(0,0,0,.4);
}
#main-nav li {
	margin: 0;
	padding: 0;
	list-style: none;
	float: left;
	position: relative;
}
#main-nav li:first-child {
	margin-left: 10px;
}
#main-nav a {
	line-height: 100%;
	font-weight: bold;
	color: #fff;
	display: block;
	padding: 14px 15px;
	text-decoration: none;
	text-shadow: 0 -1px 0 rgba(0,0,0,.5);
}
#main-nav a:hover {
	color: #fff;
	background: #0E75CB;
	/* gradient */
	/*background: -webkit-gradient(linear, left top, left bottom, from(#282828), to(#147ED7));
	background: -moz-linear-gradient(top,  #282828,  #147ED7);
	background: linear-gradient(-90deg, #282828, #147ED7);*/
}

/************************************************************************************
CONTENT
*************************************************************************************/
#content {
	background: #fff;
	margin: 20px 0 20px;
	padding: 20px 35px;
	width: 600px;
	float: left;
	/* rounded corner */
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	/* box shadow */
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,.4);
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,.4);
	box-shadow: 0px 0px 12px rgba(203, 203, 203, 1);
}

/* post */
.post {
	margin-bottom: 40px;
}
.post-title {
	margin: 0 0 5px;
	padding: 0;
	font: bold 26px/120% Arial, Helvetica, sans-serif;
}
.post-title a {
	text-decoration: none;
	color: #000;
}
.post-meta {
	margin: 0 0 10px;
	font-size: 90%;
}

/* post image */
.post-image {
	margin: 0 0 15px;
}

/************************************************************************************
SIDEBAR
*************************************************************************************/
#sidebar {
	width: 280px;
	float: right;
	margin: 20px 0 30px;
}
.widget {
	background: #fff;
	margin: 0 0 30px;
	padding: 10px 20px;
	/* rounded corner */
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	/* box shadow */
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,.4);
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,.4);
	box-shadow: 0px 0px 12px rgba(203, 203, 203, 1);
}
.widgettitle {
	margin: 0 0 5px;
	padding: 0;	
}
.widget ul {
	margin: 0;
	padding: 0;
}
.widget li {
	margin-left: 10px;
	padding-bottom: 2px;
	padding-top: 5px;
	list-style-type: circle;
	clear: both;
	border-top: solid 1px #eee;
}

/* flickr widget */
.widget .flickr_badge_image {
	margin-top: 10px;
}
.widget .flickr_badge_image img {
	width: 48px;
	height: 48px;
	margin-right: 12px;
	margin-bottom: 12px;
	float: left;
}

.content-box-program-inputbox{
		font-size: 20px;
		-moz-border-radius: 3px;
		-webkit-border-radius: 3px;
		border-radius: 5px;
		border: 1px solid #E0E0E0;
		margin-bottom: 5px;
		
}

.content-box-program-bottoncalc{
                font-size: 17px;
                padding: 4px 12px;
		-moz-border-radius: 3px;
		-webkit-border-radius: 3px;
		border-radius: 5px;
		border: 1px solid;
		width: 100px;
		color: #fff;
text-shadow: 0 -1px 0 rgba(0,0,0,0.25);
background-color: #5bb75b;
background-image: -moz-linear-gradient(top,#62c462,#51a351);
background-image: -webkit-gradient(linear,0 0,0 100%,from(#62c462),to(#51a351));
background-image: -webkit-linear-gradient(top,#62c462,#51a351);
background-image: -o-linear-gradient(top,#62c462,#51a351);
background-image: linear-gradient(to bottom,#62c462,#51a351);
background-repeat: repeat-x;
border-color: #51a351 #51a351 #387038;
border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
}
.content-box-program-bottoncalc:hover{
                font-size: 17px;
                padding: 4px 12px;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                cursor:pointer;
                border-radius: 5px;
                border: 1px solid;
                width: 100px;
                color: #fff;
                text-shadow: 0 -1px 0 rgba(0,0,0,0.25);
                background-color: #6ACF6A;
                background-image: -moz-linear-gradient(top,#62c462,#51a351);
                background-image: -webkit-gradient(linear,0 0,0 100%,from(#7BA77B),to(#51a351));
                background-image: -webkit-linear-gradient(top,#62c462,#51a351);
                background-image: -o-linear-gradient(top,#62c462,#51a351);
                background-image: linear-gradient(to bottom,#62c462,#098509);
                background-repeat: repeat-x;
                border-color: #096909 #51a351 #4C614C;
                border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
}
.content-box-program textarea{
	font-size: 20px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 5px;
	border: 1px solid #E0E0E0;
	width: 550px;
	height: 50px;
}
/************************************************************************************
FOOTER
*************************************************************************************/
#footer {
	clear: both;
	color: #ccc;
	font-size: 100%;
}
#footer a {
	color: #fff;
}

/************************************************************************************
CLEARFIX
*************************************************************************************/
.clearfix:after { visibility: hidden; display: block; font-size: 0; content: " "; clear: both; height: 0; }
.clearfix { display: inline-block; }
.clearfix { display: block; zoom: 1; }

/*Mobile css*/
/************************************************************************************
smaller than 980
*************************************************************************************/
@media screen and (max-width: 980px) {

	/* pagewrap */
	#pagewrap {
		width: 95%;
	}

	/* content */
	#content {
		width: 60%;
		padding: 3% 4%;
	}
	/* sidebar */
	#sidebar {
		width: 30%;
	}
	#sidebar .widget {
		padding: 8% 7%;
		margin-bottom: 10px;
	}

	/* embedded videos */
	.video embed,
	.video object,
	.video iframe {
		width: 100%;
		height: auto;
		min-height: 300px;
	}
	

}

/************************************************************************************
smaller than 650
*************************************************************************************/
@media screen and (max-width: 650px) {

	/* header */
	#header {
		height: auto;
	}

	/* search form */
	#searchform {
		position: absolute;
		top: 5px;
		right: 0;
		z-index: 100;
		height: 40px;
	}
	#searchform #s {
		width: 70px;
	}
	#searchform #s:focus {
		width: 150px;
	}

	/* main nav */
	#main-nav {
		position: static;
	}

	/* site logo */
	#site-logo {
		margin: 0px 0px 0px 0;
		position: static;
	}

	/* site description */
	#site-description {
		margin: 0 0 0px;
		position: static;
		font-size: 99%;
		padding-bottom:5px;
		margin-left:10px;
	}

	/* content */
	#content {
		width: auto;
		float: none;
		margin: 20px 0;
	}


	/* sidebar */
	#sidebar {
		width: 100%;
		margin: 0;
		float: none;
	}
	#sidebar .widget {
		padding: 3% 4%;
		margin: 0 0 10px;
	}

	/* embedded videos */
	.video embed,
	.video object,
	.video iframe {
		min-height: 250px;
	}

}

/************************************************************************************
smaller than 560
*************************************************************************************/
@media screen and (max-width: 480px) {

	/* disable webkit text size adjust (for iPhone) */
	html {
		-webkit-text-size-adjust: none;
	}

	/* main nav */
	#main-nav a {
		font-size: 90%;
		padding: 10px 8px;
	}



}


</style>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="../script/show_request_map.js"></script>


</head>

<body>


		


	<div id="content">

		<article class="post clearfix">

	
			<header>
				<center><h1 class="post-title">คำนวณระยะทางระหว่างสถานที่</h1></center>

			</header>
<center>
<div id="form">
		<table align="center" valign="center">
			<tr>
				<td colspan="7">&nbsp;</td>
			</tr>
			<tr>
				<td>จุดเริ่มต้น </td>
				<td>&nbsp;</td>
				<td><input type="text" name="address1" id="address1" size="15" class='content-box-program-inputbox'></td>
			</tr>
			<tr>
				<td>ปลายทาง </td>
				<td>&nbsp;</td>
				<td><input type="text" name="address2" id="address2" size="15" class='content-box-program-inputbox'></td>
			</tr>
			<tr>
				<td colspan="7">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="7" align="center"><input type="button" value="คำนวณ" class='content-box-program-bottoncalc' onclick="initialize();"/></td>
			</tr>
		</table>
	</div>
	<center><div style="width:100%; height:10%" id="distance_direct"></div></center>
	<center><div style="width:100%; height:10%" id="distance_road"></div></center>
	<br>
	<center><div id="map_canvas" style="width:250px; height:300px"></div></center>
</center>

</body>
</html>