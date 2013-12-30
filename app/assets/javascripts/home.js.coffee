initialise_map = ->
  mapOptions =
    zoom: 13
    center: new google.maps.LatLng(51.5171, -0.15)
    mapTypeId: google.maps.MapTypeId.ROADMAP
  window.map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions)

initalise_autocomplete = ->
  input = document.getElementById("place_name")
  options =
    componentRestrictions:
      country: "uk"
  autocomplete = new google.maps.places.Autocomplete(input, options)
  return autocomplete

clearDone = ->
  $(".done").delete()

$ ->
  initialise_map()
  $.autocomplete = initalise_autocomplete()
  google.maps.event.addListener $.autocomplete, 'place_changed', ->
    location = $('#searchTextField').val();
    place = $.autocomplete.getPlace();

    # Inform the user that a place was not found and return.
    return unless place.geometry

    # If the place has a geometry, then present it on a map.
    if place.geometry.viewport
      # Use the viewport if it is provided.
      window.map.fitBounds place.geometry.viewport
    else
      # Otherwise use the location and set a chosen zoom level.
      window.map.setCenter place.geometry.location
      window.map.setZoom 17

    newMarker = new google.maps.Marker(
      position: place.geometry.location
      map: window.map
      draggable: false
      animation: google.maps.Animation.DROP
    )

    newInfoWindow = new google.maps.InfoWindow(content: location)

    google.maps.event.addListener newMarker, "click", ->
      window.openInfoWindow.close() if window.openInfoWindow
      newInfoWindow.open window.map, newMarker
      window.openInfoWindow = newInfoWindow

    $.post("/places",
      place:
        name: place.name
        lat: place.geometry.location.lat()
        lng: place.geometry.location.lng()
        reference: place.reference
        address: place.formatted_address
    ).done (data) ->
      $("#edit").append(data)
      $("#place_name").val("")