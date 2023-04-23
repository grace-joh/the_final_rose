class Contestant < ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  def season_number
    bachelorette.season_number
  end

  def season_description
    bachelorette.season_description
  end

  def self.average_age
    average(:age).round(1)
  end

  def self.unique_hometown_list
    pluck(:hometown).uniq
  end

  def self.unique_city_list
    unique_hometown_list.map do |hometown|
      hometown.split(', ').first
    end
  end
end
