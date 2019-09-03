# Starting instructions
puts "Welcome to the Reverse Polish Notation calculator"
puts "To quit this program at any time, input q"
puts "First, please let us know how many decimal places you would like us to
use when returning your result (ie. if you input 2 here, 1/3 will return as 0.33)"
decimal_places = gets.chomp
decimal_places === "q" ? exit : nil
decimal_places.to_i.to_s == decimal_places ? @places = decimal_places.to_i : @places = 0
puts "Start with at least two numbers, then feel free to add operators:"

# Starting variables
input = nil
array = []

# Methods
def validate_input(input, array)
  if input.to_f != 0 && (!input.match? /\A[0-9.]*\z/)
    return ("You entered #{input} which is invalid. Perhaps you meant #{input.to_i}")
  elsif input.to_f != 0 && (input.match? /\A[0-9.]*\z/)
    return array.push(input)
  elsif ["+", "-", "*", "/", "**", "="].include?(input)
    return ["+", "-", "*", "/", "**", "="].index(input)
  elsif input == "q"
    nil
  else
    if array.length >= 2
      accepted_input = "Please input a number or an operator."
    else
      accepted_input = "Please input a number."
    end
    return ("That's not a valid input. " + accepted_input)
  end
end

def process_input(value, array)
  if value.class == Array
    return
  elsif value.class == Integer
    if array.length < 2
      puts "You need at least two numbers before you can perform an operation."
      return
    else
      num1 = array.delete_at(-2).to_f
      num2 = array.delete_at(-1).to_f
      new_value = case value
      when 0
        num1 + num2
      when 1
        num1 - num2
      when 2
        num1 * num2
      when 3
        num1 / num2
      when 4
        num1 ** num2
      when 5
        0
      end
      array.push new_value
      puts "= " + new_value.round(@places.to_i).to_s
    end
  else
    puts value
  end
end

# The program
loop do
  if input == "q"
    puts "Thanks for calculating in RPN with us!"
    break
  end
  input = gets.chomp
  value = validate_input(input, array)
  process_input(value, array)
end
