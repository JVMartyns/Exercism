defmodule KitchenCalculator do
  def get_volume({_unit, vol}), do: vol

  def to_milliliter({unit, vol}) do
    case unit do
      :milliliter -> {unit, vol}
      :cup -> {:milliliter, vol * 240}
      :fluid_ounce -> {:milliliter, vol * 30}
      :teaspoon -> {:milliliter, vol * 5}
      :tablespoon -> {:milliliter, vol * 15}
    end
  end

  def from_milliliter({:milliliter, vol}, unit) do
    case unit do
      :milliliter -> {unit, vol}
      :cup -> {unit, vol / 240}
      :fluid_ounce -> {unit, vol / 30}
      :teaspoon -> {unit, vol / 5}
      :tablespoon -> {unit, vol / 15}
    end
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
