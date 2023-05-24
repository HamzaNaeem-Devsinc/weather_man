# frozen_string_literal: true

require_relative 'supporting_methods'

def print_temp(s_year, filepath)
  file_pattern = "#{filepath}/Dubai_weather_#{s_year}_*.txt"
  data_array = file_read(file_pattern, filepath)
  process_data_to_print(data_array)
end
