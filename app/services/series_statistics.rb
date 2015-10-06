class SeriesStatistics
  def self.from_series_list(series_list)
    total_games = 0
    total_score = 0

    series_list.map do |series|
      total_games += series.games.size
      total_score += series.total

      SeriesStatistics.new(series, total_score / total_games)
    end
  end

  attr_reader :series, :running_average

  def initialize(series, running_average)
    @series, @running_average = series, running_average
  end
end
