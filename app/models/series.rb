class Series < ActiveRecord::Base
  has_many :games
  accepts_nested_attributes_for :games

  validates :date, presence: true

  attr_accessor :running_average

  def total
    total = 0;
    self.games.each do |game|
      total += game.score
    end
    total
  end

  def average
    self.total / self.games.size
  end
end
