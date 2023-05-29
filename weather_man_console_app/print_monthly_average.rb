# frozen_string_literal: true

require_relative 'supporting_methods'

# print chart
module PrintMonthlyAverage
  def self.variables_declare
    @max_temperature = 0
    @min_temperature = 0
    @max_humidity = 0
    @max_count = 0
    @min_count = 0
    @max_humid_count = 0
  end

  def self.generate_weather_average(data_array)
    variables_declare
    data_array.each do |row|
      max_array_sum(get_value_from_array(row, 1))
      min_array_sum(get_value_from_array(row, 3))
      max_huidity_sum(get_value_from_array(row, 8))
    end
    print_output
  end

  def self.print_output
    puts " Hieghst Average : #{@max_temperature / @max_count}C"
    puts " Lowest Average : #{@min_temperature / @min_count}C"
    puts " Average Humidity : #{@max_humidity / @max_humid_count}%"
  end

  def self.max_array_sum(temp)
    return if temp == ''

    @max_count += 1
    @max_temperature += temp.to_i
  end

  def self.min_array_sum(temp)
    return if temp == ''

    @min_count += 1
    @min_temperature += temp.to_i
  end

  def self.max_huidity_sum(temp)
    return if temp == ''

    @max_humid_count += 1
    @max_humidity += temp.to_i
  end
end
