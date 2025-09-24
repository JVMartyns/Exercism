defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @kilo 1_000
  @mega 1_000_000
  @giga 1_000_000_000
  @tera 1_000_000_000_000

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    colors
    |> colors_to_ohms()
    |> add_metric_prefix()
  end

  defp colors_to_ohms([c1, c2, c3 | _]) do
    String.to_integer("#{@colors[c1]}#{@colors[c2]}#{String.duplicate("0", @colors[c3])}")
  end

  defp add_metric_prefix(ohms) when ohms < @kilo, do: {ohms, :ohms}
  defp add_metric_prefix(ohms) when ohms < @mega, do: {div(ohms, @kilo), :kiloohms}
  defp add_metric_prefix(ohms) when ohms < @giga, do: {div(ohms, @mega), :megaohms}
  defp add_metric_prefix(ohms) when ohms < @tera, do: {div(ohms, @giga), :gigaohms}
end
