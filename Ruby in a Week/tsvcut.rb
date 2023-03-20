#!/usr/bin/env ruby

# tsvcut is a program I like to write in languages I'm trying to learn.
# It's something I use at work a lot, and it hits on a lot of the
# different parts of a language you interact with - IO, parsing text
# working with streams. Below is a sample invocation for this version.
#
# cat sample.tsv | ruby tsvcut.rb -t Surname Email

filters = []
include_key = false

ARGV.each do |arg|
    if arg[0,1] == "-"
        # Include field name in output lines
        if arg == "-t"
            include_key = true
        end
    else
        filters.push(arg)
    end
end

while !STDIN.eof?
    fields = STDIN.readline.split("\t")
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