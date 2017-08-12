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



//function locate(){
//	if(navigator.geolocation) {
//		navigator.geolocation.getCurrentPosition(initMap, fail);
//	}
//	else {
//		showError('Não suporta');
//	}
//}

function initMap(position) {
	//var myLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	//var lat = position;
	//console.log(lat);

	var posInitial = {lat: -22.536536, lng: -44.182143};
	var mapOptions = {
		zoom: 16,
		//center: myLatLng,
		center: posInitial,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	
	map = new google.maps.Map(document.getElementById('map'), mapOptions);
	
	var initMarker = new google.maps.Marker({
		position: posInitial,
		map: map,
		icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
	});
	//var userMarker = new google.maps.Marker({
	//	position: myLatLng,
	//	map: map	
	//});


	// Busca as latitudes e longitudes das ocorrências.
	$.ajax({
		type: "GET",
		dataType: "json",
		url: "/occurrences",
		success: function(data) {
			console.log(data);
			for(var i = 0; i < data.length; i++) {
				var pos = {lat: parseFloat(data[i].latitude), lng: parseFloat(data[i].longitude)}
				placeMarker(pos, data[i].id);
			}
		}
	});

  	google.maps.event.addListener(map, 'click', function(event) {
		limpaModal();
    	//document.getElementById("lat").value = event.latLng.lat();
    	//document.getElementById("long").value = event.latLng.lng();
    	var lat = event.latLng.lat();
    	var long = event.latLng.lng();
    	var posicao = {lat: lat, lng: long};
		$("#modalOcorrencia").modal("show");
		$("#occurrence_latitude").val(lat);
		$("#occurrence_longitude").val(long);
		$("#botaoSalvar").on("click", function() {
			$("#modalOcorrencia").modal("hide");
			placeMarker(posicao);
		})
  	});

  	
  	function placeMarker(location, id) {
  		id = id || null;
	    var marker = new google.maps.Marker({
	        position: location, 
	        map: map
	    });
    	
    	if(id != null) {
	    	google.maps.event.addListener(marker, 'click', function(event) {
	    			$("#modalOcorrencia").modal("show");
	    			getData(id);

				$("#botaoSalvar").on("click", function() {
					$("#modalOcorrencia").modal("hide");
				});


			});
			console.log(id);
		}

	}

	var autoCompleteInput = document.getElementById('endereco');
	var autoCompleteOpcoes = {
	  types: ['geocode']
	}

	autocomplete = new google.maps.places.Autocomplete(autoCompleteInput,autoCompleteOpcoes);

}

function fail() {
	console.log('esse browser nao suporta.');
}

function newLocation() {
	var local = autocomplete.getPlace();
	console.log(local);
	console.log(local.geometry.location);
	map.setCenter(local.geometry.location);
}

function getData(id) {
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "/home/getById",
		data: { id : id},
		success: function(occurrence) {
			preencheInputs(occurrence);
		}
	});
}

function preencheInputs(occurrence) {
	$("#occurrence_latitude").val(occurrence.latitude);
	$("#occurrence_longitude").val(occurrence.longitude);
	$("#occurrence_description").val(occurrence.description);
	$("#occurrence_data_begin").val(occurrence.data_begin);
	$("#occurrence_date_end").val(occurrence.date_end);
	$("#occurrence_status").val(occurrence.status);
	$("#occurrence_type_id").val(occurrence.type_id);
}

function limpaModal() {
	$("#occurrence_latitude").val('');
	$("#occurrence_longitude").val('');
	$("#occurrence_description").val('');
	$("#occurrence_data_begin").val('');
	$("#occurrence_date_end").val('');
	$("#occurrence_status").val('');
	$("#occurrence_type_id").val('');
}


$(document).ready(function(){
	setTimeout(function(){
		$(".alert.alert-success").remove();
	}, 3000);
});

//$(document).ready(function(){
//	$('#new_occurrence').submit(function() {  
//	    var valuesToSubmit = $(this).serialize();
//	    $.ajax({
//	        type: "POST",
//	        url: $(this).attr('action'), //sumbits it to the given url of the form
//	        data: valuesToSubmit,
//	        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
//	    }).success(function(json){
//	        console.log("success", json);
//	    });
//	    return false; // prevents normal behaviour
//	});
//});