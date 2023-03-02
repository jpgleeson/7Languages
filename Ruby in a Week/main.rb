def present_arrays
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

    current_slice = []

    numbers.each() do |number|
        if current_slice.length < 4
            current_slice.push(number)
        end
        if current_slice.length == 4
            puts current_slice.to_s
            current_slice = []
        end
    end

    numbers.each_slice(4) do |a, b, c, d|
        puts "#{a} #{b} #{c} #{d}"
    end
end

def grep_line_in_file
    file = File.open("sample.txt")
    file.each() do |line|
        if line.index("with") != nil
            puts line
        end
    end
end

module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end
    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end
    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ' )
            file.each do |row|
                new_row = CsvRow.new
                new_row.columns << row.chomp.split(', ')
                new_row.column_names = @headers
                @csv_contents << new_row
            end
        end
        attr_accessor :headers, :csv_contents

        def initialize
            read
        end

        def each
            number_of_columns = @headers.length
            @csv_contents.each_slice(number_of_columns) do |line|
                puts line.instance_variables
            end
        end
    end
end

class CsvRow
    attr_accessor :columns, :column_names

    def initialize
        @columns = []
    end

    def method_missing (method_name, *args)
        column_index = -1
        current_index = 0
        column_names.each do |entry|
            if entry.to_s == method_name.to_s
                column_index = current_index
            end
            current_index += 1
        end
        if column_index == -1
            return nil
        end
        columns[0][column_index]
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
m.csv_contents.each do |line|
    puts line.two
    puts line.one
    puts line.three
end