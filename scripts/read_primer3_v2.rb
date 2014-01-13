#!/usr/bin/ruby
puts 'Primer 3 hash'

primer3 = {}
while line = gets do
      key, value = line.split(/\=/, 2)
      primer3[key.downcase.to_sym] = value.chomp
end

puts primer3