#!/usr/bin/env ruby

input = File.readlines 'input.txt'
expenses = input.map(&:to_i)
result = []

expenses.each do |n|
  expenses.each do |n2|
    n3 = 2020 - n - n2
    next unless expenses.include? n3

    result = [n, n2, n3]
    break
  end
end

puts result.reduce(:*)
