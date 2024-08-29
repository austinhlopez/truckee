mix deps.get
mix compile --all-warnings --warnings-as-errors
mix format
mix credo
mix coveralls
