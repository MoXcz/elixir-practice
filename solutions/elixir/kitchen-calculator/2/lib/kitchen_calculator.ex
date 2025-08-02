defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, volume} = volume_pair
    volume
  end

  # not using "get_volume"
  def to_milliliter({:milliliter, volume} = _) do
    {:milliliter, volume}
  end

  def to_milliliter({:cup, volume} = _) do
    {:milliliter, volume * 240}
  end

  def to_milliliter({:fluid_ounce, volume} = _) do
    {:milliliter, volume * 30}
  end

  def to_milliliter({:teaspoon, volume} = _) do
    {:milliliter, volume * 5}
  end

  def to_milliliter({:tablespoon, volume} = _) do
    {:milliliter, volume * 15}
  end

  # using "get_volume"
  def from_milliliter(volume_pair, :milliliter = unit) do
    {unit, get_volume(volume_pair)}
  end

  def from_milliliter(volume_pair, :cup = unit) do
    {unit, get_volume(volume_pair) / 240}
  end

  def from_milliliter(volume_pair, :fluid_ounce = unit) do
    {unit, get_volume(volume_pair) / 30}
  end

  def from_milliliter(volume_pair, :teaspoon = unit) do
    {unit, get_volume(volume_pair) / 5}
  end

  def from_milliliter(volume_pair, :tablespoon = unit) do
    {unit, get_volume(volume_pair) / 15}
  end

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
