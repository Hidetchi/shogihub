class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  authorize_resource

  respond_to :html

  def index
    @past = params[:past]
    t = Time.new - 24*60*60
    if (request.format.symbol == :atom)
      @events = Event.order(updated_at: :desc)
    elsif (@past)
      @events = Event.where('end_time < ?', t).order(start_time: :desc).page(params[:page])
    else
      @events = Event.where('end_time >= ?', t).order(:start_time).page(params[:page])
    end
    respond_to :html, :atom
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    @event.create_activity(action: 'create', owner: current_user, parameters: {description: @event.description})
    respond_with(@event)
  end

  def update
    last_updated_at = @event.updated_at
    @event.update(event_params)
    @event.create_activity(action: 'update', owner: current_user, parameters: {description: @event.description}) if @event.updated_at - last_updated_at > 24*60*60
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :country_id, :venue, :address, :latitude, :longitude, :organizer, :url, :report_url, :contact, :description, :category, :canceled, :scale, event_players_attributes: [:id, :player_id, :_destroy])
    end
end
