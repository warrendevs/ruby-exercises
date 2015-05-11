class WeatherData
  def self.HighestDiff file_name
    info = File.read file_name
    info_lines = info.lines
    data_lines = info_lines.slice(2, (info_lines.length-2))

    largest_diff_day = 0
    largest_diff = 0
    data_lines.each do |line|
      line.chomp!
      columns = line.split /\s+/
      diff = columns[2].to_i - columns[3].to_i
      # puts "column[1]: " + columns[1] + " column[2]: " + columns[2] + " column[3]: " + columns[3]
      # puts "diff: " + diff.to_s
      if diff > largest_diff
        largest_diff = diff
        largest_diff_day = columns[1]
      end
    end
    largest_diff_day
  end
end

puts "Highest Temp. Difference: " + "Day " + WeatherData.HighestDiff("weather_data.txt").to_s
