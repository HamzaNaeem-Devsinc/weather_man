# frozen_string_literal: true

require_relative 'print_temperature'
require_relative 'print_weather_chart'
require_relative 'print_monthly_average'
require_relative 'supporting_methods'

unless ARGV[0] && ARGV[1] && ARGV[2]
  puts 'Please provide valid command line options.'
  exit
end

unless File.directory?(ARGV[2])
  puts 'Invalid directory path.'
  exit
end

date = ARGV[1]
file_path = ARGV[2]
data_array = load_data_from_file(date, file_path, ARGV[0])

case ARGV[0]
when '-e'
  PrintTemperature.print_output(data_array)
when '-a'
  PrintMonthlyAverage.generate_weather_average(data_array)
when '-c'
  PrintWeatherChart.generate_weather_chart(data_array, date)
else
  puts 'Invalid Option'
end
