def validate_byr(str)
  str.to_i.between?(1920, 2002)
end

def validate_iyr(str)
  str.to_i.between?(2010, 2020)
end

def validate_eyr(str)
  str.to_i.between?(2020, 2030)
end

def validate_hgt(str)
  if (match = str.match(/(^\d+)(cm|in)/))
    height, unit = match.captures
    return height.to_i.between?(150, 193) unless unit == 'in'

    return height.to_i.between?(59, 76)
  end
  false
end

def validate_hcl(str)
  str.match?(/^#[0-9a-f]{6}$/)
end

def validate_ecl(str)
  colors = %w[amb blu brn gry grn hzl oth]
  colors.include?(str)
end

def validate_pid(str)
  str.match?(/^\d{9}$/)
end

def parse_passport(passport_str)
  passport_str.split(/[\n\s]/).each_with_object({}) do |str, hash|
    key, val = str.split(':')
    hash[key] = val
  end
end

VALIDATORS = [
  ['byr', method(:validate_byr)],
  ['iyr', method(:validate_iyr)],
  ['eyr', method(:validate_eyr)],
  ['hgt', method(:validate_hgt)],
  ['hcl', method(:validate_hcl)],
  ['ecl', method(:validate_ecl)],
  ['pid', method(:validate_pid)]
].freeze

def validate(str)
  passport = parse_passport(str)
  VALIDATORS.all? do |validator|
    field, validate = validator
    validate.call passport[field] if passport.key? field
  end
end

puts File.read('input.txt')
         .split(/^$\n/)
         .reduce(0) { |count, str| validate(str) ? count + 1 : count }
