#!/usr/bin/env ruby

def valid?(range, letter, password)
  count = password.split('').reduce(0) do |total, char|
    char == letter ? total + 1 : total
  end
  count >= range[0] and count <= range[1]
end

def validate_password(str)
  arr = str.split(' ')
  range = arr.first.split('-').map(&:to_i)
  letter = arr[1][0]
  password = arr[2]
  valid?(range, letter, password)
end

puts File.readlines('input.txt')
         .map { |str| validate_password(str) }
         .filter { |valid| valid }
         .size
