# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  $("a.tickOff").click ->
    parent = $(this).parent()
    parent.toggleClass("done")
    url = "/places/" + parent.data("id")
    $.ajax(
      url: url,
      type: 'PUT'
    )

  $("#clearLink").click ->
    $(".place").remove()

  $("#clearDone").click ->
    $(".done").remove()

  $(".place").each (i, obj) ->
    unless $(this).hasClass("done")
      lat = $(this).data("lat")
      lng = $(this).data("lng")
      setTimeout (->
        new google.maps.Marker(
          position: new google.maps.LatLng(lat, lng)
          map: window.map
          draggable: false
          animation: google.maps.Animation.DROP
        )
      ), (i+2)*1000/$(".place").length
