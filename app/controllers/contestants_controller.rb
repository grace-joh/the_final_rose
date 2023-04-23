class ContestantsController < ApplicationController
  before_action :find_bachelorette, only: [:index]

  def index
  end

  private

  def find_bachelorette
    @bach = Bachelorette.find(params[:bachelorette_id])
  end
end
