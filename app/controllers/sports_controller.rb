class SportsController < ApplicationController
  def index
    @sports = Sport.all
  end

  def show
    @sport = Sport.find(params[:id])
  end

  def new
  end

  def edit
  end
end
