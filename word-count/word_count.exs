defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    Regex.replace(~r/[^a-z0-9-_ äöüßÄÖÜẞ]/, String.downcase(sentence), "")
    |>String.split([" ", "_"])
    |>Enum.filter(fn entry -> Regex.match?(~r/[A-Za-z-0-9]/, entry) end)
    |>Enum.reduce(%{}, fn word, acc ->
        Map.update(acc, word, 1, &(&1 + 1))
    end)
  end

end
