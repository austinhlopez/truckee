defmodule Truckee.GeoJSONEncoder do
  def encode(data) do
    %{
      "type" => "FeatureCollection",
      "features" => Enum.map(data, &map_to_feature/1)
    }
  end

  defp map_to_feature(%{geom: geom} = data) do
    %{
      "type" => "Feature",
      "geometry" => geom_to_geojson(geom),
      "properties" => get_properties(data)
    }
  end

  defp geom_to_geojson(%Geo.Point{coordinates: {long, lat}}) do
    %{
      "type" => "Point",
      "coordinates" => [long, lat]
    }
  end

  defp get_properties(data) do
    data
    |> Map.take([:applicant, :facility_type, :food_items, :days_hours])
  end
end
