#!/usr/bin/env ruby

while !ARGF.eof?
    line = ARGF.readline
    fields = line.split("\t")
    if fields.length % 2 != 0
        puts "Bad input on #{line}"
        break
    end
    fields.each do |field|
        puts field
    end
end