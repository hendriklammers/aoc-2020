grid = File.readlines('input.txt').map { |str| str.gsub("\n", '').split('') }

columns = grid[0].length
rows = grid.length
x = 0
y = 0
tree_count = 0

while y < rows
  # puts "x: #{x} y: #{y}} char: #{grid[y][x]}"
  tree_count += 1 if grid[y][x] == '#'
  x += 3
  x -= columns if x >= columns
  y += 1
end

puts tree_count
