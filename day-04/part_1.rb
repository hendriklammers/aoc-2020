REQUIRED_FIELDS = %w[byr iyr eyr hgt hcl ecl pid].freeze

def parse_passport(passport_str)
  passport_str.split(/[\n\s]/).each_with_object({}) do |str, hash|
    key, val = str.split(':')
    hash[key] = val
  end
end

def validate(str)
  passport = parse_passport(str)
  REQUIRED_FIELDS.all? { |field| passport.key? field }
end

puts File.read('input.txt')
         .split(/^$\n/)
         .reduce(0) { |count, str| validate(str) ? count + 1 : count }
