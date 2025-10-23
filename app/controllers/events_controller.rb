class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authorize_event_owner!, only: [:edit, :update, :destroy]
  def index
    @events = Event.includes(:sport, :host).order(event_time: :asc)
  end

  def show; end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    # Prefer logged-in user if you have sessions set up
    @event.host = current_user if respond_to?(:current_user) && current_user

    # Fallback: assign or create a Guest user so host is never nil
    if @event.host.nil?
      guest = User.find_or_create_by!(email: "guest@activemeet.local") do |u|
        u.name = "Guest"
        u.password = SecureRandom.hex(12)
        u.role = :member
      end
      @event.host = guest
    end

    if @event.save
      redirect_to @event, notice: "Event created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event deleted."
  end

  private

  def set_event
    @event = Event.find_by(id: params[:id])   # avoid exception
    redirect_to events_path, alert: "Event not found." unless @event
  end

  def event_params
    params.require(:event).permit(:sport_id, :location, :event_time, :players_needed, :description)
  end

  def authorize_event_owner!
    return if current_user&.admin?
    return if current_user && @event.host_id == current_user.id
    redirect_to events_path, alert: "You are not allowed to modify this event."
  end
end