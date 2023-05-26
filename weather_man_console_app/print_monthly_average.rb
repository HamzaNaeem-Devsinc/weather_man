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

  def self.generate_monthly_average(data_array)
    variables_declare
    data_array.each do |row|
      max_array_sum(ret(row, 2))
      min_array_sum(ret(row, 3))
      max_huidity_sum(ret(row, 8))
    end
    puts " Hieghst Average : #{@max_temperature / @max_count} C"
    puts " Lowest Average : #{@min_temperature / @min_count} C"
    puts " Average Humidity : #{@max_humidity / @max_humid_count} %"
  end

  def self.ret(row, index)
    row.split(',')[index].to_i
  end

  def self.max_array_sum(temp)
    @max_count += 1
    @max_temperature += temp
  end

  def self.min_array_sum(temp)
    @min_count += 1
    @min_temperature += temp
  end

  def self.max_huidity_sum(temp)
    @max_humid_count += 1
    @max_humidity += temp
  end
end
