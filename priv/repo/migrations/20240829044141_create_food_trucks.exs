defmodule Truckee.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :location_id, :integer
      add :applicant, :string
      add :facility_type, :string
      add :cnn, :integer
      add :location_description, :text
      add :address, :string
      add :block_lot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :text
      add :x, :float
      add :y, :float
      add :latitude, :float
      add :longitude, :float
      add :schedule, :string
      add :days_hours, :string
      add :noi_sent, :string
      add :approved, :string
      add :received, :string
      add :prior_permit, :integer
      add :expiration_date, :string
      add :location, :string

      add :geom, :geometry

      timestamps()
    end

    create index(:food_trucks, [:location_id])
    create index(:food_trucks, [:permit])
    create index(:food_trucks, [:status])
    create index(:food_trucks, [:geom], using: :gist)
  end
end
