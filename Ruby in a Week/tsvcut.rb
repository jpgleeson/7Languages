#!/usr/bin/env ruby

filter = "FirstName"

while !ARGF.eof?
    line = ARGF.readline
    fields = line.split("\t")
    if fields.length % 2 != 0
        puts "Bad input on #{line}. We need headers in the input lines"
        break
    end
    fields.each_slice(2) do |key, value|
        if key == filter
            puts "#{key} - #{value}"
        end
    end
end