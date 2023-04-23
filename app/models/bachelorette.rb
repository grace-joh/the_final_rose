class Bachelorette < ApplicationRecord
  has_many :contestants

  def avg_contestant_age
    contestants.average_age
  end

  def contestant_city_list
    contestants.unique_city_list.join(', ')
  end
end
