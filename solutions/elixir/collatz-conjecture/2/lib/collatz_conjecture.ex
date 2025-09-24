defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0, do: count(input, 0)

  defp count(1, loop), do: loop
  defp count(n, loop) when rem(n, 2) == 0, do: count(div(n, 2), loop + 1)
  defp count(n, loop) when n > 0, do: count(n * 3 + 1, loop + 1)
end
