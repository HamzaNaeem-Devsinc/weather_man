# frozen_string_literal: true

# print chart
module PrintWeatherChart
  def self.generate_monthly_chart(data_array)
    # initialize
    max_temp_arr = []
    min_temp_arr = []

    # Filling_arr
    data_array.each do |row|
      max_temp_arr << row.split(',')[1].to_i
      min_temp_arr << row.split(',')[3].to_i
    end

    console_output(max_temp_arr, min_temp_arr)
    bonus_output(max_temp_arr, min_temp_arr)
  end

  def self.console_output(max_temp_arr, min_temp_arr)
    i = 0
    max_temp_arr.zip(min_temp_arr).each do |arr1, arr2|
      i += 1
      puts "#{i} #{"\e[31m+\e[0m" * arr1} #{arr1}C"
      puts "#{i} #{"\e[34m+\e[0m" * arr2} #{arr2}C"
    end
  end

  def self.bonus_output(max_temp_arr, min_temp_arr)
    puts '------------------------BonuS ParT----------------------------------'
    j = 0
    max_temp_arr.zip(min_temp_arr).each do |arr1, arr2|
      j += 1
      puts "#{j} #{"\e[34m+\e[0m" * arr2}#{"\e[31m+\e[0m" * arr1} #{arr1}C - #{arr2}C"
    end
  end
end
