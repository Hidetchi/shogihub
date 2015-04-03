class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :admin_only, only: [:destroy]

  respond_to :html

  def index
    @clubs = Club.all.order(scale: :desc)
    @hash = Gmaps4rails.build_markers(@clubs) do |club, marker|
      marker.lat club.latitude
      marker.lng club.longitude
      marker.infowindow club.name
      marker.json({title: club.name})
    end
    respond_with(@clubs)
  end

  def show
    respond_with(@club)
  end

  def new
    @club = Club.new
    respond_with(@club)
  end

  def edit
  end

  def create
    @club = Club.new(club_params)
    @club.save
    respond_with(@club)
  end

  def update
    @club.update(club_params)
    respond_with(@club)
  end

  def destroy
    @club.destroy
    respond_with(@club)
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(:name, :country_id, :address, :latitude, :longitude, :scale, :frequency, :url, :contact, :email)
    end
end
