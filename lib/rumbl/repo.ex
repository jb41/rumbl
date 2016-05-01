defmodule Rumbl.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Michael", username: "michael", password: "elixir"},
      %Rumbl.User{id: "2", name: "John", username: "johnblack", password: "secret"},
      %Rumbl.User{id: "3", name: "Andy", username: "iamandy", password: "password"}
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find(all(module), fn map -> map.id == id end)
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
