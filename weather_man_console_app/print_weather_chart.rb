# frozen_string_literal: true

# print_chart
module PrintWeatherChart
  def self.generate_weather_chart(data_array, date)
    find_max_min_temperature_in_array(data_array, date)
    bonus_part(data_array, date)
  end

  def self.find_max_min_temperature_in_array(data_array, date)
    @i = 0
    puts date
    data_array.each do |row|
      print_output(get_value_from_array(row, 1), get_value_from_array(row, 3))
    end
  end

  def self.print_output(max, min)
    @i += 1
    return unless max && max != ''

    puts "#{@i} #{"\e[31m+\e[0m" * max.to_i.abs} #{max.to_i}C"
    puts "#{@i} #{"\e[34m+\e[0m" * min.to_i.abs} #{min.to_i}C"
  end

  def self.bonus_part(data_array, date)
    @j = 0
    puts '---------Bonus Part---------'
    puts date
    data_array.each do |row|
      print_bonus_output(get_value_from_array(row, 1), get_value_from_array(row, 3))
    end
  end

  def self.print_bonus_output(max, min)
    @j += 1
    return unless max && max != ''

    puts "#{@j} #{"\e[34m+\e[0m" * min.to_i.abs}#{"\e[31m+\e[0m" * max.to_i.abs} #{min.to_i}C - #{max.to_i}C"
  end
end
