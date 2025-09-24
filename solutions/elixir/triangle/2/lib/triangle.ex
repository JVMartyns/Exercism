defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}

  def kind(a, b, c) do
    cond do
      triangle?(a, b, c) -> {:ok, triangle_type(a, b, c)}
      a <= 0 or b <= 0 or c <= 0 -> {:error, "all side lengths must be positive"}
      true -> {:error, "side lengths violate triangle inequality"}
    end
  end

  defp triangle?(0, 0, 0), do: false
  defp triangle?(a, b, c), do: a + b >= c and b + c >= a and a + c >= b

  defp triangle_type(a, b, c) do
    cond do
      a == b and b == c and c == a -> :equilateral
      a != b and b != c and c != a -> :scalene
      true -> :isosceles
    end
  end
end
