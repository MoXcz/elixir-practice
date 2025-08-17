age = IO.gets("What is your age? ")

# anonymous functions are declared using 'fn'
eligibility = fn age ->
  case Integer.parse(age) do
    {age, _} when age < 18 -> "You can't vote yet"
    {age, _} when age < 25 -> "You can vote!"
    {_age, _} -> "You can vote and you can run for office!"
    :error -> "Invalid input"
  end
end

# and then invoked using fn.(params)

defmodule Vote do
  # named functions
  def vote_eligibility(age) do
    case Integer.parse(age) do
      # guards to execute based on certain conditions
      {age, _} when age < 18 -> "You can't vote yet"
      {age, _} when age < 25 -> "You can vote!"
      {_age, _} -> "You can vote and you can run for office!"
      :error -> "Invalid input"
    end
  end
end

message = Vote.vote_eligibility(age)
IO.puts(message)
