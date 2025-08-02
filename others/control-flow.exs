age = IO.gets("What is your age? ")
{age, _} = Integer.parse(age)

message =
  cond do
    age < 18 -> "You can't vote yet"
    age < 25 -> "You can vote!"
    true -> "You can vote and you can run for office!"
  end

# There's no "else if" keyword
# message =
# if age < 18 do
#   "You can't vote yet"
# else
#   "You can vote!"
# end

IO.puts(message)
