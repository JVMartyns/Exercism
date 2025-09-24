defmodule Username do
  @alphabet Enum.to_list(?a..?z) ++ [?_, ?ß, ?ä, ?ö, ?ü]

  def sanitize(username) do
    username
    |> Enum.filter(&(&1 in @alphabet))
    |> Enum.map(fn x ->
      case x do
        ?ä -> [97, 101]
        ?ö -> [111, 101]
        ?ü -> [117, 101]
        ?ß -> [115, 115]
        _ -> x
      end
    end)
    |> List.flatten()
  end
end
