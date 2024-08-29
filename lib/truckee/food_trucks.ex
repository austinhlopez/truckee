defmodule Truckee.FoodTrucks do
  @moduledoc "Food Trucks context functions"

  alias Truckee.{FoodTruck, Repo}

  def all_food_trucks do
    Repo.all(FoodTruck)
  end
end
