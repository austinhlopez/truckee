defmodule YourApp.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :locationid, :integer
    field :applicant, :string
    field :facility_type, :string
    field :cnn, :integer
    field :location_description, :string
    field :address, :string
    field :blocklot, :string
    field :block, :string
    field :lot, :string
    field :permit, :string
    field :status, :string
    field :food_items, :string
    field :x, :float
    field :y, :float
    field :latitude, :float
    field :longitude, :float
    field :schedule, :string
    field :dayshours, :string
    field :noi_sent, :boolean
    field :approved, :string
    field :received, :string
    field :prior_permit, :boolean
    field :expiration_date, :string
    field :location, :string
    field :geom, Geo.PostGIS.Geometry

    timestamps()
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [
      :locationid,
      :applicant,
      :facility_type,
      :cnn,
      :location_description,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :food_items,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :dayshours,
      :noi_sent,
      :approved,
      :received,
      :prior_permit,
      :expiration_date,
      :location,
      :geom
    ])
    |> validate_required([
      :locationid,
      :applicant,
      :facility_type,
      :cnn,
      :address,
      :permit,
      :status
    ])
  end
end
