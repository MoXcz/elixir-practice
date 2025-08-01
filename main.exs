input_length = IO.gets("What is the length? ")
input_width = IO.gets("What is the width? ")

length = String.replace(input_length, "\n", "") |> String.to_integer()
width = String.replace(input_width, "\n", "") |> String.to_integer()

area = length * width

IO.puts("The area is #{area}")
