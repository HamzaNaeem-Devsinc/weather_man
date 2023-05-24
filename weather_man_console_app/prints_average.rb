# frozen_string_literal: true

require_relative 'supporting_methods'

def print_avg(s_month, filepath)
  year, month = s_month.split('/')
  mon = convert_m(month.to_i - 1)
  file_pattern = "#{filepath}/Dubai_weather_#{year}_#{mon}.txt"
  data_array = file_read(file_pattern, filepath)
  print_avg_screen(data_array)
end
