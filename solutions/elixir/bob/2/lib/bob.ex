defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)
    is_question? = is_question?(input)
    is_yelling? = is_yelling?(input)
    is_silent? = input == ""

    cond do
      is_silent? -> "Fine. Be that way!"
      is_yelling? and is_question? -> "Calm down, I know what I'm doing!"
      is_yelling? -> "Whoa, chill out!"
      is_question? -> "Sure."
      true -> "Whatever."
    end
  end

  defp is_yelling?(input) do
    letters = String.replace(input, ~r/[^\p{L}]/u, "")
    letters != "" and String.upcase(letters) == letters
  end

  defp is_question?(input) do
    String.ends_with?(input, "?")
  end
end
