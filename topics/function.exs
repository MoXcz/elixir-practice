"""
Note that variables and functions ocupy different namespaces, so something like:

  def add(a, b) do
    a + b
  end

  def increment(num) do
    add = 1
    add(num, add)
  end

Works without problem, even though the identifier 'add' is being used both as
a function and as a variable in the same scope.

> This is a characteristic of LISP 2 languages

This helps explain why anonymous functions use an extra dot '.', as this helps
differentiate between a function, and a variable that has a function.

> Because an anonymous function is essentially just binded to a variable, it
  goes to the variable namespace
"""

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

# and then invoked using fn.(params), with an added dot before the parameters

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
