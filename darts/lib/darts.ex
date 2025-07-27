defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    x = x * x
    y = y * y

    cond do
      x + y <= 1 -> 10
      x + y <= 25 -> 5
      x + y <= 100 -> 1
      true -> 0
    end
  end
end
