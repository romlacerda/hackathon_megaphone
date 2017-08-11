// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sass
//= require bootstrap-material-design
//= require jquery_nested_form
//= require jquery-ui
//= require_self

$(document).ready(function(){
	$.material.init();
});

function locate(){
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(initMap, fail);
	}
	else {
		showError('Não suporta');
	}
}

function initMap(position) {
	var myLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	var lat = position;
	console.log(lat);

	var mapOptions = {
		zoom: 16,
		center: myLatLng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(document.getElementById('map'), mapOptions);

	var userMarker = new google.maps.Marker({
		position: myLatLng,
		map: map	
	})
}

function fail() {
	alert('esse browser nao suporta.');
}