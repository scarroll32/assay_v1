#!/usr/bin/ruby

puts 'Primer 3 hash'

primer3 = {}
while line = gets do
    name, height = line.split(/\=/)
    #primer3[name] = height.to_i
    if height.nil?
      #
    else
      primer3[name.downcase.to_sym] = height.chomp
    end

end

puts primer3