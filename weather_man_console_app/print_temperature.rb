# frozen_string_literal: true

require_relative 'supporting_methods'

# print chart
module PrintTemperature
  def self.generate_year_report(data_array)
    @max_temperature = ret(data_array[0], 1)
    @min_temperature = ret(data_array[0], 3)
    @max_humidity = ret(data_array[0], 4)
    data_array.each do |row|
      find_min_temperature_and_date_in_array(ret(row, 3), date_ret(row, 0))
      find_max_humadity_and_date_in_array(ret(row, 4), date_ret(row, 0))
      find_max_temperature_and_date_in_array(ret(row, 1), date_ret(row, 0))
    end
  end

  def self.ret(row, index)
    row.split(',')[index].to_i
  end

  def self.date_ret(row, index)
    row.split(',')[index]
  end

  def self.find_max_temperature_and_date_in_array(temperature, date)
    return if temperature < @max_temperature

    @max_temperature = temperature
    @max_temperature_date = date
  end

  def self.find_min_temperature_and_date_in_array(temperature, date)
    return if temperature > @min_temperature

    @min_temperature = temperature
    @min_temperature_date = date
  end

  def self.find_max_humadity_and_date_in_array(temperature, date)
    return if temperature < @max_humidity

    @max_humidity = temperature
    @max_humidity_date = date
  end

  def self.print_output(data_array)
    generate_year_report(data_array)
    puts "Highest Temperature: #{@max_temperature} on #{@max_temperature_date}"
    puts "Lowest Temperature: #{@min_temperature} on #{@min_temperature_date}"
    puts "Highest Humaidity: #{@max_humidity}% on #{@max_humidity_date}"
  end
end
