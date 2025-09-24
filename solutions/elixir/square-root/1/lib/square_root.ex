defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand), do: do_calculate(radicand, 0)

  defp do_calculate(radicand, n) when n * n == radicand, do: n
  defp do_calculate(radicand, n), do: do_calculate(radicand, n + 1)
end
