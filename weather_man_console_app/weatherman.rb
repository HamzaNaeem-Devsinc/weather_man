# frozen_string_literal: true

require 'optparse'
require_relative 'prints_the_chart'
require_relative 'prints_average'
require_relative 'prints_temperature'
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
  s_year = options[:year]
  data_array = get_data_in_arr(s_year, file_path)
  PrintTemperaturOfYear.generate_year_report(data_array)

elsif options[:month]
  s_month = options[:month]
  data_array = get_data_in_array(s_month, file_path)
  PrintMonthlyAverage.generate_monthly_average(data_array)

elsif options[:chart]
  s_month = options[:chart]
  data_array = get_data_in_array(s_month, file_path)
  PrintWeatherChart.generate_monthly_chart(data_array)

end
