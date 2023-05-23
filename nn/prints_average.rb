# frozen_string_literal: true

def print_avg(s_month, file_path)
  # convert the dates
  file_pattern = "#{file_path}/Dubai_weather_#{s_month}.txt"
  # puts file_pattern

  data_array = []
  Dir.glob(file_pattern) do |file_path|
    File.open(file_path, 'r') do |file|
      file.each_line do |line|
        # Add each row to the array
        data_array << line.chomp
      end
    end
  end

  max_temp_arr = []
  min_temp_arr = []
  mean_humid_arr = []

  data_array.each do |row|
    max_temp_arr << row.split(',')[1].to_i.to_s
    min_temp_arr << row.split(',')[3].to_i.to_s
    mean_humid_arr << row.split(',')[8].to_i.to_s
  end

  avg_high = max_temp_arr.inject { |sum, el| sum + el }.to_f / max_temp_arr.size

  avg_low =  min_temp_arr.inject { |sum, el| sum + el }.to_f / min_temp_arr.size

  mean_humid_arr.inject { |sum, el| sum + el }.to_f
  mean_humid_arr.size

  puts " Hieghst Average : #{avg_high} C"
  puts " Lowest Average : #{avg_low} C"
  puts " Average Humidity : #{avg_low} %"
end
