defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map_join(String.split(dna, ""), "", fn char -> translate(char) end)
  end

  def translate(char) do
    map = %{"G" => "C", "C" => "G", "T" => "A", "A" => "U"}
    map[char]
  end
end
