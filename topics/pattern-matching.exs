# pattern matching
defmodule VoteGuards do
  @moduledoc """
  Function for working with Voters.
  """

  # public interface for the function
  def eligibility(age) when is_binary(age) or is_integer(age) do
    do_eligibility(age)
  end

  def eligibility(_age) do
    "Invalid input"
  end

  # the rest are pattern matches done based on some correct input; these are all
  # private functions
  defp do_eligibility(age) when is_binary(age) do
    do_eligibility(Integer.parse(age))
  end

  defp do_eligibility({age, _}) do
    do_eligibility(age)
  end

  defp do_eligibility(age) when is_integer(age) and age < 18 do
    "You can't vote yet"
  end

  defp do_eligibility(age) when is_integer(age) and age < 25 do
    "You can vote!"
  end

  defp do_eligibility(:error) do
    "Invalid number!"
  end

  # this pattern will execute if none of the above conditions are met, which
  # means that it's a number greater than 25
  defp do_eligibility(_age) do
    "You can vote and you can run for office!"
  end
end

# pattern match with anonymous functions. Note that all pattern matches must
# have the same arity
rgb_color = fn
  :red -> {256, 0, 0}
  :blue -> {0, 256, 0}
  :green -> {0, 0, 256}
  _ -> "invalid color"
end

#  {256, 0, 0}
rgb_color.(:red)
