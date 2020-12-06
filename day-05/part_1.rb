def find_position(str, high, down_char)
  low = 0
  str.split('').each do |char|
    half = ((high - low) / 2.0).ceil
    if char == down_char
      high -= half
    else
      low += half
    end
  end
  str[str.length - 1] == down_char ? low : high
end

def find_seat_id(boarding_pass)
  row = find_position(boarding_pass.slice(0, 7), 127, 'F')
  column = find_position(boarding_pass.slice(7, 3), 7, 'L')
  row * 8 + column
end

ids = File.readlines('input.txt').map { |code| find_seat_id code }
puts ids.max
