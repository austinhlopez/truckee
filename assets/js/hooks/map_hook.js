import L from "leaflet";

let MapHook = {
    mounted() {
	this.handleEvent("init-map", ({ geojson }) => {
	    let map = L.map(this.el, {
		center: JSON.parse(this.el.dataset.center),
		zoom: parseInt(this.el.dataset.zoom)
	    });

			 L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
			     maxZoom: 19,
			     attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
			 }).addTo(map);

			 function createTooltipContent(properties) {
			     var tooltipContent = "<strong>Feature Properties:</strong><br/>";
			     for (var key in properties) {
				 if (properties.hasOwnProperty(key)) {
				     tooltipContent += "<strong>" + key + ":</strong> " + properties[key] + "<br/>";
				 }
			     }
			     return tooltipContent;
			 }

			 /*let geojson = JSON.parse(geojson);*/
			 let geoJsonLayer = L.geoJSON(geojson, {
			     onEachFeature: function (feature, layer) {
				 if (feature.properties) {
				     layer.bindTooltip(createTooltipContent(feature.properties)); // Bind a tooltip to each feature
				 }
			     },
			     pointToLayer: function (feature, latlng) {
				 return L.circleMarker(latlng, {
				     radius: 8,
				     fillColor: "#ff7800",
				     color: "#000",
				     weight: 1,
				     opacity: 1,
				     fillOpacity: 0.8
				 });
			     }
			 }).addTo(map);

			 setTimeout(function(){ map.invalidateSize()}, 400);
			});
}
};

export default MapHook;
