defmodule Truckee.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc "Food Truck schema."

  schema "food_trucks" do
    field :location_id, :integer
    field :applicant, :string
    field :facility_type, :string

    # centerline network number
    field :cnn, :integer
    field :location_description, :string
    field :address, :string
    field :block_lot, :string
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
    field :days_hours, :string

    # legal and permit statuses
    # notice of intent
    field :noi_sent, :boolean
    field :approved, :string
    field :received, :string
    field :prior_permit, :boolean
    field :expiration_date, :string
    field :geom, Geo.PostGIS.Geometry

    timestamps()
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [
      :location_id,
      :applicant,
      :facility_type,
      :cnn,
      :location_description,
      :address,
      :block_lot,
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
      :days_hours,
      :noi_sent,
      :approved,
      :received,
      :prior_permit,
      :expiration_date,
      :geom
    ])
    |> validate_required([
      :location_id,
      :applicant,
      :facility_type,
      :cnn,
      :address,
      :permit,
      :geom,
      :status
    ])

    # required was auto-generated
    # for now. Which details are
    # required depends on
    # product decisions
  end
end
