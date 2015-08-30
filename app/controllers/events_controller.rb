class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :admin_only, only: [:destroy]

  respond_to :html

  def index
    @past = params[:past]
    t = Time.new - 24*60*60
    if (request.format.symbol == :atom)
      @events = Event.order(updated_at: :desc)
    elsif (@past)
      @events = Event.where('end_time < ?', t).order(start_time: :desc)
    else
      @events = Event.where('end_time >= ?', t).order(:start_time)
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
    respond_with(@event)
  end

  def update
    @event.update(event_params)
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
