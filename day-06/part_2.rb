def count_questions(str)
  num_persons = str.split(/\n/).length
  str.split('').group_by { |char| char }.values
     .filter { |arr| arr.length >= num_persons }
     .length
end

result = File.read('input.txt')
             .split(/\n\n/)
             .map { |str| count_questions str }
             .sum

puts result
