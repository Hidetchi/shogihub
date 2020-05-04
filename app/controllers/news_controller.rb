class NewsController < ApplicationController
  before_action :set_anonymous_token, only: [:index, :show, :like]
  before_action :set_news, only: [:show, :edit, :update, :destroy, :instruction, :like]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :instruction, :destroy]
  authorize_resource

  respond_to :html

  def index
    @news = News.where(status: 3).order(published_at: :desc).page(params[:page]).per(10)
  end

  def index_headlines
    @news = News.where(status: 3).order(published_at: :desc).page(params[:page]).per(50)
  end

  def backyard
    @filter_mode = params[:filter].nil? ? nil : params[:filter].to_i
    @news = News.order(published_at: :desc).page(params[:page]).per(50)
    if @filter_mode == 1
      @news = @news.where.not(instruction:2)
    elsif @filter_mode == 2
      @news = @news.where(translator_id:current_user.id)
    elsif @filter_mode == 3
      @news = @news.where.not(translator_id:nil, status:3)
    end
  end

  def statistics
    @users = User.where("role > 0").order(role: :desc)
  end

  def show
    respond_with(@news)
  end

  def new
    @news = News.new
    @news.category = 0
    respond_with(@news)
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    @news.entry_id = News.count == 0 ? 1 : News.last.id + 1
    @news.save
    respond_with(@news)
  end

  def update
    @news.update(news_params)
    if params[:news][:status].to_i == 3
      @news.store_publish_activity(current_user)
    end
    respond_with(@news)
  end

  def preview
    @preview_news = News.new(content_en: params[:content_en])
  end

  def destroy
    @news.destroy
    respond_with(@news)
  end

  def instruction
    @news.update_attributes(instruction: params[:instruction])
    respond_with(@news) unless request.xhr?
  end

  def like
    @news.like(current_user, @anonymous_token)
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params[:news]["expires_at(1i)"] = "" if params[:news][:use_expiration] == "0"
      params.require(:news).permit(:entry_id, :url, :published_at, :title_ja, :title_en, :content_ja, :content_en, :category, :status, :translator_id, :proofreader_id, :expires_at)
    end

    def set_anonymous_token
      unless user_signed_in?
        cookies.permanent[:anonymous_token] = SecureRandom.hex(8) unless cookies.permanent[:anonymous_token].present?
        @anonymous_token = cookies.permanent[:anonymous_token]
      end
    end
end
