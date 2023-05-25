# frozen_string_literal: true

require_relative 'supporting_methods'

# print chart
module PrintMonthlyAverage
  def self.generate_monthly_average(data_array)
    @max_temp_arr = []
    @min_temp_arr = []
    @mean_humid_arr = []

    data_array.each do |row|
      @max_temp_arr << row.split(',')[1].to_i
      @min_temp_arr << row.split(',')[3].to_i
      @mean_humid_arr << row.split(',')[8].to_i
    end
    call_average
    console_output
  end

  def self.call_average
    @max_temp_avg = get_average_of_array(@max_temp_arr).to_i
    @min_temp_avg = get_average_of_array(@min_temp_arr).to_i
    @mean_humid_avg = get_average_of_array(@mean_humid_arr).to_i
  end

  def self.console_output
    puts " Hieghst Average : #{@max_temp_avg} C"
    puts " Lowest Average : #{@min_temp_avg} C"
    puts " Average Humidity : #{@mean_humid_avg} %"
  end
end
