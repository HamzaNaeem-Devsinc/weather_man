# frozen_string_literal: true

def print_chart(s_month, file_path)
  # convert the dates
  file_pattern = "#{file_path}/Dubai_weather_#{s_month}.txt"

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

  data_array.each do |row|
    max_temp_arr << row.split(',')[1].to_i.to_s
    min_temp_arr << row.split(',')[3].to_i.to_s
  end

  max_temp_arr = max_temp_arr.map(&:to_i)
  min_temp_arr = min_temp_arr.map(&:to_i)

  i = 0
  max_temp_arr.zip(min_temp_arr).each do |arr1, arr2|
    i += 1
    puts "#{i} #{"\e[31m+\e[0m" * arr1} #{arr1}C"
    puts "#{i} #{"\e[34m+\e[0m" * arr2} #{arr2}C"
  end
  puts '----------------------------------------------------------'
  j = 0
  max_temp_arr.zip(min_temp_arr).each do |arr1, arr2|
    j += 1
    puts "#{j} #{"\e[34m+\e[0m" * arr2} #{"\e[31m+\e[0m" * arr1} #{arr1}C - #{arr2}C"
  end
end
