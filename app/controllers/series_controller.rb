class SeriesController < ApplicationController
  def index
    @all_stats = SeriesStatistics.from_series_list(Series.includes(:games))
  end

  def show
    @series = Series.find(params[:id])
  end

  def new
    @series = Series.new
    3.times { @series.games.build }
  end

  def create
    @series = Series.new(series_params)

    params[:series][:games_attributes].values.each do |game_attributes|
      @series.games.build(game_attributes)
    end

    if @series.save
      redirect_to series_index_path
    else
      render "new"
    end
  end

  private
    def series_params
      params.require(:series).permit(:date)
    end
end
