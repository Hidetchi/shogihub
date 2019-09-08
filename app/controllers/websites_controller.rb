class WebsitesController < ApplicationController
  before_action :set_website, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  authorize_resource

  respond_to :html

  def index
    @websites = Website.includes(:country).all.order('countries.region_id', scale: :desc)
    respond_with(@websites)
  end

  def show
    respond_with(@website)
  end

  def new
    @website = Website.new
    respond_with(@website)
  end

  def edit
  end

  def create
    @website = Website.new(website_params)
    @website.save
    @website.create_activity(action: 'create', owner: current_user)
    respond_with(@website)
  end

  def update
    @website.update(website_params)
    respond_with(@website)
  end

  def destroy
    @website.destroy
    respond_with(@website)
  end

  private
    def set_website
      @website = Website.find(params[:id])
    end

    def website_params
      params.require(:website).permit(:name, :url, :owner, :description, :country_id, :language_id, :scale, :frequency, :contents_introduction, :contents_news_internal, :contents_news_external, :contents_forum, :contents_lesson, :contents_database, :contents_shop)
    end
end
