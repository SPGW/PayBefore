import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }


  connect() {
    let bounds = [[this.markersValue.lng - 0.25, this.markersValue.lat - 0.25],
    [this.markersValue.lng + 0.25, this.markersValue.lat + 0.25]];
    console.log(bounds)
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.markersValue.lng)
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/aag88/clx1iyqvy001f01qs7b1h78lv",
      center: [this.markersValue.lng, this.markersValue.lat],
      zoom: 12,
      maxBounds: bounds
    })
    this.#fitMapToMarkers()
    this.#addMarkersToMap()
  }

  #addMarkersToMap() {
      new mapboxgl.Marker()
        .setLngLat([ this.markersValue.lng, this.markersValue.lat ])
        .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markersValue.lng, this.markersValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
