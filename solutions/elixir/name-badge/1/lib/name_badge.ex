defmodule NameBadge do
  def print(id, name, department) do
    if Enum.all?([not is_nil(id), not is_nil(name), not is_nil(department)]) do
      "[#{id}] - #{name} - #{String.upcase(department)}"
    else
      if Enum.all?([is_nil(id), not is_nil(name), not is_nil(department)]) do
        "#{name} - #{String.upcase(department)}"
      else
        if Enum.all?([not is_nil(id), not is_nil(name), is_nil(department)]) do
          "[#{id}] - #{name} - OWNER"
        else
          if Enum.all?([is_nil(id), not is_nil(name), is_nil(department)]) do
            "#{name} - OWNER"
          end
        end
      end
    end
  end
end
