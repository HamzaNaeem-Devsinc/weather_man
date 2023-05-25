# frozen_string_literal: true

require 'optparse'
require_relative 'PrintTemperaturOfYear'
require_relative 'PrintWeatherChart'
require_relative 'PrintMonthlyAverage'
require_relative 'supporting_methods'

options = {}
OptionParser.new do |opts|
  opts.on('-e YEAR', '--year YEAR') do |year|
    options[:year] = year
  end
  opts.on('-a YEAR/MONTH', '--average YEAR/MONTH') do |month|
    options[:month] = month
  end
  opts.on('-c YEAR/MONTH', '--chart YEAR/MONTH') do |month|
    options[:chart] = month
  end
end.parse!

unless options[:year] || options[:month] || options[:chart]
  puts 'Please provide valid command line options.'
  exit
end

file_path = ARGV[0]
unless File.directory?(file_path)
  puts 'Invalid directory path.'
  exit
end

if options[:year]
  time = options[:year]
  data_array = load_data_from_file(time, file_path)
  PrintTemperaturOfYear.generate_year_report(data_array)

elsif options[:month]
  time = options[:month]
  data_array = load_data_from_file(time, file_path)
  PrintMonthlyAverage.generate_monthly_average(data_array)

elsif options[:chart]
  time = options[:chart]
  data_array = load_data_from_file(time, file_path)
  PrintWeatherChart.generate_monthly_chart(data_array)

end
