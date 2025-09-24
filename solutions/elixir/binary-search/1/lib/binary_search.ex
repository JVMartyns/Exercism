defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key), do: binary_search(numbers, key, 0, tuple_size(numbers))

  defp binary_search(numbers, key, begin, end_) do
    middle = div(end_ - begin, 2) + begin
    num = elem(numbers, middle)

    cond do
      key == num -> {:ok, middle}
      middle == 0 or (middle == end_ - 1 and key > num) -> :not_found
      key > elem(numbers, middle - 1) and key < elem(numbers, middle + 1) -> :not_found
      key > num -> binary_search(numbers, key, middle, end_)
      key < num -> binary_search(numbers, key, begin, middle)
    end
  end
end
