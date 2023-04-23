class ContestantsController < ApplicationController
  before_action :find_bachelorette, only: [:index]
  before_action :find_contestant, only: [:show]

  def index
  end

  def show
  end

  private

  def find_bachelorette
    @bach = Bachelorette.find(params[:bachelorette_id])
  end

  def find_contestant
    @contestant = Contestant.find(params[:id])
  end
end
