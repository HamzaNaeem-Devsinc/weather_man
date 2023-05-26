# frozen_string_literal: true

# print_chart
module PrintWeatherChart
  def self.generate_monthly_chart(data_array, date)
    print_output(data_array, date)
    print_output_bonus(data_array, date)
  end

  def self.print_output(data_array, date)
    @i = 0
    puts date
    data_array.each do |row|
      find_max_temperature_and_date_in_array(ret(row, 1), ret(row, 3))
    end
  end

  def self.print_output_bonus(data_array, date)
    @j = 0
    puts '---------Bonus Part---------'
    puts date
    data_array.each do |row|
      bonus(ret(row, 1), ret(row, 3))
    end
  end

  def self.ret(row, index)
    row.split(',')[index].to_i
  end

  def self.date_ret(row, index)
    row.split(',')[index]
  end

  def self.find_max_temperature_and_date_in_array(max, min)
    @i += 1
    puts "#{@i} #{"\e[31m+\e[0m" * max.abs} #{max}C"
    puts "#{@i} #{"\e[34m+\e[0m" * min.abs} #{min}C"
  end

  def self.bonus(max, min)
    @j += 1
    puts "#{@j} #{"\e[34m+\e[0m" * min.abs}#{"\e[31m+\e[0m" * max.abs} #{min}C - #{max}C"
  end
end
