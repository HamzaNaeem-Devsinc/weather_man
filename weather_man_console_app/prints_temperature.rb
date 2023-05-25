# frozen_string_literal: true

require_relative 'supporting_methods'

# print chart
module PrintTemperaturOfYear
  def self.generate_year_report(data_array)
    @date = []
    @max_temp = []
    @min_temp = []
    @max_humid_arr = []
    initiazlie_arr(data_array)
    convert_into_integer
    calculate_year_report
  end

  def self.initiazlie_arr(data_array)
    @date = fill_date_array(data_array, 0, @date)
    @max_temp = fill_date_array(data_array, 1, @max_temp)
    @min_temp = fill_date_array(data_array, 3, @min_temp)
    @max_humid_arr = fill_date_array(data_array, 4, @max_humid_arr)
  end

  def self.convert_into_integer
    @max_temp = @max_temp.map(&:to_i)
    @min_temp = @min_temp.map(&:to_i)
    @max_humid_arr = @max_humid_arr.map(&:to_i)
  end

  def self.calculate_year_report
    @maxtemp_date_index = @max_temp.index(@max_temp.max) + 1
    @mintemp_date_index = @min_temp.index(@min_temp.min) + 1
    @maxhumid_date_index = @max_humid_arr.index(@max_humid_arr.max) + 1
    console_year_temperature_report
  end

  def self.console_year_temperature_report
    puts "Highest: #{@max_temp.max} on #{@date[@maxtemp_date_index]} "
    puts "Lowest: #{@min_temp.max} on #{@date[@mintemp_date_index]} "
    puts "Max Humidity: #{@max_humid_arr.max}% on #{@date[@maxhumid_date_index]} "
  end
end
