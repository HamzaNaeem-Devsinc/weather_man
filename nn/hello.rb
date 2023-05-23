# frozen_string_literal: true

require 'optparse'
require 'date'
require 'json'
require_relative 'prints_the_chart'
require_relative 'prints_average'
require_relative 'prints_temperature'

# Parse command line options
options = {}
OptionParser.new do |opts|
  opts.on('-e YEAR', '--year YEAR', 'Generate report for a given year') do |year|
    options[:year] = year
  end
  opts.on('-a YEAR/MONTH', '--average YEAR/MONTH', 'Generate report for a given month') do |month|
    options[:month] = month
  end
  opts.on('-c YEAR/MONTH', '--chart YEAR/MONTH', 'Generate chart for a given month') do |month|
    options[:chart] = month
  end
end.parse!

# Validate command line options
unless options[:year] || options[:month] || options[:chart]
  puts 'Please provide valid command line options.'
  exit
end

# Get file path from command line argument
file_path = ARGV[0]
unless File.directory?(file_path)
  puts 'Invalid directory path.'
  exit
end

if options[:year]
  s_year = options[:year]
  print_temp(s_year, file_path)

elsif options[:month]
  s_month = options[:month]
  print_avg(s_month, file_path)

elsif options[:chart]
  s_mon = options[:chart]
  print_chart(s_mon, file_path)

end
