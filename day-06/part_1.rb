puts File.read('input.txt')
         .split(/^$\n/)
         .map { |str| str.gsub(/\n/, '').split('').uniq.length }
         .sum
