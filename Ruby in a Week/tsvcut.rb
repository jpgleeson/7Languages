#!/usr/bin/env ruby

filters = []

ARGV.each do |arg|
    filters.push(arg)
end

puts filters

while !STDIN.eof?
    line = STDIN.readline
    fields = line.split("\t")
    output = ""

    if fields.length % 2 != 0
        puts "Bad input on #{line}. We need headers in the input lines"
        break
    end

    fields.each_slice(2) do |key, value|
        index = filters.index(key)
        if index
            if output != ""
                output += "\t"
            end
            output += key + "\t" + value
        end
    end
    puts output
end