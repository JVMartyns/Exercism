defmodule HighScore do
  @initial_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @initial_score), do: Map.put(scores, name, score)

  def remove_player(scores, _name) when map_size(scores) == 0, do: scores

  def remove_player(scores, name) do
    case Map.fetch(scores, name) do
      {:ok, _} -> Map.delete(scores, name)
      :error -> add_player(scores, name)
    end
  end

  def reset_score(scores, name) do
    case Map.fetch(scores, name) do
      {:ok, _} -> %{scores | "#{name}" => 0}
      :error -> add_player(scores, name)
    end
  end

  def update_score(scores, name, score), do: Map.update(scores, name, score, &(&1 + score))

  def get_players(scores), do: Map.keys(scores)
end
