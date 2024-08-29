defmodule Truckee.FoodTruckTest do
  use ExUnit.Case
  alias Truckee.FoodTruck

  describe "changeset/2" do
    @valid_attrs %{
      location_id: 1,
      applicant: "Joe's Food Truck",
      facility_type: "Truck",
      cnn: 12345,
      location_description: "Near the park",
      address: "123 Main St",
      block_lot: "1234-567",
      block: "1234",
      lot: "567",
      permit: "XYZ-12345",
      status: "APPROVED",
      food_items: "Tacos, Burritos, Drinks",
      x: -122.4194,
      y: 37.7749,
      latitude: 37.7749,
      longitude: -122.4194,
      schedule: "M-F 9am-5pm",
      days_hours: "Monday to Friday",
      noi_sent: true,
      approved: "Yes",
      received: "2024-08-29",
      prior_permit: true,
      expiration_date: "2024-12-31",
      geom: %Geo.Point{coordinates: {-122.4194, 37.7749}, srid: 4326}
    }

    @invalid_attrs %{
      location_id: nil,
      applicant: nil,
      facility_type: nil,
      cnn: nil,
      location_description: nil,
      address: nil,
      block_lot: nil,
      block: nil,
      lot: nil,
      permit: nil,
      status: nil,
      food_items: nil,
      x: nil,
      y: nil,
      latitude: nil,
      longitude: nil,
      schedule: nil,
      days_hours: nil,
      noi_sent: nil,
      approved: nil,
      received: nil,
      prior_permit: nil,
      expiration_date: nil,
      geom: nil
    }

    test "changeset with valid attributes" do
      changeset = FoodTruck.changeset(%FoodTruck{}, @valid_attrs)
      assert changeset.valid?
    end

    test "changeset with invalid attributes" do
      changeset = FoodTruck.changeset(%FoodTruck{}, @invalid_attrs)
      refute changeset.valid?
    end

    test "changeset requires mandatory fields" do
      required_fields = [
        :location_id,
        :applicant,
        :facility_type,
        :cnn,
        :address,
        :permit,
        :status,
        :geom
      ]

      changeset = FoodTruck.changeset(%FoodTruck{}, %{})

      for field <- required_fields do
        assert %{^field => ["can't be blank"]} = errors_on(changeset)
      end
    end
  end

  defp errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      # You can customize the error message formatting here if needed
      msg
    end)
  end
end
