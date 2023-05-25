# frozen_string_literal: true

# print chart
module PrintWeatherChart
  def self.generate_monthly_chart(data_array)
    # initialize
    @max_temp_arr = []
    @min_temp_arr = []

    @max_temp_arr = extract_elements(data_array, 1)
    @min_temp_arr = extract_elements(data_array, 3)

    print_output
    print_bonus_output
  end

  def self.print_output
    i = 0
    @max_temp_arr.zip(@min_temp_arr).each do |arr1, arr2|
      i += 1
      puts "#{i} #{"\e[31m+\e[0m" * arr1} #{arr1}C"
      puts "#{i} #{"\e[34m+\e[0m" * arr2} #{arr2}C"
    end
  end

  def self.print_bonus_output
    puts '------------------------BonuS ParT----------------------------------'
    j = 0
    @max_temp_arr.zip(@min_temp_arr).each do |arr1, arr2|
      j += 1
      puts "#{j} #{"\e[34m+\e[0m" * arr2}#{"\e[31m+\e[0m" * arr1} #{arr1}C - #{arr2}C"
    end
  end
end
