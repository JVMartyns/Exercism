defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language | list]

  def remove(list) do
    [_head | tail] = list
    tail
  end

  def first(list), do: hd(list)

  def count(list), do: Enum.count(list)

  def functional_list?(list), do: "Elixir" in list
end
