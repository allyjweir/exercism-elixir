defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(fn x -> encode(x, shift) end)
    |> List.to_string()
  end

  defp encode_point(32, _), do: " "
  defp encode_point(p, _) when (p in 33..64), do: p
  
  defp encode_point(p, shift) do
    encode_point(p + shift)
  end
  defp encode_point(p) when p > 122 do
    p - 26
  end
  defp encode_point(p), do: p

  defp encode(char, shift) do
    encode_point(char, shift)
  end
end

