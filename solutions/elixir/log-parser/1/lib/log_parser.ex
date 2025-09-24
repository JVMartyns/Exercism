defmodule LogParser do
  def valid_line?(line) do
    regex = ~r/^\[(DEBUG)?(INFO)?(WARNING)?(ERROR)?\]/
    Regex.match?(regex, line)
  end

  def split_line(line) do
    regex = ~r/([<]([~*=-]+)?[>])/
    Regex.split(regex, line)
  end

  def remove_artifacts(line) do
    regex = ~r/((end-of-line)(\d)+)/i
    Regex.replace(regex, line, "")
  end

  def tag_with_user_name(line) do
    regex = ~r/User[[:space:]]+(?<username>\S+)/

    case Regex.named_captures(regex, line) do
      %{"username" => username} ->
        "[USER] #{username} #{line}"

      nil ->
        line
    end
  end
end
