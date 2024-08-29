defmodule TruckeeWeb.MapLive do
  use Phoenix.LiveView

  alias Truckee.{FoodTrucks, GeoJSONEncoder}

  def mount(_params, _session, socket) do
    # Load your dataset, ensuring that it contains the required fields
    food_trucks = FoodTrucks.all_food_trucks()

    # Encode the dataset into GeoJSON
    geojson = GeoJSONEncoder.encode(food_trucks)

    # Pass the GeoJSON and map settings to the client
    socket =
      assign(socket,
        # Example coordinates
        map_center: [37.70, -122.38],
        map_zoom: 12.8
      )
      |> push_event("init-map", %{geojson: geojson})

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <div class="h-18 bg-slate-900 text-white text-2xl" id="header">
        <h1>Truckee. Tasty and data-driven :)</h1>
      </div>
      <div style="width: 100%; height: 100%; position: absolute">
        <div
          style="width: 1400px; height: 1000px;"
          id="map"
          phx-hook="MapHook"
          data-center={@map_center |> Jason.encode!()}
          data-zoom={@map_zoom}
        />
      </div>
    </div>
    """
  end
end
