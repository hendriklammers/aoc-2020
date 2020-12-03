#!/usr/bin/env ruby

input = File.readlines 'input.txt'
expenses = input.map(&:to_i)
result = 0

expenses.each do |n|
  n2 = 2020 - n
  if expenses.include? n2
    result = n * n2
    break
  end
end

puts result
