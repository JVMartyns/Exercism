defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target.

  To find out if the dart is inside the circle, the formula is used:
  (x^2 + y^2) = r^2 -> where r represents the radius of the circle
  """
  @spec score(position) :: integer
  def score({x, y}) do
    cond do
      x ** 2 + y ** 2 <= 1 ** 2 ->
        10

      x ** 2 + y ** 2 <= 5 ** 2 ->
        5

      x ** 2 + y ** 2 <= 10 ** 2 ->
        1

      true ->
        0
    end
  end
end
