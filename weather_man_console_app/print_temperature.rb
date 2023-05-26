# frozen_string_literal: true

require_relative 'supporting_methods'

# print chart
module PrintTemperature
  def self.generate_year_report(data_array)
    variables(data_array)
    data_array.each do |row|
      find_min_temperature_and_date_in_array(get_value_from_array(row, 3), get_value_from_array(row, 0))
      find_max_humadity_and_date_in_array(get_value_from_array(row, 4), get_value_from_array(row, 0))
      find_max_temperature_and_date_in_array(get_value_from_array(row, 1), get_value_from_array(row, 0))
    end
  end

  def self.variables(data_array)
    @max_temperature = get_value_from_array(data_array[0], 1).to_i
    @min_temperature = get_value_from_array(data_array[0], 3).to_i
    @max_humidity = get_value_from_array(data_array[0], 4).to_i
  end

  def self.find_max_temperature_and_date_in_array(temperature, date)
    return if @max_temperature > temperature.to_i

    @max_temperature = temperature.to_i
    @max_temperature_date = date
  end

  def self.find_min_temperature_and_date_in_array(temperature, date)
    return if temperature.to_i > @min_temperature

    @min_temperature = temperature.to_i
    @min_temperature_date = date
  end

  def self.find_max_humadity_and_date_in_array(temperature, date)
    return if temperature.to_i < @max_humidity

    @max_humidity = temperature.to_i
    @max_humidity_date = date
  end

  def self.print_output(data_array)
    generate_year_report(data_array)
    puts "Highest Temperature: #{@max_temperature} on #{@max_temperature_date}"
    puts "Lowest Temperature: #{@min_temperature} on #{@min_temperature_date}"
    puts "Highest Humaidity: #{@max_humidity}% on #{@max_humidity_date}"
  end
end
