# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs

alias Truckee.Repo
alias Truckee.FoodTruck

# Step 1: Load the JSON file
json_path = Path.join(["priv", "repo", "food_trucks.json"])
{:ok, json_content} = File.read(json_path)

# Step 2: Parse the JSON data
parsed_data = Jason.decode!(json_content)

# Step 3: Insert the data into the database within a transaction
Repo.transaction(fn ->
  # see 'food_trucks.json for format
  # json meta key contains column names for the dataset
  field_array =
    parsed_data["meta"]["view"]["columns"]
    |> Enum.map(fn c ->
      IO.inspect(c)
      c["name"]
    end)

  # Each 'item' is a row of data
  for row <- parsed_data["data"] do
    item_map =
      row
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {item, i}, acc ->
        Map.put(acc, Enum.at(field_array, i), item)
      end)

    # just in case we encounter misformatted data      
    try do
      long = item_map |> Map.get("Longitude") |> String.to_float()
      lat = item_map |> Map.get("Latitude") |> String.to_float()

      geom = %{
        "coordinates" => [long, lat],
        "srid" => 4326,
        "type" => "Point"
      }

      %FoodTruck{}
      |> FoodTruck.changeset(%{
        "location_id" => item_map["locationid"],
        "applicant" => item_map["Applicant"],
        "facility_type" => item_map["FacilityType"],
        "cnn" => item_map["cnn"],
        "location_description" => item_map["LocationDescription"],
        "address" => item_map["Address"],
        "block_lot" => item_map["blocklot"],
        "block" => item_map["block"],
        "lot" => item_map["lot"],
        "permit" => item_map["permit"],
        "status" => item_map["Status"],
        "food_item_maps" => item_map["FoodItem_Maps"],
        "x" => item_map["X"],
        "y" => item_map["Y"],
        "latitude" => item_map["Latitude"],
        "longitude" => item_map["Longitude"],
        "schedule" => item_map["Schedule"],
        "days_hours" => item_map["dayshours"],
        # Assuming 1 means true and 0 means false
        "noi_sent" => item_map["NOISent"] == 1,
        "approved" => item_map["Approved"],
        "received" => item_map["Received"],
        # Assuming 1 means true and 0 means false
        "prior_permit" => item_map["PriorPermit"] == 1,
        "expiration_date" => item_map["ExpirationDate"],
        "geom" => geom
      })
      |> Repo.insert!()
    rescue
      _ ->
        # we want to 'fail forward' at an early stage.
        # logging misformatted rows
        # could help us improve parsing
        :ok
    end
  end
end)
