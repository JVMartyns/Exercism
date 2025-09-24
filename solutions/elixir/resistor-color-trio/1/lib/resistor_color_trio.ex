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

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([c1, c2, c3 | _]) do
    ohms = colors_to_ohms(c1, c2, c3)

    case length(Integer.digits(ohms)) do
      len when len in 1..3 ->
        {div(ohms, 1), :ohms}

      len when len in 4..6 ->
        {div(ohms, 1_000), :kiloohms}

      len when len in 7..9 ->
        {div(ohms, 1_000_000), :megaohms}

      len when len in 10..12 ->
        {div(ohms, 1_000_000_000), :gigaohms}
    end
  end

  defp colors_to_ohms(c1, c2, c3) do
    String.to_integer("#{@colors[c1]}#{@colors[c2]}#{String.duplicate("0", @colors[c3])}")
  end
end
