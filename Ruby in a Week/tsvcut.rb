#!/usr/bin/env ruby

filters = []
include_key = false

ARGV.each do |arg|
    if arg[0,1] == "-"
        if arg == "-t"
            include_key = true
        end
    else
        filters.push(arg)
    end
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
            output += key + "\t" if include_key
            output += value
        end
    end
    puts output
end