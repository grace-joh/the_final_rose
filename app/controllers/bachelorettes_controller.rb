class BachelorettesController < ApplicationController
  before_action :find_bachelorette, only: [:show]

  def show
  end

  private

  def find_bachelorette
    @bach = Bachelorette.find(params[:id])
  end
end
