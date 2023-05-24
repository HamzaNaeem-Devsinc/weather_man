# frozen_string_literal: true

def file_read(file_pattern, _filepath)
  data_array = []
  Dir.glob(file_pattern) do |filepath|
    File.open(filepath, 'r') do |file|
      file.each_line do |line|
        # Add each row to the array
        data_array << line.chomp
      end
    end
  end
  data_array
end

def convert_m(month)
  arr = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]
  arr[month]
end

def average_cal(max_temp_arr)
  max_temp_arr.inject { |sum, el| sum + el } / max_temp_arr.size
end

def process_data_to_print(data_array)
  datas = {
    'date' => [],
    'max_temp' => [],
    'min_temp' => [],
    'max_humid_arr' => []
  }
  initialize_array(datas, data_array)
end

def initialize_array(datas, data_array)
  max_temp_arr = []
  min_temp_arr = []
  max_humid_arr = []
  get_data_in_arrays(datas, max_temp_arr, min_temp_arr, max_humid_arr, data_array)
end

def get_data_in_arrays(datas, max_temp_arr, min_temp_arr, max_humid_arr, data_array)
  date_arr = []
  data_array.each do |row|
    date_arr << row.split(',')[0]
    max_temp_arr << row.split(',')[1].to_i
    min_temp_arr << row.split(',')[3].to_i
    max_humid_arr << row.split(',')[7].to_i
  end
  display_max(date_arr, max_temp_arr, min_temp_arr, max_humid_arr, datas)
end

def display_max(date_arr, max_temp_arr, min_temp_arr, _max_humid_arr, datas)
  datas['date'] = date_arr
  datas['max_temp'] = max_temp_arr.map(&:to_i)
  datas['min_temp'] = min_temp_arr.map(&:to_i)
  datas['max_humid_arr'] = max_temp_arr.map(&:to_i)

  get_index(datas)
end

def get_index(datas)
  maxtemp_date_index = datas['max_temp'].index(datas['max_temp'].max)
  mintemp_date_index = datas['min_temp'].index(datas['min_temp'].min)
  maxhumid_date_index = datas['max_humid_arr'].index(datas['max_humid_arr'].max)
  get_specific_date(datas, maxtemp_date_index, mintemp_date_index, maxhumid_date_index)
end

def get_specific_date(datas, maxtemp_date_index, mintemp_date_index, maxhumid_date_index)
  high_date = datas['date'][maxtemp_date_index + 1]
  low_date = datas['date'][mintemp_date_index + 1]
  max_humid_date = datas['date'][maxhumid_date_index + 1]
  output_temp_dates(high_date, low_date, max_humid_date, datas)
end

def output_temp_dates(high_date, low_date, max_humid_date, datas)
  puts "Highest: #{datas['max_temp'].max} on #{high_date} "
  puts "Lowest: #{datas['min_temp'].max} on #{low_date} "
  puts "Max Humidity: #{datas['max_humid_arr'].max}% on #{max_humid_date} "
end

def processdata_to_print_chart(data_array)
  max_temp_arr = []
  min_temp_arr = []

  data_array.each do |row|
    max_temp_arr << row.split(',')[1].to_i
    min_temp_arr << row.split(',')[3].to_i
  end

  max_temp_arr = max_temp_arr.map(&:to_i)
  min_temp_arr = min_temp_arr.map(&:to_i)
  chart_output(max_temp_arr, min_temp_arr)
  chart_bonus_output(max_temp_arr, min_temp_arr)
end

def chart_output(max_temp_arr, min_temp_arr)
  i = 0
  max_temp_arr.zip(min_temp_arr).each do |arr1, arr2|
    i += 1
    puts "#{i} #{"\e[31m+\e[0m" * arr1} #{arr1}C"
    puts "#{i} #{"\e[34m+\e[0m" * arr2} #{arr2}C"
  end
end

def chart_bonus_output(max_temp_arr, min_temp_arr)
  puts '------------------------BonuS ParT----------------------------------'
  j = 0
  max_temp_arr.zip(min_temp_arr).each do |arr1, arr2|
    j += 1
    puts "#{j} #{"\e[34m+\e[0m" * arr2}#{"\e[31m+\e[0m" * arr1} #{arr1}C - #{arr2}C"
  end
end

def print_avg_screen(data_array)
  max_temp_arr = []
  min_temp_arr = []
  mean_humid_arr = []

  data_array.each do |row|
    max_temp_arr << row.split(',')[1].to_i
    min_temp_arr << row.split(',')[3].to_i
    mean_humid_arr << row.split(',')[8].to_i
  end
  avg_output(max_temp_arr, min_temp_arr, mean_humid_arr)
end

def avg_output(max_temp_arr, min_temp_arr, mean_humid_arr)
  avg_high = average_cal(max_temp_arr)
  avg_low =  average_cal(min_temp_arr)
  avg_hum = average_cal(mean_humid_arr)

  puts " Hieghst Average : #{avg_high.to_i} C"
  puts " Lowest Average : #{avg_low.to_i} C"
  puts " Average Humidity : #{avg_hum.to_i} %"
end
