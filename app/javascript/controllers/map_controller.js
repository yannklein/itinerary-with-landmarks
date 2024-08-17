import { Controller } from '@hotwired/stimulus';
import mapboxgl from 'mapbox-gl'; // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    itineraryId: Number
  };

  static targets = ['mapElement', 'landmarks'];

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.mapElementTarget,
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [139.70822, 35.63392],
      zoom: 13,
    });

    this.map.on('load', () => this.getRoutes());

    this.map.on('contextmenu', (event) => {
      console.log(event);
      // this.direction.setOrigin([event.lngLat.lng, event.lngLat.lat]);
      new mapboxgl.Marker()
        .setLngLat([event.lngLat.lng, event.lngLat.lat])
        .addTo(this.map);

      const formData = new FormData();
      formData.append('landmark[latitude]', event.lngLat.lat);
      formData.append('landmark[longitude]', event.lngLat.lng);
      formData.append('landmark[name]', 'New Landmark');

      const csrfToken = document.querySelector("[name='csrf-token']").content

      const options = {
        method: 'POST',
        headers: { "Accept": "text/plain" },
        headers: {
          "X-CSRF-Token": csrfToken, // 👈👈👈 Set the token
        },
        body: formData,
      };

      fetch(`/itineraries/${this.itineraryIdTarget}/landmarks`, options)
        .then(response => response.text())
        .then((data) => {
          console.log(data);
          this.landmarksTarget.insertAdjacentHTML('beforeend',data)
        });
    });
  }

  getRoutes() {
    this.direction = new MapboxDirections({
      accessToken: mapboxgl.accessToken,
      routePadding: 50,
      controls: {
        inputs: false,
        instructions: false,
      },
    });

    this.map.addControl(this.direction, 'top-left');

    const start = [139.70822, 35.63392];
    const end = [139.70822, 35.73392];

    this.direction.setOrigin(start);
    this.direction.setDestination(end);

    this.direction.on('route', () => {
      const coords = this.direction
        .getWaypoints()
        .map((points) => points.geometry.coordinates);
      console.log([start, ...coords, end]);
    });
  }
}
