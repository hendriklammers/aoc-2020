GRID = File.readlines('input.txt').map { |str| str.gsub("\n", '').split('') }
COLUMNS = GRID[0].length
ROWS = GRID.length
SLOPES = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].freeze

def count_trees(step_x, step_y)
  tree_count = 0
  x = 0
  y = 0
  while y < ROWS
    tree_count += 1 if GRID[y][x] == '#'
    x += step_x
    x -= COLUMNS if x >= COLUMNS
    y += step_y
  end
  tree_count
end

puts SLOPES.map { |slope| count_trees(slope[0], slope[1]) }.reduce(&:*)
