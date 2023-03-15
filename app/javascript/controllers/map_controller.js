import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/fupharah/clerc1p1u000h01mtjyh0p1l8"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    if (this.markersValue) {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)

      })
    }
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}



// #addMarkersToMap() {
//   if (this.markersValue) {
//     this.markersValue.forEach((marker) => {
//       // Create a new custom marker element
//       const customMarker = document.createElement("div")
//       customMarker.style.backgroundImage = `url('${marker.icon_url}')`
//       customMarker.style.backgroundSize = "contain"
//       customMarker.style.width = "50px"
//       customMarker.style.height = "50px"

//       // Create a new popup for the marker
//       const popup = new mapboxgl.Popup({ offset: 25 }).setHTML(marker.info_window_html)

//       // Create a new Mapbox marker with the custom marker element and popup
//       new mapboxgl.Marker(customMarker)
//         .setLngLat([marker.lng, marker.lat])
//         .setPopup(popup)
//         .addTo(this.map)
//     })
//   }
// }

// const marker = {
//   icon_url: "https://example.com/my-marker-icon.png",
// };
