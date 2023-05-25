# frozen_string_literal: true

require_relative 'supporting_methods'

# print chart
module PrintTemperature
  def self.generate_year_report(data_array)
    @date_array = []
    @max_temperature = []
    @min_temperature = []
    @max_humid_array = []
    initiazlie_arr(data_array)
    convert_into_integer
    search_index
  end

  def self.initiazlie_arr(data_array)
    @date_array = extract_string_elements(data_array, 0)
    @max_temperature = extract_elements(data_array, 1)
    @min_temperature = extract_elements(data_array, 3)
    @max_humid_array = extract_elements(data_array, 4)
  end

  def self.convert_into_integer
    @max_temperature = @max_temperature.map(&:to_i)
    @min_temperature = @min_temperature.map(&:to_i)
    @max_humid_array = @max_humid_array.map(&:to_i)
  end

  def self.search_index
    @max_temperature_date_index = @max_temperature.index(@max_temperature.max)
    @min_temperature_date_index = @min_temperature.index(@min_temperature.min)
    @maxhumid_date_index = @max_humid_array.index(@max_humid_array.max)
    print_output
  end

  def self.print_output
    puts "Highest: #{@max_temperature.max} on #{@date_array[@max_temperature_date_index]} "
    puts "Lowest: #{@min_temperature.min} on #{@date_array[@min_temperature_date_index]} "
    puts "Max Humidity: #{@max_humid_array.max}% on #{@date_array[@maxhumid_date_index]} "
  end
end
