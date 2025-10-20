class SportsController < ApplicationController
  before_action :set_sport, only: [:show, :edit, :update, :destroy]

  def index
    @sports = Sport.order(:name)
  end

  def show; end
  def new  ; @sport = Sport.new end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      redirect_to @sport, notice: "Sport created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @sport.update(sport_params)
      redirect_to @sport, notice: "Sport updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  if @sport.destroy
    redirect_to sports_path, notice: "Sport deleted."
  else
    redirect_to @sport, alert: @sport.errors.full_messages.to_sentence
  end
end

  private

  def set_sport
    @sport = Sport.find(params[:id])   # uses /sports/:id
  end

  def sport_params
    params.require(:sport).permit(:name)
  end
end