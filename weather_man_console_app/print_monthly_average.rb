# frozen_string_literal: true

require_relative 'supporting_methods'

# print chart
module PrintMonthlyAverage
  def self.generate_monthly_average(data_array)
    @max_temp_arr = []
    @min_temp_arr = []
    @mean_humid_arr = []
    @max_temp_arr = extract_elements(data_array, 1)
    @min_temp_arr = extract_elements(data_array, 8)
    @mean_humid_arr = extract_elements(data_array, 3)

    calculate_average
    print_output
  end

  def self.calculate_average
    @max_temp_avg = compute_average(@max_temp_arr).to_i
    @min_temp_avg = compute_average(@min_temp_arr).to_i
    @mean_humid_avg = compute_average(@mean_humid_arr).to_i
  end

  def self.print_output
    puts " Hieghst Average : #{@max_temp_avg} C"
    puts " Lowest Average : #{@min_temp_avg} C"
    puts " Average Humidity : #{@mean_humid_avg} %"
  end
end
