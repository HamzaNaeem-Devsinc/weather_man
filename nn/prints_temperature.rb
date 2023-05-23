# frozen_string_literal: true

def print_temp(s_year, file_path)
  file_pattern = "#{file_path}/Dubai_weather_#{s_year}_*.txt"

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

  # initialize main object to store all relevant data
  datas = {
    'date' => [],
    'max_temp' => [],
    'min_temp' => [],
    'max_humid_arr' => []
  }

  # initialize the array to get data
  date_arr = []
  max_temp_arr = []
  min_temp_arr = []
  max_humid_arr = []

  # Print the array
  data_array.each do |row|
    date_arr << row.split(',')[0]
    max_temp_arr << row.split(',')[1].to_i.to_s
    min_temp_arr << row.split(',')[3].to_i.to_s
    max_humid_arr << row.split(',')[7].to_i.to_s
  end

  # getting data into object and getting only integer values in it
  datas['date'] = date_arr
  datas['max_temp'] = max_temp_arr.map(&:to_i)
  datas['min_temp'] = min_temp_arr.map(&:to_i)
  datas['max_humid_arr'] = max_temp_arr.map(&:to_i)

  # p datas

  # getting_index
  maxTemp_date_index = datas['max_temp'].index(datas['max_temp'].max)
  minTemp_date_index = datas['min_temp'].index(datas['min_temp'].min)
  maxHumid_date_index = datas['max_humid_arr'].index(datas['max_humid_arr'].max)

  # getting dates of specific indexs
  high_date = datas['date'][maxTemp_date_index]
  low_date = datas['date'][minTemp_date_index]
  max_humid_date = datas['date'][maxHumid_date_index]

  # printing Final output
  puts "Highest: #{datas['max_temp'].max} on #{high_date} "
  puts "Lowest: #{datas['min_temp'].max} on #{low_date} "
  puts "Max Humidity: #{datas['max_humid_arr'].max}% on #{max_humid_date} "
end
