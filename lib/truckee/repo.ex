require Protocol

Protocol.derive(Jason.Encoder, Geo.Point)
Protocol.derive(Jason.Encoder, Geo.LineString)
Protocol.derive(Jason.Encoder, Geo.Polygon)
Protocol.derive(Jason.Encoder, Geo.MultiPoint)
Protocol.derive(Jason.Encoder, Geo.MultiLineString)
Protocol.derive(Jason.Encoder, Geo.MultiPolygon)
Protocol.derive(Jason.Encoder, Geo.GeometryCollection)

defmodule Truckee.Repo do
  use Ecto.Repo,
    otp_app: :truckee,
    adapter: Ecto.Adapters.Postgres

  def init(_, opts) do
    # To use PostGIS Extension for handling geometries
    Postgrex.Types.define(
      Truckee.PostgresTypes,
      [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
      json: Jason
    )

    {:ok, opts}
  end
end
