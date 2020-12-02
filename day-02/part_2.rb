#!/usr/bin/env ruby

def valid?(pos, letter, password)
  chars = password.split('')
  [chars[pos[0] - 1], chars[pos[1] - 1]].filter { |c| c == letter }.size == 1
end

def validate_password(str)
  arr = str.split(' ')
  pos = arr.first.split('-').map(&:to_i)
  letter = arr[1][0]
  password = arr[2]
  valid?(pos, letter, password)
end

puts File.readlines('input.txt')
         .map { |str| validate_password(str) }
         .filter { |valid| valid }
         .size
